package answer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import answer.bean.AnswerDTO;

@Repository
public class AnswerDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int answerInsert(AnswerDTO answerDTO) {
		return sqlSession.insert("mybatis.answer.answerInsert", answerDTO);
	}
	
	
	public AnswerDTO answerView(int inquiry_code) {
		return sqlSession.selectOne("mybatis.answer.answerView", inquiry_code);
	}
	
	
	/*public List<AnswerDTO> answerList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.answer.answerList", map);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.answer.totalA");
	}
	
	public int answerDelete(int answer_code) {
		return sqlSession.delete("mybatis.answer.answerDelete", answer_code);
	}*/
}
