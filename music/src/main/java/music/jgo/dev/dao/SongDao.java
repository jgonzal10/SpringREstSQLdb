package music.jgo.dev.dao;

import java.util.List;

import music.jgo.dev.models.Song;

public interface SongDao {

	public void save(Song p);
    //Read
    public Song getById(int id);
    //Update
    public void update(Song p);
    //Delete
    public void deleteById(int id);
    //Get All
    public List<Song> getAll();
}
