package reserve.controller;

import java.util.List;
import java.util.Map;

import movie.bean.MovieDTO;
import reserve.bean.MemberReserveVO;
import reserve.bean.ReservedSeatVO;
import reserve.bean.SeatNumVO;
import reserve.bean.SeatTypeVO;
import reserve.bean.TimeTypeVO;
import savingList.bean.SavingListDTO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;


public interface ReserveService {
	

	
	
	///////////// 우찬


	public List<MovieDTO> getMovieList(String show_date, int theater_code, int show_time);

	public List<TheaterDTO> getTheaterList(String show_date, int movie_code, int show_time);

	public List<ShowPresentAllVO> getDateList(int movie_code, int theater_code, int show_time);
	
	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code, String show_date, int show_time);

	public List<ReservedSeatVO> getreservedSeats_list();
	
	public List<ReservedSeatVO> getreservedSeats(int show_present_code);

	public List<SeatNumVO> getReservedSeatOfShow(int movie_code, int theater_code, String show_date);

	public int deleteMemberReserve(MemberReserveVO memberReserveVO);
	
	public int updateMemberReserve(MemberReserveVO memberReserveVO);

	public int insertSavingList(SavingListDTO savingListDTO);

	public MemberReserveVO selectMemberReserve(MemberReserveVO memberReserveVO);

	public List<SeatNumVO> getTotalSeatOfShow(int movie_code, int theater_code, String show_date);
	
	public int insertMemberReserve(MemberReserveVO memberReserveVO);
	
	// 재환
	
	public Integer movieReserveCheck(String member_id, int movie_code);
	

	public Map<Integer, SeatTypeVO> getSeatType();
	
	public Map<Integer, TimeTypeVO> getTimeType();
	
	
}
