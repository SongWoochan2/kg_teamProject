package mypage.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import memberReserve.bean.MemberReserveDTO;
import memberReserve.bean.MemberReserveListDTO;
import memberReserve.controller.MemberReserveService;
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
	private MemberReserveService memberReserveService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/mypage/myReserveList.do")
	public ModelAndView myReserveList(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("p"));
		int endNum = pg*5;			
		int startNum = endNum-4;	
		
		HttpSession session = request.getSession();
		String reserve_id = (String)session.getAttribute("memId");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(reserve_id);

		// 예매내역
		ArrayList<Integer> reserveCodes
		= memberReserveService.getReserveCodes(reserve_id,startNum,endNum);

		List<MemberReserveListDTO> reserveList = new ArrayList<>();
		for(int i=0,n=reserveCodes.size();i<n;i++) {
			MemberReserveListDTO memberReserveListDTO = new MemberReserveListDTO();
			System.out.println(reserveCodes.get(i));
			memberReserveListDTO = memberReserveService.getAllReserveList(reserveCodes.get(i));
			//memberReserveListDTO.setReserve_code(reserveCodes.get(i));
			System.out.println(memberReserveListDTO.getReserve_code());
			reserveList.add(i,memberReserveListDTO);
		}
		
		int totalVal = 	memberReserveService.getTotalVal(reserve_id);// 예매내역 총글수
		int totalPVal = (totalVal+4)/5;			// 총페이지수
		//================================
		int startPageVal = (pg-1)/3*3+1;		// (2-1)/3*3+1=1
		int endPageVal = startPageVal + 2;		// endPage = startPage + 3 - 1;
		if(totalPVal < endPageVal) endPageVal = totalPVal;
		
		//System.out.println(savingList.isEmpty());
		
		// 취소내역
		ArrayList<Integer> cancleCodes
		= memberReserveService.getCancleCodes(reserve_id,startNum,endNum);
		
		List<MemberReserveListDTO> cancleList = new ArrayList<>();
		for(int i=0,n=cancleCodes.size();i<n;i++) {
			MemberReserveListDTO memberCancleListDTO = new MemberReserveListDTO();
			System.out.println(cancleCodes.get(i));
			memberCancleListDTO = memberReserveService.getAllReserveList(cancleCodes.get(i));
			//memberReserveListDTO.setReserve_code(reserveCodes.get(i));
			System.out.println(memberCancleListDTO.getReserve_code());
			reserveList.add(i,memberCancleListDTO);
		}
		
		int totalCancle = 	memberReserveService.getTotalCancle(reserve_id);// 취소내역 총글수
		int totalPCancle = (totalCancle+4)/5;			// 총페이지수
		//================================
		int startPageCancle = (pg-1)/3*3+1;		// (2-1)/3*3+1=1
		int endPageCancle = startPageCancle + 2;		// endPage = startPage + 3 - 1;
		if(totalPCancle < endPageCancle) endPageCancle = totalPCancle;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("reserveList", reserveList);
		modelAndView.addObject("startPageVal", startPageVal);
		modelAndView.addObject("endPageVal", endPageVal);
		modelAndView.addObject("totalPVal", totalPVal);
		modelAndView.addObject("p", pg);
		modelAndView.addObject("cancleList", cancleList);
		modelAndView.addObject("startPageCancle", startPageCancle);
		modelAndView.addObject("endPageCancle", endPageCancle);
		modelAndView.addObject("totalPCancle", totalPCancle);
		modelAndView.setViewName("myReserveList.jsp?p="+pg);
		return modelAndView;
	}
	
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
	
	@RequestMapping(value="/mypage/myProfileForm.do")
	public ModelAndView profileView(HttpServletRequest request) {
		System.out.println("프로필 불러오기");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");

		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(member_id);
		System.out.println(memberDTO.getNick_name());
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("myProfileForm.jsp");
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
	
	@RequestMapping(value="/mypage/myProfile.do", method=RequestMethod.POST)
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
		modelAndView.setViewName("myProfile.jsp");
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
	
	@RequestMapping(value="/mypage/myWishList.do")
	public ModelAndView myWishList(HttpServletRequest request) {
		System.out.println("myWishList.do");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");


		MemberDTO memberDTO = memberService.memberView(member_id);
		System.out.println(member_id);
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("memberDTO", memberDTO);
		System.out.println(memberDTO.getMember_name());
		System.out.println(memberDTO.getNick_name());
		modelAndView.addObject("member_id", member_id);
		modelAndView.setViewName("myWishList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="/mypage/myWatchedMovie.do")
	public ModelAndView myWatchedMovie(HttpServletRequest request) {
		System.out.println("myWishList.do");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");


		MemberDTO memberDTO = memberService.memberView(member_id);
		System.out.println(member_id);
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("memberDTO", memberDTO);
		System.out.println(memberDTO.getMember_name());
		System.out.println(memberDTO.getNick_name());
		modelAndView.addObject("member_id", member_id);
		modelAndView.setViewName("myWatchedMovie.jsp");
		return modelAndView;
		
	}
	
}
