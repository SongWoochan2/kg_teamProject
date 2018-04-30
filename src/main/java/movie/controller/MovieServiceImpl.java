package movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Override
	public MovieDTO movieView(int movie_code) {
		return movieDAO.movieView(movie_code);
	}

	@Override
	public int movieDelete(int movie_code) {
		
		return movieDAO.movieDelete(movie_code);
	}

	@Override
	public int movieModify(MovieDTO movieDTO) {
		return movieDAO.movieModify(movieDTO);
	}

	@Override
	public List<MovieDTO> movieSearchByName(String movie_name) {
		return movieDAO.movieSearchByName(movie_name);
	}

	@Override
	public ArrayList<MovieDTO> movieFinder(Map<String, Object> map) {
		return (ArrayList<MovieDTO>) movieDAO.movieFinder(map);
	}

	@Override
	public int FinderTotalA(Map<String, Object> map) {
		return movieDAO.FinderTotalA(map);
	}

	@Override
	public int goodUpdate(int movie_code, int good) {
		return movieDAO.goodUpdate(movie_code, good);
	}

	@Override
	public ArrayList<MovieDTO> presentMovieList(ArrayList<String> code_list, int m_startNum, int m_endNum) {
		return (ArrayList<MovieDTO>) movieDAO.presentMovieList(code_list,m_startNum,m_endNum);
	}
	
}
