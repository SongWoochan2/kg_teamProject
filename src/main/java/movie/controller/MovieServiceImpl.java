package movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.bean.MovieDTO;
import movie.bean.ReserveRank;
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

	@Override
	public int updateEvaluatScore(int movie_code, int acc_evaluat_score) {
		return movieDAO.updateEvaluatScore(movie_code, acc_evaluat_score);
	}

	@Override
	public ArrayList<MovieDTO> movieNonOpenRank(int startNum, int endNum) {
		return (ArrayList<MovieDTO>) movieDAO.movieNonOpenRank(startNum, endNum);
	}

	@Override
	public ArrayList<MovieDTO> movieScoreRank(int startNum, int endNum) {
		return (ArrayList<MovieDTO>) movieDAO.movieScoreRank(startNum, endNum);
	}

	@Override
	public int updateEvaluatNum(int movie_code, int movie_evaluat_num) {
		return movieDAO.updateEvaluatNum(movie_code, movie_evaluat_num);
	}

	@Override
	public ArrayList<MovieDTO> movieAudienceRank(int startNum, int endNum) {
		return (ArrayList<MovieDTO>) movieDAO.movieAudienceRank(startNum, endNum);
	}

	@Override
	public Integer allReserveCount() {
		return movieDAO.allReserveCount();
	}

	@Override
	public ArrayList<ReserveRank> movieReserveRank(int startNum, int endNum) {
		return (ArrayList<ReserveRank>) movieDAO.movieReserveRank(startNum, endNum);
	}

	@Override
	public Integer movieReserveNum(int movie_code) {
		return movieDAO.movieReserveNum(movie_code);
	}

	@Override
	public int movieNonOpenTotal() {
		return movieDAO.movieNonOpenTotal();
	}
	
}
