package showPlace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import showPlace.bean.SeatVO;
import showPlace.bean.ShowPlaceVO;
import showPlace.dao.ShowPlaceDAO;

@Service
public class ShowPlaceService {

	@Autowired
	private ShowPlaceDAO showPlaceDAO;

	
	public int insertShowPlace(ShowPlaceVO showPlaceVO) {
		return showPlaceDAO.insertShowPlace(showPlaceVO);
	}
	
	public int insertSeat(SeatVO seatVO) {
		return showPlaceDAO.insertSeat(seatVO);
	}
	
	public int updateShowPlace(ShowPlaceVO showPlaceVO) {
		return showPlaceDAO.updateShowPlace(showPlaceVO);
	}
	
	public int deleteShowPlace(int show_place_code) {
		return showPlaceDAO.deleteShowPlace(show_place_code);
	}
	
	public ShowPlaceVO selectOne(int show_place_code) {
		return showPlaceDAO.selectOne(show_place_code);
	}

	public List<ShowPlaceVO> selectList() {
		return showPlaceDAO.selectList();
	}
}
