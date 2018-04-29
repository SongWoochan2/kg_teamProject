package mypage.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import member.controller.MemberService;
import resource.provider.ResourceProvider;
import savingList.bean.SavingListDTO;
import savingList.controller.SavingListService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SavingListService savingListService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/mypage/myPointList.do")
	public ModelAndView myPointList(HttpServletRequest request) {		
		int pg = Integer.parseInt(request.getParameter("p"));
		int endNum = pg*10;			
		int startNum = endNum-9;	
		
		HttpSession session = request.getSession();
		String saving_id = (String)session.getAttribute("memId");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(saving_id);
		System.out.println(memberDTO.getNick_name());
		
		List<SavingListDTO> savingList = savingListService.savingList(startNum,endNum,saving_id);
		
		int totalA = savingListService.getTotalA(saving_id);	// 총글수
		int totalP = (totalA+9)/10;			// 총페이지수
		//================================
		int startPage = (pg-1)/5*5+1;		// (2-1)/3*3+1=1
		int endPage = startPage + 4;		// endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		System.out.println(savingList.isEmpty());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("savingList", savingList);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("p", pg);
		modelAndView.setViewName("myPointList.jsp?p="+pg);
		return modelAndView;
	}
	
	// mypage -------------------------------------
	@RequestMapping(value="/mypage/mypageHome.do")
	public ModelAndView mypageHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		System.out.println("1");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(member_id);
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
