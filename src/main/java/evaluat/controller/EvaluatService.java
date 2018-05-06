package evaluat.controller;

import java.util.ArrayList;

import evaluat.bean.EvaluatDTO;
import evaluat.bean.EvaluatLikeDTO;
import movie.bean.MovieResultDTO;

public interface EvaluatService {
	// 평가 테이블
	int deleteEvaluat(int evaluat_code);
	int insertEvaluat(EvaluatDTO evaluatDTO);
	EvaluatDTO evaluatView(int evaluat_code);
	ArrayList<EvaluatDTO> EvaluatList(int movie_code,int e_startNum, int e_endNum);
	Integer getTotal(int movie_code);
	ArrayList<MovieResultDTO> getTotalList(ArrayList<Integer> code_list,int e_startNum, int e_endNum);
	Integer movieScoreTotal(int movie_code);
	ArrayList<MovieResultDTO> movieScoreTotalList(ArrayList<Integer> code_list,int e_startNum, int e_endNum);
	int evaluatMemberCheck(String evaluat_id, int movie_code);
	int updateLikeNum(int evaluat_code,int evaluat_like_num);
	
	// 평가좋아요 테이블
	int likeMemberCheck(String like_id, int evaluat_code);
	int deleteEvaluatLike(int evaluat_code);
	int insertEvaluatLike(EvaluatLikeDTO evaluatLikeDTO);
	int evaluatLikeCount(int evaluat_code); // 평가코드에 대한 좋아요 등록 수 카운트
}
