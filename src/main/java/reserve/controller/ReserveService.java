package reserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import movie.bean.MovieDTO;
import reserve.bean.ReserveDTO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;


public interface ReserveService {
	
	//극장현황 상세보기
	ReserveDTO reserveView(int show_present_code);
	//극장현황 리스트
	ArrayList<ReserveDTO> reserveList(String show_date, int theater_code);
	// 조횟수 증가
	void updateHit(int show_present_code);
	
	// 전체 게시판 글 갯수 조회
	int getTotalA();
	

	
	
	///////////// 우찬


	public List<MovieDTO> getMovieList(String show_date, int theater_code);

	public List<TheaterDTO> getTheaterList(String show_date, int movie_code);

	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code);
	

}
