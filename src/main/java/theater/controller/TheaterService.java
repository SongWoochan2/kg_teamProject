package theater.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;

import theater.bean.TheaterDTO;


public interface TheaterService {
	// 극장 등록
	int theaterInsert(TheaterDTO theaterDTO);
	// 극장 수정
	int theaterModify(TheaterDTO theaterDTO);
	// 극장 삭제
	int theaterDelete(int theater_code);
	
	//극장글 상세 조회
	TheaterDTO theaterView(int theater_code);
	//극장글 목록 조회
	ArrayList<TheaterDTO> theaterList(int startNum, int endNum);
	// 조횟수 증가
	void updateHit(int theater_code);
	// 전체 게시판 글 갯수 조회
	int getTotalA();
}
