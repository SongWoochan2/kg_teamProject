package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;
	
	public int memberWrite(MemberDTO memberDTO) {
		return memberDAO.memberWrite(memberDTO);
	}

	public String memberLogin(String member_id, String member_pwd) {
		return memberDAO.memberLogin(member_id, member_pwd);
	}

	public String isExistMember(String member_id, String nick_name) {
		return memberDAO.isExistMember(member_id, nick_name);
	}

	public MemberDTO memberView(String member_id) {
		return memberDAO.memberView(member_id);
	}

	public int memberModify(MemberDTO memberDTO) {
		return memberDAO.memberModify(memberDTO);
	}

	public int memberDelete(String member_id) {
		return memberDAO.memberDelete(member_id);
	}

	public MemberDTO memberInfo(String member_id) {
		return memberDAO.memberInfo(member_id);
	}

}
