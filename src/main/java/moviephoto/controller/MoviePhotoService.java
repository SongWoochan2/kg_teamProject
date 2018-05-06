package moviephoto.controller;

import java.util.ArrayList;

import movie.bean.MovieDTO;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.bean.MoviePosterDTO;

public interface MoviePhotoService {
	ArrayList<MoviePhotoDTO> moviePhotoList(int startNum, int endNum, int movie_code);
	ArrayList<MoviePosterDTO> moviePosterList(ArrayList<String> code_list, int m_startNum, int m_endNum);
	int moviePhotoInsert(MoviePhotoDTO moviePhotoDTO);
	int moviePhotoModify(MoviePhotoDTO moviePhotoDTO);
	int getTotalA(int movie_code);
	int moviePhotoDelete(int movie_photo_code);
	MoviePhotoDTO moviePosterView(int movie_code);
}
