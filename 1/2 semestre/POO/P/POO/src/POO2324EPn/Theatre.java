public class Theatre extends Event {
    private String author;
    private String company;

    public Theatre(String name, String author, String company, int duration) {
        super(name, duration);
        this.author = author;
        this.company = company;
    }

    @Override
    public String getDescription() {
        return String.format("%s [%d minutes], theatre play by %s, performed by %s", getName(), getDuration(), author, company);
    }
}

//subtipo de evento , adicionalmente representado por el nombre del autor y nombre de la compania 