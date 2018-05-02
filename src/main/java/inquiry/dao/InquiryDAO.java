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
	
	public int inquiryStatus(int inquiry_code) {
		System.out.println(3);
		return sqlSession.update("mybatis.inquiry.inquiryStatus", inquiry_code);
	}
	
	public int inquiryModify(InquiryDTO inquiryDTO) {
		return sqlSession.update("mybatis.inquiry.inquiryModify", inquiryDTO);
	}
	
	public List<InquiryDTO> inquiryListAdmin(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.inquiry.inquiryListAdmin", map);
	}
	
	public List<InquiryDTO> inquiryListMember(int startNum, int endNum, String inquiry_id){
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("inquiry_id", inquiry_id);
		return sqlSession.selectList("mybatis.inquiry.inquiryListMember", map);
	}
	
	public InquiryDTO inquiryView(int inquiry_code) {
		return sqlSession.selectOne("mybatis.inquiry.inquiryView", inquiry_code);
	}
	
	public int inquiryAll(String inqruiry_id) {
		return sqlSession.selectOne("mybatis.inquiry.inquiryAll", inqruiry_id);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.inquiry.totalA");
	}
	
	public int inquiryDelete(int inqruiry_code) {
		return sqlSession.delete("mybatis.inquiry.inquiryDelete", inqruiry_code);
	}
}
