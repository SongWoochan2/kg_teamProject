package answer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import answer.bean.AnswerDTO;

public class AnswerDAO {
	/*@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AnswerDTO> answerList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.answer.answerList", map);
	}
	
	public AnswerDTO answerView(int notice_item_code) {
		return sqlSession.selectOne("mybatis.answer.answerView", notice_item_code);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.answer.totalA");
	}*/
}
