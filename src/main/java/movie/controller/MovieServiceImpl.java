package movie.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDAO movieDAO;

	@Override
	public int movieInsert(MovieDTO movieDTO) {
		
		return movieDAO.movieInsert(movieDTO);
	}
	
	public int getTotalA() {
		return movieDAO.getTotalA();
	}

	@Override
	public ArrayList<MovieDTO> movieList(int startNum, int endNum) {
		return (ArrayList<MovieDTO>) movieDAO.movieList(startNum, endNum);
	}
}
