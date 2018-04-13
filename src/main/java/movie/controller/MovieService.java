package movie.controller;

import java.util.ArrayList;

import movie.bean.MovieDTO;

public interface MovieService {
	int movieInsert(MovieDTO movieDTO);
	int getTotalA();
	ArrayList<MovieDTO> movieList(int startNum, int endNum);
}
