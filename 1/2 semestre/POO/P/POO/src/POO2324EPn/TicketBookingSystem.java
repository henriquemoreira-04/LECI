import java.util.*;

public class TicketBookingSystem implements ITicketBookingSystem {
    private List<EventOccurrence> occurrences = new ArrayList<>();
    private Map<Integer, Ticket> tickets = new HashMap<>();

    @Override
    public boolean addEventOccurrence(Event event, Place place, String datetime) {
        for (EventOccurrence e : occurrences) {
            if (e.getPlace().equals(place) && e.getDateTime().toString().equals(datetime.replace(" ", "T"))) {
                return false;
            }
        }
        occurrences.add(new EventOccurrence(event, place, datetime));
        return true;
    }

    @Override
    public int bookTickets(int eventId, int numberOfTickets) {
        for (EventOccurrence e : occurrences) {
            if (e.getId() == eventId) {
                if (e.reserveTickets(numberOfTickets)) {
                    Ticket ticket = new Ticket(e, numberOfTickets);
                    tickets.put(ticket.getReference(), ticket);
                    return ticket.getReference();
                } else {
                    return -1;
                }
            }
        }
        return -1;
    }

    @Override
    public boolean cancelTickets(int ticketReference) {
        Ticket ticket = tickets.remove(ticketReference);
        if (ticket == null) return false;
        ticket.getOccurrence().returnTickets(ticket.getNumberOfTickets());
        return true;
    }

    @Override
    public Collection<EventOccurrence> getEventOccurrences() {
        return new ArrayList<>(occurrences);
    }
}
