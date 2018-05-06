package evaluat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import evaluat.bean.EvaluatDTO;
import evaluat.bean.EvaluatLikeDTO;
import movie.bean.MovieResultDTO;

@Repository
public class EvaluatDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 평가 테이블
	
	public int insertEvaluat(EvaluatDTO evaluatDTO) {
		return sqlSession.delete("evaluatMapper.insertEvaluat",evaluatDTO);
	}
	
	public int deleteEvaluat(int evaluat_code) {
		return sqlSession.delete("evaluatMapper.deleteEvaluat",evaluat_code);
	}
	
	public List<EvaluatDTO> EvaluatList(int movie_code,int e_startNum, int e_endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("movie_code", movie_code);
		map.put("e_startNum", e_startNum);
		map.put("e_endNum", e_endNum);

		return sqlSession.selectList("evaluatMapper.EvaluatList", map);
	}
	
	public Integer getTotal(int movie_code) {
		return sqlSession.selectOne("evaluatMapper.getTotal", movie_code);
	}
	
	public EvaluatDTO evaluatView(int evaluat_code) {
		return sqlSession.selectOne("evaluatMapper.evaluatView", evaluat_code);
	}
	
	public Integer movieScoreTotal(int movie_code) {
		return sqlSession.selectOne("evaluatMapper.movieScoreTotal", movie_code);
	}
	
	public int evaluatMemberCheck(String evaluat_id, int movie_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("evaluat_id", evaluat_id);
		map.put("movie_code", movie_code);
		return sqlSession.selectOne("evaluatMapper.evaluatMemberCheck", map);
	}
	
	public int updateLikeNum(int evaluat_code, int evaluat_like_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("evaluat_code", evaluat_code);
		map.put("evaluat_like_num", evaluat_like_num);
		return sqlSession.update("evaluatMapper.updateLikeNum", map);
	}
	
	// 평가 좋아요 테이블
	
	public int likeMemberCheck(String like_id, int evaluat_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("like_id", like_id);
		map.put("evaluat_code", evaluat_code);
		return sqlSession.selectOne("evaluatMapper.likeMemberCheck",map);
	}
	
	public int deleteEvaluatLike(int evaluat_code) {
		return sqlSession.delete("evaluatMapper.deleteEvaluatLike",evaluat_code);
	}
	
	public int insertEvaluatLike(EvaluatLikeDTO evaluatLikeDTO) {
		return sqlSession.insert("evaluatMapper.insertEvaluatLike",evaluatLikeDTO);
	}
	
	public int evaluatLikeCount(int evaluat_code) {
		return sqlSession.selectOne("evaluatMapper.evaluatLikeCount", evaluat_code);
	}
	
	public List<MovieResultDTO> getTotalList(ArrayList<Integer> code_list, int e_startNum, int e_endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code_list", code_list);
		map.put("e_startNum", e_startNum);
		map.put("e_endNum", e_endNum);
		return sqlSession.selectList("evaluatMapper.getTotalList", map);
	}
	
	public List<MovieResultDTO> movieScoreTotalList(ArrayList<Integer> code_list, int e_startNum, int e_endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code_list", code_list);
		map.put("e_startNum", e_startNum);
		map.put("e_endNum", e_endNum);
		return sqlSession.selectList("evaluatMapper.movieScoreTotalList", map);
		
	}
}
