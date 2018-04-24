package inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import inquiry.bean.InquiryDTO;

@Repository
public class InquiryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int inquiryWrite(InquiryDTO inquiryDTO) {
		return sqlSession.insert("mybatis.inquiry.inquiryWrite", inquiryDTO);
	}
	
	public int inquiryModify(InquiryDTO inquiryDTO) {
		return sqlSession.update("mybatis.inquiry.inquiryModify", inquiryDTO);
	}
	
	public List<InquiryDTO> inquiryList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.inquiry.inquiryList", map);
	}
	
	public InquiryDTO inquiryView(int code) {
		return sqlSession.selectOne("mybatis.inquiry.inquiryView", code);
	}
	
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.inquiry.totalA");
	}
	
	public int inquiryDelete(int seq) {
		return sqlSession.delete("mybatis.inquiry.inquiryDelete", seq);
	}
}
