package music.jgo.dev.models;

public class Song {

    private long songId;
    private String songName;
    public long getSongId() {
		return songId;
	}
	public String getSongName() {
		return songName;
	}
	public String getSongAutor() {
		return songAutor;
	}
	public String getSongYear() {
		return songYear;
	}

	private String songAutor;
    private String songYear;

	public void setSongId(long songId) {
		this.songId = songId;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public void setSongAutor(String songAutor) {
		this.songAutor = songAutor;
	}
	public void setSongYear(String songYear) {
		this.songYear = songYear;
	}
	public Song(){
	}    
    

    public Song(long songId, String songName, String songAutor, String songYear) {
        this.songId = songId;
        this.songName = songName;
        this.songAutor = songAutor;
        this.songYear = songYear;
    }
    public long getId() {
        return songId;
    }

    public String getName() {
        return songName;
    }
}
