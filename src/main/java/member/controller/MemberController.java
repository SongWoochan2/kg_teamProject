package member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import resource.provider.ResourceProvider;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ResourceProvider resourceProvider;
	
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
			modelAndView.setViewName("memberLoginForm.jsp");
		} else {				// 로그인 성공
			// JSP에선 내장객체라서 그냥 쓸 수 있었지만 
			// 여긴 자바코드,즉 서블릿이므로 session 클래스를 만들어줘야 함
			HttpSession session = request.getSession();
			session.setAttribute("memName", member_name);
			session.setAttribute("memId", member_id);
			// loginForm이 member 폴더 안에 있기 때문에 얘만 sendRedirect로 움직이게 할 것
			// forward 방식으로 보내면 폴더명이 안 바뀜
			//return "../board/boardList.do?pg=1";
			
			// redirect: 뒤에 쓰면
			// forward 방식이 아니라 sendRedirect 방식으로 보냄
			modelAndView.setViewName("redirect:../index.jsp");
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
		modelAndView.setViewName("redirect:../index.jsp");
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
		modelAndView.setViewName("redirect:../index.jsp");
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
	
	
	// mypage -------------------------------------
	@RequestMapping(value="/mypage/mypageHome.do")
	public ModelAndView mypageHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		System.out.println("1");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberInfo(member_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("mypageHome.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/mypage/editProfileForm.do")
	public ModelAndView profileView(HttpServletRequest request) {
		System.out.println("프로필 불러오기");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");

		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(member_id);
		System.out.println(memberDTO.getNick_name());
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("editProfileForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/mypage/checkNickName.do", method=RequestMethod.GET)
	public ModelAndView checkNickName(HttpServletRequest request) {
		System.out.println("닉네임 중복확인");
		String nick_name = request.getParameter("nick_name");
		String member_name = memberService.isExistMember(null,nick_name);
		System.out.println(member_name);
		ModelAndView modelAndView = new ModelAndView();
		
		int exist = -1; // 오류 발생
		if(member_name == null) {
			exist = 1; // 사용가능 닉네임
		} else {
			exist = 0; // 사용불가 닉네임
		}
		System.out.println(exist);
		modelAndView.addObject("exist", exist);
		modelAndView.setViewName("checkNickName.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/mypage/editProfile.do", method=RequestMethod.POST)
	public ModelAndView profileUpdate(HttpServletRequest request, MultipartFile profile_upload_file) {
		String filePath = resourceProvider.getPath("image/profile");
		String fileName = "none.png";
		if (!profile_upload_file.isEmpty()) {
			String originFileName = profile_upload_file.getOriginalFilename();
			String img_addr = request.getParameter("img_addr");
			System.out.println(originFileName);
			System.out.println(img_addr);
			if (!originFileName.contains("none.") || !img_addr.contains("none.")) {
				String extension = originFileName.split("\\.")[1];
				System.out.println(extension);
				Date date = new Date();
				fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(date) + "." + extension;
				System.out.println(fileName);
			} 
			File file = new File(filePath, fileName);

			// 파일을 storage 폴더에 복사
			try {
				// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
				FileCopyUtils.copy(profile_upload_file.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");
		String nick_name = request.getParameter("nick_name");

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setNick_name(nick_name);
		memberDTO.setProfile_img_addr(fileName);

		int result = memberService.memberModify(memberDTO);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("editProfile.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/mypage/deleteProfileImg.do", method=RequestMethod.POST)
	public ModelAndView deleteProfileImg(HttpServletRequest request) {
		String filePath = resourceProvider.getPath("image/profile");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(member_id);
		String fileName = memberDTO.getProfile_img_addr();
		File file = new File(filePath, fileName);

		int result = -1; // 오류 발생
		if (file.exists()) {
			if (file.delete()) {
				result = 1; // 파일 삭제 성공
			} else {
				result = 0; // 파일 삭제 실패
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("deleteImgFile.jsp");
		return modelAndView;
	}
}
