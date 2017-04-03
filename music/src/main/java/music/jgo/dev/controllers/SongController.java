package music.jgo.dev.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import music.jgo.dev.daoImpl.SongDaoImpl;
import music.jgo.dev.models.Song;

@CrossOrigin(maxAge = 3600)
@RestController
public class SongController {
	
	SongDaoImpl songDaoImp = new SongDaoImpl();

    @RequestMapping(value = "/songs", method = RequestMethod.GET)
    public List<Song> getAllSongs(){
    	List<Song> Songs =  new ArrayList<Song>();
    	Songs=songDaoImp.getAll();
    	
    	return Songs;
    	

    }
    
    
    @RequestMapping(value = "/song/{id}" , method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Song findSongById(@PathVariable int id ) {
    	
    	
    	Song pepito =null;
    	pepito= songDaoImp.getById(id);
 
        return pepito;
}
    
    @RequestMapping(value="/songnew/{songName}/{songAutor}/{songYear}",method = {RequestMethod.GET, RequestMethod.POST},headers="Accept=application/json")
    public List<Song> createSong(@PathVariable String songName,@PathVariable String songAutor,@PathVariable String songYear) throws ParseException {
    	
		Song lola = new Song();
		System.out.println("creating");

		lola.setSongName(songName);
		lola.setSongAutor(songAutor);
		lola.setSongYear(songYear);

		songDaoImp.save(lola);

		System.out.println("creating " + lola);
    	
    	return songDaoImp.getAll();
    }    
    
    @RequestMapping(value = "/deletesong/{id}",method=RequestMethod.DELETE)
    public void delete(@PathVariable int id) {
    	songDaoImp.deleteById(id);
    	

    }
    
    @RequestMapping(value="/updatesong/{songId}/{songName}/{songAutor}/{songYear}",method = {RequestMethod.GET, RequestMethod.PUT})
    public Song update(@PathVariable int songId,@PathVariable String songName,@PathVariable String songAutor,@PathVariable String songYear) throws ParseException {
    	Song pepito = new Song();
    	pepito= songDaoImp.getById(songId);
    	System.out.println(pepito);

    	pepito.setSongName(songName);
    	pepito.setSongAutor(songAutor);
    	pepito.setSongYear(songYear);
    	System.out.println(pepito);
    	songDaoImp.update(pepito);
    	return pepito;
    }    
       
}
