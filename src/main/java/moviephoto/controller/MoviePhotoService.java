package moviephoto.controller;

import java.util.ArrayList;

import movie.bean.MovieDTO;
import moviephoto.bean.MoviePhotoDTO;

public interface MoviePhotoService {
	ArrayList<MoviePhotoDTO> moviePhotoList(int startNum, int endNum, int movie_code);
	int moviePhotoInsert(MoviePhotoDTO moviePhotoDTO);
	int moviePhotoModify(MoviePhotoDTO moviePhotoDTO);
	int getTotalA(int movie_code);
	int moviePhotoDelete(int movie_photo_code);
	ArrayList<MoviePhotoDTO> moviePosterView(int movie_code);
}
