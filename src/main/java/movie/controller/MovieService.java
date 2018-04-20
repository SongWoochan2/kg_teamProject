package movie.controller;

import java.util.ArrayList;

import movie.bean.MovieDTO;

public interface MovieService {
	int movieModify(MovieDTO movieDTO);
	int movieDelete(int movie_code);
	int movieInsert(MovieDTO movieDTO);
	int getTotalA();
	ArrayList<MovieDTO> movieList(int startNum, int endNum);
	MovieDTO movieView(int movie_code);
}
