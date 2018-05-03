package evaluat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import evaluat.bean.EvaluatDTO;
import evaluat.bean.EvaluatLikeDTO;
import evaluat.dao.EvaluatDAO;

@Service
public class EvaluatServiceImpl implements EvaluatService{
		
	@Autowired
	private EvaluatDAO evaluatDAO;
	
	// 평가 테이블

	@Override
	public int insertEvaluat(EvaluatDTO evaluatDTO) {
		return evaluatDAO.insertEvaluat(evaluatDTO);
	}

	@Override
	public int deleteEvaluat(int evaluat_code) {
		return evaluatDAO.deleteEvaluat(evaluat_code);
	}

	@Override
	public ArrayList<EvaluatDTO> EvaluatList(int movie_code,int e_startNum, int e_endNum) {
		return (ArrayList<EvaluatDTO>) evaluatDAO.EvaluatList(movie_code,e_startNum,e_endNum);
	}

	@Override
	public Integer getTotal(int movie_code) {
		return evaluatDAO.getTotal(movie_code);
	}

	@Override
	public EvaluatDTO evaluatView(int evaluat_code) {
		return evaluatDAO.evaluatView(evaluat_code);
	}


	@Override
	public Integer movieScoreTotal(int movie_code) {
		return evaluatDAO.movieScoreTotal(movie_code);
	}

	@Override
	public int evaluatMemberCheck(String evaluat_id, int movie_code) {
		return evaluatDAO.evaluatMemberCheck(evaluat_id, movie_code);
	}

	@Override
	public int updateLikeNum(int evaluat_code, int evaluat_like_num) {
		return evaluatDAO.updateLikeNum(evaluat_code, evaluat_like_num);
	}
	
	// 평가좋아요 테이블
	
	@Override
	public int likeMemberCheck(String like_id, int evaluat_code) {
		return evaluatDAO.likeMemberCheck(like_id, evaluat_code);
	}

	@Override
	public int deleteEvaluatLike(int evaluat_code) {
		return evaluatDAO.deleteEvaluatLike(evaluat_code);
	}

	@Override
	public int insertEvaluatLike(EvaluatLikeDTO evaluatLikeDTO) {
		return evaluatDAO.insertEvaluatLike(evaluatLikeDTO);
	}

	@Override
	public int evaluatLikeCount(int evaluat_code) {
		return evaluatDAO.evaluatLikeCount(evaluat_code);
	}
	
}
