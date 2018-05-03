package member.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/index.do")
	public ModelAndView toMainPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../main/main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberLoginForm.do")
	public ModelAndView memberLoginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memberLoginForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberLogin.do")
	public ModelAndView memberLogin(HttpServletRequest request) {
		System.out.println("로그인 처리");

		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
		
		String member_name = memberService.memberLogin(member_id, member_pwd);	
		System.out.println(member_name);

		ModelAndView modelAndView = new ModelAndView();
		if(member_name==null){		// 로그인 실패
			modelAndView.setViewName("memberLoginFail.jsp");
		} else {				// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("memName", member_name);
			session.setAttribute("memId", member_id);
			modelAndView.setViewName("redirect:../main/main/index.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberLogout.do")
	public ModelAndView memberLogout(HttpServletRequest request) {
		// 세션 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.invalidate(); // 무효화 : 모두 지우기
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../main/main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberWriteForm.do")
	public ModelAndView memberWriteForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memberWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberWrite.do")
	public ModelAndView memberWrite(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		MemberDTO memberDTO = new MemberDTO();
		//생년월일,통신사
		String member_id = request.getParameter("member_id");
		String member_name = request.getParameter("member_name");
		String member_pwd = request.getParameter("member_pwd");
		String member_birth = request.getParameter("yy")+"-"+request.getParameter("mm")
		+"-"+request.getParameter("dd");
		String member_email = request.getParameter("email1")
				+"@"+request.getParameter("email2");
		String member_agency = request.getParameter("member_agency");
		String member_phone = request.getParameter("phone1")
				+request.getParameter("phone2")+request.getParameter("phone3");
		String member_gender = request.getParameter("member_gender");
		
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_name(member_name);
		memberDTO.setMember_pwd(member_pwd);
		memberDTO.setMember_birth(member_birth);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_agency(member_agency); 
		memberDTO.setMember_phone(member_phone);
		memberDTO.setMember_gender(member_gender);

		int result = memberService.memberWrite(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("memberWrite.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/checkMemberId.do")
	public ModelAndView isExistMemberId(HttpServletRequest request) {
		System.out.println("아이디 중복 확인");
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
		String member_name = memberService.isExistMember(member_id, null);
		System.out.println(member_name);
		ModelAndView modelAndView = new ModelAndView();
		int exist = 0;
		if(member_name==null) {
			exist = 0;
		} else {
			exist = 1;
		}
		System.out.println(exist);
		modelAndView.addObject("member_id", member_id);
		modelAndView.addObject("exist", exist);
		modelAndView.setViewName("checkMemberId.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberView.do")
	public ModelAndView memberView(HttpServletRequest request) {
		System.out.println("회원정보 상세보기");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		String member_pwd = request.getParameter("member_pwd");
		String confirm_name = memberService.memberLogin(member_id, member_pwd);	

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("confirm_name", confirm_name); // 비번확인 실패시에도 사용하려고
		if(confirm_name==null) {		
			modelAndView.setViewName("confirmMemberPwd.jsp");
		} else {	
			MemberDTO memberDTO = new MemberDTO();
			memberDTO = memberService.memberView(member_id);
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.setViewName("memberModifyForm.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberModify.do")
	public ModelAndView memberModify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		MemberDTO memberDTO = new MemberDTO();
		//생년월일,통신사 // 개명했을 경우 // 비밀번호는 바꾸고 싶을 때만 바꿀 수 있도록 변경
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		String member_pwd = request.getParameter("member_pwd");
		String member_birth = request.getParameter("yy")+"-"+request.getParameter("mm")
		+"-"+request.getParameter("dd");
		String member_email = request.getParameter("email1")
				+"@"+request.getParameter("email2");
		String member_agency = request.getParameter("member_agency");
		String member_phone = request.getParameter("phone1")
				+request.getParameter("phone2")+request.getParameter("phone3");
		String member_gender = request.getParameter("member_gender");
		
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pwd(member_pwd);
		memberDTO.setMember_birth(member_birth);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_agency(member_agency); 
		memberDTO.setMember_phone(member_phone);
		memberDTO.setMember_gender(member_gender);

		int result = memberService.memberModify(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("memberModify.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberDeleteForm.do")
	public ModelAndView memberDeleteForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		String member_pwd = request.getParameter("member_pwd");
		String confirm_name = memberService.memberLogin(member_id, member_pwd);	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("confirm_name", confirm_name);
		if(confirm_name==null) {		
			modelAndView.setViewName("confirmMemberPwd.jsp");
		} else {				
			modelAndView.setViewName("memberDeleteForm.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/member/memberDelete.do")
	public ModelAndView memberDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		int result = memberService.memberDelete(member_id);	
		// 세션 삭제
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.invalidate(); // 무효화 : 모두 지우기
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("result", result);
		modelAndView.setViewName("redirect:../main/main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/confirmPwdModify.do")
	public ModelAndView confirmPwdModify(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("confirmPwdModify.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/member/confirmPwdDelete.do")
	public ModelAndView confirmPwdDelete(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("confirmPwdDelete.jsp");
		return modelAndView;
	}
	
}
