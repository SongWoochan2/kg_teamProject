package moviephoto.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.bean.MovieDTO;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.dao.MoviePhotoDAO;


@Service
public class MoviePhotoServiceImpl implements MoviePhotoService{
	@Autowired
	private MoviePhotoDAO moviePhotoDAO;

	@Override
	public ArrayList<MoviePhotoDTO> moviePhotoList(int startNum, int endNum, int movie_code) {
		return (ArrayList<MoviePhotoDTO>) moviePhotoDAO.moviePhotoList(startNum, endNum, movie_code);
	}

	@Override
	public int getTotalA(int movie_code) {
		return moviePhotoDAO.getTotal(movie_code);
	}

	@Override
	public int moviePhotoInsert(MoviePhotoDTO moviePhotoDTO) {
		return moviePhotoDAO.moviePhotoInsert(moviePhotoDTO);
	}

	@Override
	public int moviePhotoModify(MoviePhotoDTO moviePhotoDTO) {
		return moviePhotoDAO.moviePhotoModify(moviePhotoDTO);
	}

	@Override
	public int moviePhotoDelete(int movie_photo_code) {
		return moviePhotoDAO.moviePhotoDelete(movie_photo_code);
	}

	@Override
	public MoviePhotoDTO moviePosterView(int movie_code) {
		return (MoviePhotoDTO) moviePhotoDAO.moviePosterView(movie_code);
	}

	
}
