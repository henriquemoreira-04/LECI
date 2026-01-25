public class Cinema extends Event {
    private String director;
    private int year;
    private String[] actors;

    public Cinema(String name, String director, int year, String[] actors, int duration) {
        super(name, duration);
        this.director = director;
        this.year = year;
        this.actors = actors;
    }

    @Override
    public String getDescription() {
        return String.format("%s [%d minutes], a %d movie by %s, with %s",
                getName(), getDuration(), year, director, String.join(", ", actors));
    }
}

//subtipo de evento , adicionalmente representado por el nombre del director,ano,lista de actores
