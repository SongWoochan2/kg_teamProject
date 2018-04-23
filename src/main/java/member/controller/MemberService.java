package member.controller;

import member.bean.MemberDTO;

public interface MemberService {
	// 회원 가입
	public int memberWrite(MemberDTO memberDTO);
	// 회원 로그인
	public String memberLogin(String member_id, String member_pwd);
	// 아이디 존재 여부
	public String isExistMemberId(String member_id);
	// 회원정보 상세보기
	public MemberDTO memberView(String member_id);
	// 회원정보 수정
	public int memberModify(MemberDTO memberDTO);
	// 회원 탈퇴
	public int memberDelete(String member_id);
	// 마이페이지 정보 불러오기
	public MemberDTO memberInfo(String member_id);
}
