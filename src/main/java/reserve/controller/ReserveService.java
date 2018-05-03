package reserve.controller;

import java.util.List;

import movie.bean.MovieDTO;
import reserve.bean.MemberReserveVO;
import reserve.bean.ReservedSeatVO;
import reserve.bean.SeatNumVO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;


public interface ReserveService {
	

	
	
	///////////// 우찬


	public List<MovieDTO> getMovieList(String show_date, int theater_code);

	public List<TheaterDTO> getTheaterList(String show_date, int movie_code);

	public List<ShowPresentAllVO> getDateList(int movie_code, int theater_code);
	
	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code, String show_date);

	public List<ReservedSeatVO> getreservedSeats_list();
	
	public List<ReservedSeatVO> getreservedSeats(int show_present_code);

	public List<SeatNumVO> getReservedSeatOfShow(int movie_code, int theater_code, String show_date);


	public List<SeatNumVO> getTotalSeatOfShow(int movie_code, int theater_code, String show_date);
	
	public int insertMemberReserve(MemberReserveVO memberReserveVO);
	
	// 재환
	
	public Integer movieReserveCheck(String member_id, int movie_code);
}
