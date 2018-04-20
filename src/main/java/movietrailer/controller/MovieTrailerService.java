package movietrailer.controller;

import java.util.ArrayList;

import movietrailer.bean.MovieTrailerDTO;



public interface MovieTrailerService {
	ArrayList<MovieTrailerDTO> movieTrailerList(int startNum, int endNum, int movie_code);
	int getTotalA(int movie_code);
	int movieTrailerDelete(int movie_trailer_code);
	int movieTrailerInsert(MovieTrailerDTO movieTrailerDTO);
}
