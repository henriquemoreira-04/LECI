import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class EventOccurrence {
    private static int nextId = 1000;
    private int id;
    private Event event;
    private Place place;
    private LocalDateTime datetime;
    private int availableTickets;

    public EventOccurrence(Event event, Place place, String datetimeStr) {
        this.id = nextId++;
        this.event = event;
        this.place = place;
        this.datetime = LocalDateTime.parse(datetimeStr.replace(" ", "T"));
        this.availableTickets = place.getCapacity();
    }

    public int getId() { return id; }
    public Event getEvent() { return event; }
    public Place getPlace() { return place; }
    public LocalDateTime getDateTime() { return datetime; }
    public int getAvailableTickets() { return availableTickets; }

    public boolean reserveTickets(int quantity) {
        if (availableTickets >= quantity) {
            availableTickets -= quantity;
            return true;
        }
        return false;
    }

    public void returnTickets(int quantity) {
        availableTickets += quantity;
    }

    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return String.format("%s at %s, %s, %d tickets available",
                event.getDescription(), place.getName(), datetime.format(formatter), availableTickets);
    }
}

//representa la ocurrencia de un evento en especifico 