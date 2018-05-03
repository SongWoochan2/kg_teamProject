package reserve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import movie.bean.MovieDTO;
import reserve.bean.MemberReserveVO;
import reserve.bean.ReservedSeatVO;
import reserve.bean.SeatNumVO;
import reserve.dao.ReserveDAO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	ReserveDAO reserveDAO;


	
	
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
		return reserveDAO.getTheaterList(show_date, movie_code);
	}

	@Override
	public List<ShowPresentAllVO> getDateList(int movie_code, int theater_code) {
		return reserveDAO.getDateList(movie_code, theater_code);
	}

	@Override
	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code, String show_date) {
		return reserveDAO.getShowList(movie_code, theater_code, show_date);
	}

	@Override
	public List<ReservedSeatVO> getreservedSeats_list() {
		return reserveDAO.getreservedSeats_list();
	}
	
	@Override
	public List<ReservedSeatVO> getreservedSeats(int show_present_code) {
		return reserveDAO.getreservedSeats(show_present_code);
	}
	
	
	public List<SeatNumVO> getReservedSeatOfShow(int movie_code, int theater_code, String show_date){
		return reserveDAO.getReservedSeatOfShow(movie_code, theater_code, show_date);
	}


	public List<SeatNumVO> getTotalSeatOfShow(int movie_code, int theater_code, String show_date){
		return reserveDAO.getTotalSeatOfShow(movie_code, theater_code, show_date);
	}
	
	
	@Override
	public int insertMemberReserve(MemberReserveVO memberReserveVO) {
		return reserveDAO.insertMemberReserve(memberReserveVO);
	}

	@Override
	public Integer movieReserveCheck(String member_id, int movie_code) {
		return reserveDAO.movieReserveCheck(member_id, movie_code);
	}
	
	
}
