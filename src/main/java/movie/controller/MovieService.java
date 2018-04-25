package movie.controller;

import java.util.ArrayList;
import java.util.List;

import movie.bean.MovieDTO;

public interface MovieService {
	int movieModify(MovieDTO movieDTO);
	int movieDelete(int movie_code);
	int movieInsert(MovieDTO movieDTO);
	int getTotalA();
	ArrayList<MovieDTO> movieList(int startNum, int endNum);
	MovieDTO movieView(int movie_code);
	public List<MovieDTO> movieSearchByName(String movie_name);
}
