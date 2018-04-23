package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int memberWrite(MemberDTO memberDTO) {
		return sqlSession.insert("mybatis.memberMapper.memberWrite", memberDTO);
	}
	
	public String isExistMemberId(String member_id) {
		return sqlSession.selectOne("mybatis.memberMapper.isExistMemberId", member_id);
	}
	
	public String memberLogin(String member_id,String member_pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		return sqlSession.selectOne("mybatis.memberMapper.memberLogin", map);
	}
	
	public MemberDTO memberView(String member_id) {
		return sqlSession.selectOne("mybatis.memberMapper.memberView", member_id);
	}
	
	public int memberModify(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.memberModify", memberDTO);
	}
	
	public int memberDelete(String member_id) {
		return sqlSession.delete("mybatis.memberMapper.memberDelete", member_id);
	}
	
	public MemberDTO memberInfo(String member_id) {
		return sqlSession.selectOne("mybatis.memberMapper.memberInfo", member_id);
	}
}
