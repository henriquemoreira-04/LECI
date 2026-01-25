public class Ticket {
    private static int nextReference = 1;
    private int reference;
    private EventOccurrence occurrence;
    private int numberOfTickets;

    public Ticket(EventOccurrence occurrence, int numberOfTickets) {
        this.reference = nextReference++;
        this.occurrence = occurrence;
        this.numberOfTickets = numberOfTickets;
    }

    public int getReference() { return reference; }
    public EventOccurrence getOccurrence() { return occurrence; }
    public int getNumberOfTickets() { return numberOfTickets; }
}
