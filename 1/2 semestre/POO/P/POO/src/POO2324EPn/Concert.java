public class Concert extends Event {
    private String artist;

    public Concert(String artist, String name, int duration) {
        super(name, duration);
        this.artist = artist;
    }

    @Override
    public String getDescription() {
        return String.format("%s [%d minutes], concert by %s", getName(), getDuration(), artist);
    }
}

//subtipo evento de musica , adicionalmente representado por el nombre del artista