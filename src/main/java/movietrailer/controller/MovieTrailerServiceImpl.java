package movietrailer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movietrailer.bean.MovieTrailerDTO;
import movietrailer.dao.MovieTrailerDAO;
@Service
public class MovieTrailerServiceImpl implements MovieTrailerService{
	@Autowired
	private MovieTrailerDAO movieTrailerDAO;
	
	@Override
	public ArrayList<MovieTrailerDTO> movieTrailerList(int startNum, int endNum, int movie_code) {
		return (ArrayList<MovieTrailerDTO>) movieTrailerDAO.movieTrailerList(startNum, endNum, movie_code);
	}

	@Override
	public int getTotalA(int movie_code) {
		return movieTrailerDAO.getTotalA(movie_code);
	}

	@Override
	public int movieTrailerDelete(int movie_trailer_code) {
		return movieTrailerDAO.movieTrailerDelete(movie_trailer_code);
	}

	@Override
	public int movieTrailerInsert(MovieTrailerDTO movieTrailerDTO) {
		return movieTrailerDAO.movieTrailerInsert(movieTrailerDTO);
	}
	
	

}
