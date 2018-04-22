package qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qna.bean.QnaDTO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int qnaWrite(QnaDTO qnaDTO) {
		return sqlSession.insert("mybatis.qna.qnaWrite", qnaDTO);
	}
	
	public int qnaModify(QnaDTO qnaDTO) {
		return sqlSession.update("mybatis.qna.qnaModify", qnaDTO);
	}
	
	public List<QnaDTO> qnaList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.qna.qnaList", map);
	}
	
	public QnaDTO qnaView(int qna_code) {
		return sqlSession.selectOne("mybatis.qna.qnaView", qna_code);
	}
	
	public int updateHit(int qna_code) {
		return sqlSession.update("mybatis.qna.qnaList", qna_code);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.qna.totalA");
	}
	
	public int qnaDelete(int qna_code) {
		return sqlSession.delete("mybatis.qna.qnaDelete", qna_code);
	}
}
