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
import reserve.bean.SeatTypeVO;
import reserve.bean.TimeTypeVO;
import reserve.dao.ReserveDAO;
import savingList.bean.SavingListDTO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	ReserveDAO reserveDAO;


	
	
	///////////// 우찬

	@Override
	public List<MovieDTO> getMovieList(String show_date, int theater_code, int show_time) {
		return reserveDAO.getMovieList(show_date, theater_code, show_time);
	}

	@Override
	public List<TheaterDTO> getTheaterList(String show_date, int movie_code, int show_time) {
		return reserveDAO.getTheaterList(show_date, movie_code, show_time);
	}

	@Override
	public List<ShowPresentAllVO> getDateList(int movie_code, int theater_code, int show_time) {
		return reserveDAO.getDateList(movie_code, theater_code, show_time);
	}

	@Override
	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code, String show_date, int show_time) {
		return reserveDAO.getShowList(movie_code, theater_code, show_date, show_time);
	}

	@Override
	public List<ReservedSeatVO> getreservedSeats_list() {
		return reserveDAO.getreservedSeats_list();
	}
	
	@Override
	public List<ReservedSeatVO> getreservedSeats(int show_present_code) {
		return reserveDAO.getreservedSeats(show_present_code);
	}
	

	@Override
	public List<SeatNumVO> getReservedSeatOfShow(int movie_code, int theater_code, String show_date){
		return reserveDAO.getReservedSeatOfShow(movie_code, theater_code, show_date);
	}


	@Override
	public List<SeatNumVO> getTotalSeatOfShow(int movie_code, int theater_code, String show_date){
		return reserveDAO.getTotalSeatOfShow(movie_code, theater_code, show_date);
	}

	@Override
	public int deleteMemberReserve(MemberReserveVO memberReserveVO) {
		return reserveDAO.deleteMemberReserve(memberReserveVO);
	}
	
	@Override
	public int updateMemberReserve(MemberReserveVO memberReserveVO) {
		return reserveDAO.updateMemberReserve(memberReserveVO);
	}

	@Override
	public int insertSavingList(SavingListDTO savingListDTO) {
		return reserveDAO.insertSavingList(savingListDTO);
	}

	@Override
	public MemberReserveVO selectMemberReserve(MemberReserveVO memberReserveVO) {
		return reserveDAO.selectMemberReserve(memberReserveVO);
	}
	
	@Override
	public int insertMemberReserve(MemberReserveVO memberReserveVO) {
		return reserveDAO.insertMemberReserve(memberReserveVO);
	}

	@Override
	public Integer movieReserveCheck(String member_id, int movie_code) {
		return reserveDAO.movieReserveCheck(member_id, movie_code);
	}

	@Override
	public Map<Integer, SeatTypeVO> getSeatType(){
		return reserveDAO.getSeatType();
	}

	@Override
	public Map<Integer, TimeTypeVO> getTimeType(){
		return reserveDAO.getTimeType();
	}
	
	
}
