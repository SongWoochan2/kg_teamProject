package reserve.controller;

import java.util.ArrayList;

import reserve.bean.ReserveDTO;


public interface ReserveService {
	
	//극장현황 상세보기
	ReserveDTO reserveView(int show_present_code);
	//극장현황 리스트
	ArrayList<ReserveDTO> reserveList(String show_date, int theater_code);
	// 조횟수 증가
	void updateHit(int show_present_code);
	
	// 전체 게시판 글 갯수 조회
	int getTotalA();
}