package reserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.bean.MovieDTO;
import reserve.bean.ReserveDTO;
import reserve.dao.ReserveDAO;
import showPresent.bean.ShowPresentAllVO;
import theater.dao.TheaterDAO;
import theater.bean.TheaterDTO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	ReserveDAO reserveDAO;

	@Override
	public ReserveDTO reserveView(int show_present_code) {
		return reserveDAO.reserveView(show_present_code);
	}

	@Override
	public ArrayList<ReserveDTO> reserveList(String show_date, int theater_code) {
		return (ArrayList<ReserveDTO>) reserveDAO.reserveList(show_date, theater_code);
	}

	@Override
	public void updateHit(int show_present_code) {
		return;
		
	}
	
	@Override
	public int getTotalA() {
		return reserveDAO.getTotalA();
	}


	
	
	///////////// 우찬

	@Override
	public List<MovieDTO> getMovieList(String show_date, int theater_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("show_date", show_date);
		map.put("theater_code", theater_code);
		return reserveDAO.getMovieList(show_date, theater_code);
	}

	@Override
	public List<TheaterDTO> getTheaterList(String show_date, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("show_date", show_date);
		map.put("movie_code", movie_code);
		return reserveDAO.getTheaterList(show_date, movie_code);
	}

	@Override
	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code) {
		Map<String, Integer> map = new HashMap<>();
		map.put("movie_code", movie_code);
		map.put("theater_code", theater_code);
		return reserveDAO.getShowList(movie_code, theater_code);
	}
	
}
