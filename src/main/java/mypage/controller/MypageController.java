package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.controller.MemberService;

@Controller
public class MypageController {
	/*@Autowired
	private MypageService mypageService;*/
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/mypage/mypageHome.do")
	public ModelAndView mypageHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberInfo(member_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("mypageHome.jsp");
		return modelAndView;
	}
}
