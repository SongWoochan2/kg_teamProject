package movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import movie.bean.MovieDTO;

public interface MovieService {
	int movieModify(MovieDTO movieDTO);
	int updateEvaluatScore(int movie_code, int acc_evaluat_score);
	int movieDelete(int movie_code);
	int movieInsert(MovieDTO movieDTO);
	int getTotalA();
	int goodUpdate(int movie_code, int good);
	ArrayList<MovieDTO> movieList(int startNum, int endNum);
	ArrayList<MovieDTO> presentMovieList(ArrayList<String> code_list, int m_startNum, int m_endNum);
	MovieDTO movieView(int movie_code);
	ArrayList<MovieDTO> movieFinder(Map<String, Object> map);
	public List<MovieDTO> movieSearchByName(String movie_name);
	int FinderTotalA(Map<String, Object> map);
}
