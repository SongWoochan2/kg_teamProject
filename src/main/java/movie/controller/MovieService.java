package movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import movie.bean.MovieDTO;
import movie.bean.ReserveRank;

public interface MovieService {
	int movieModify(MovieDTO movieDTO);
	int updateEvaluatScore(int movie_code, int acc_evaluat_score);
	int updateEvaluatNum(int movie_code, int movie_evaluat_num);
	int movieDelete(int movie_code);
	int movieInsert(MovieDTO movieDTO);
	int getTotalA();
	int movieNonOpenTotal();
	Integer allReserveCount();
	Integer movieReserveNum(int movie_code);
	int goodUpdate(int movie_code, int good);
	ArrayList<MovieDTO> movieList(int startNum, int endNum);
	ArrayList<MovieDTO> presentMovieList(ArrayList<Integer> code_list, int m_startNum, int m_endNum);
	MovieDTO movieView(int movie_code);
	ArrayList<MovieDTO> movieFinder(Map<String, Object> map);
	public List<MovieDTO> movieSearchByName(String movie_name);
	int FinderTotalA(Map<String, Object> map);
	ArrayList<MovieDTO> movieNonOpenRank(int startNum, int endNum);
	ArrayList<MovieDTO> movieScoreRank(int startNum, int endNum);
	ArrayList<MovieDTO> movieAudienceRank(int startNum, int endNum);
	ArrayList<ReserveRank> movieReserveRank(int startNum, int endNum);
}
