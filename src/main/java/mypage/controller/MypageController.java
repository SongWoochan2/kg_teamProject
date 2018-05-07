package mypage.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import memberReserve.bean.MemberReserveListDTO;
import memberReserve.controller.MemberReserveService;
import movie.bean.MovieDTO;
import movie.controller.MovieService;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.controller.MoviePhotoService;
import productpay.bean.ProductPayListDTO;
import productpay.controller.ProductPayService;
import resource.provider.ResourceProvider;
import savingList.bean.SavingListDTO;
import savingList.controller.SavingListService;
import select.bean.SelectDTO;
import select.controller.SelectService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SelectService selectService;
	@Autowired
	private MoviePhotoService moviePhotoService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private SavingListService savingListService;
	@Autowired
	private MemberReserveService memberReserveService;
	@Autowired
	private ProductPayService productpayService;
	@Autowired
	private ResourceProvider resourceProvider;

	
	@RequestMapping(value="/main/mypage/myStoreList.do")
	public ModelAndView myStoreList(HttpServletRequest request) {	
		int pg = Integer.parseInt(request.getParameter("p"));
		int endNum = pg*5;			
		int startNum = endNum-4;	
		
		HttpSession session = request.getSession();
		String pay_id = (String)session.getAttribute("memId");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(pay_id);

		// 구매내역 : 사용가능한 구매
		List<ProductPayListDTO> payList = productpayService.getPayList(pay_id);
		
		// 구매내역 & 구매취소내역 & 미사용내역 전부다
		List<ProductPayListDTO> allPayList = productpayService.getAllPayList(pay_id,startNum,endNum);
		
		Date today = new Date();
    	for(ProductPayListDTO tmp : allPayList) {   			
			DateFormat df = new SimpleDateFormat("yyyy.MM.dd", Locale.ENGLISH); // 데이터 포맷 설정
			Date validDate = new Date();
			try {
				validDate = df.parse(tmp.getPay_time());
			} catch (ParseException e) {
				e.printStackTrace();
			}

			// 날짜 더하기
			Calendar calVal = Calendar.getInstance();
			calVal.setTime(validDate);
			calVal.add(Calendar.MONTH, 6);
			tmp.setValidDate(df.format(calVal.getTime()));
			
			String valid_date = df.format(calVal.getTime());
			try {
				validDate = df.parse(valid_date);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			if(today.getTime() <= validDate.getTime()) {
				tmp.setValid("Y");
			} else {
				tmp.setValid("N");
			}
			
    	}
		
		int totalVal = 	productpayService.getTotalVal(pay_id);// 총 구매내역수
		int totalPVal = (totalVal+4)/5;			// 총페이지수
		//================================
		int startPageVal = (pg-1)/5*5+1;		// (2-1)/3*3+1=1
		int endPageVal = startPageVal + 4;		// endPage = startPage + 3 - 1;
		if(totalPVal < endPageVal) endPageVal = totalPVal;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("payList", payList);
		modelAndView.addObject("allPayList", allPayList);
		modelAndView.addObject("totalVal", totalVal);
		modelAndView.addObject("startPageVal", startPageVal);
		modelAndView.addObject("endPageVal", endPageVal);
		modelAndView.addObject("totalPVal", totalPVal);
		modelAndView.addObject("p", pg);
		modelAndView.setViewName("myStoreList.jsp?p="+pg);
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mypage/productPayCancel.do")
	public ModelAndView cancelProductPay(HttpServletRequest request) {			
		int product_pay_code = Integer.parseInt(request.getParameter("product_pay_code"));
		int result = productpayService.productPayCancel(product_pay_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("cancelProductPay.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mypage/myReserveList.do")
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
			int reserve_code = reserveCodes.get(i);
			System.out.println("예매코드:"+reserve_code);
			MemberReserveListDTO memberReserveListDTO = new MemberReserveListDTO();
			memberReserveListDTO = memberReserveService.getAllReserveList(reserve_code);
			int count_seats = memberReserveService.countSeats(reserve_code);
			memberReserveListDTO.setCount_seats(count_seats);	
			reserveList.add(i,memberReserveListDTO);
		}
		
		int totalVal = 	memberReserveService.getTotalVal(reserve_id);// 예매내역 총글수
		int totalPVal = (totalVal+4)/5;			// 총페이지수
		//================================
		int startPageVal = (pg-1)/5*5+1;		// (2-1)/3*3+1=1
		int endPageVal = startPageVal + 4;		// endPage = startPage + 3 - 1;
		if(totalPVal < endPageVal) endPageVal = totalPVal;
		
		//System.out.println(savingList.isEmpty());
		
		// 취소내역
		ArrayList<Integer> cancelCodes
		= memberReserveService.getCancelCodes(reserve_id,startNum,endNum);
		
		List<MemberReserveListDTO> cancelList = new ArrayList<>();
		for(int i=0,n=cancelCodes.size();i<n;i++) {
			int cancel_code = cancelCodes.get(i);
			System.out.println("취소코드:"+cancel_code);
			MemberReserveListDTO memberCancelListDTO = new MemberReserveListDTO();
			memberCancelListDTO = memberReserveService.getAllReserveList(cancel_code);
			System.out.println(memberCancelListDTO.getReserve_code());
			cancelList.add(i,memberCancelListDTO);
		}
		
/*		int totalcancel = memberReserveService.getTotalcancel(reserve_id);// 취소내역 총글수
		int totalPcancel = (totalcancel+4)/5;			// 총페이지수
		//================================
		int startPagecancel = (pg-1)/3*3+1;		// (2-1)/3*3+1=1
		int endPagecancel = startPagecancel + 2;		// endPage = startPage + 3 - 1;
		if(totalPcancel < endPagecancel) endPagecancel = totalPcancel;*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("reserveList", reserveList);
		modelAndView.addObject("startPageVal", startPageVal);
		modelAndView.addObject("endPageVal", endPageVal);
		modelAndView.addObject("totalPVal", totalPVal);
		modelAndView.addObject("p", pg);
		modelAndView.addObject("cancelList", cancelList);
/*		modelAndView.addObject("startPagecancel", startPagecancel);
		modelAndView.addObject("endPagecancel", endPagecancel);
		modelAndView.addObject("totalPcancel", totalPcancel);*/
		modelAndView.setViewName("myReserveList.jsp?p="+pg);
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mypage/memReserveCancel.do")
	public ModelAndView cancelMemReserve(HttpServletRequest request) {			
		int pg = 0;
		if(request.getParameter("p")!=null) {
			pg = Integer.parseInt(request.getParameter("p"));			
		}
		int reserve_code = Integer.parseInt(request.getParameter("reserve_code"));
		int result = memberReserveService.memReserveCancel(reserve_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("p", pg);
		modelAndView.setViewName("cancelMemReserve.jsp");
		return modelAndView;
	}
		
	@RequestMapping(value="/main/mypage/myPointList.do")
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
	@RequestMapping(value="/main/mypage/mypageHome.do")
	public ModelAndView mypageHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("memId");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(member_id);
		
		// 예매내역
		ArrayList<Integer> reserveCodes
		= memberReserveService.getReserveCodes(member_id,1,5);
		
		List<MemberReserveListDTO> reserveList = new ArrayList<>();
		for(int i=0,n=reserveCodes.size();i<n;i++) {
			int reserve_code = reserveCodes.get(i);
			System.out.println("예매코드:"+reserve_code);
			MemberReserveListDTO memberReserveListDTO = new MemberReserveListDTO();
			memberReserveListDTO = memberReserveService.getAllReserveList(reserve_code);
			int count_seats = memberReserveService.countSeats(reserve_code);
			memberReserveListDTO.setCount_seats(count_seats);	
			reserveList.add(i,memberReserveListDTO);
		}
		
		int totalVal = 	memberReserveService.getTotalVal(member_id);// 예매내역 총글수
		
		// 사용가능 쿠폰 수
		int usableCnt = productpayService.getTotalUsable(member_id);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("reserveList", reserveList);
		modelAndView.addObject("totalVal", totalVal);
		modelAndView.addObject("usableCnt", usableCnt);
		modelAndView.setViewName("mypageHome.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mypage/myProfileForm.do")
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
	
	@RequestMapping(value="/main/mypage/checkNickName.do", method=RequestMethod.GET)
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
	
//	@RequestMapping(value="/main/mypage/myProfile.do", method=RequestMethod.POST)
//	public void profileUpdate(HttpServletRequest request, HttpServletResponse response) {
//		
//		
//	}
	
	@RequestMapping(value="/main/mypage/myProfile.do", method=RequestMethod.POST)
	public ModelAndView profileUpdate(HttpServletRequest request, MultipartFile profile_upload_file) {
		String filePath = resourceProvider.getPath("image/profile");
		String fileName = "";
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");
		String nick_name = request.getParameter("nick_name");
		String img_addr = request.getParameter("img_addr");
		
		MemberDTO memberDTO = new MemberDTO();	
		memberDTO = memberService.memberView(member_id);
		memberDTO.setNick_name(nick_name);
		
		String origin_img_addr = memberDTO.getProfile_img_addr();
		
		int resultDel = 1;
		if (!profile_upload_file.isEmpty()) { // 원래 origin_img_addr 있는데 수정/삭제한 경우	
			if(origin_img_addr!="none") {
				File file = new File(filePath, origin_img_addr);
				resultDel = -1; // 오류 발생
				if (file.exists()) {
					if (file.delete()) {
						resultDel = 1; // 파일 삭제 성공
						System.out.println("파일삭제성공 : 새파일 넣었을 때");	
					} else {
						resultDel = 0; // 파일 삭제 실패
					}
				}
			}
			String originFileName = profile_upload_file.getOriginalFilename();
			if (originFileName!=null) {
				String extension = originFileName.split("\\.")[1];
				System.out.println(extension);
				Date date = new Date();
				fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(date) + "." + extension;
				System.out.println(fileName);
			} 
			File file = new File(filePath, fileName);
			memberDTO.setProfile_img_addr(fileName);
			
			// 파일을 storage 폴더에 복사
			try {
				// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
				FileCopyUtils.copy(profile_upload_file.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else { // 원래 origin_img_addr 삭제
			if((!origin_img_addr.equals("none")) && img_addr.equals("none") ) {
				File file = new File(filePath, origin_img_addr);
				resultDel = -1; // 오류 발생
				if (file.exists()) {
					if (file.delete()) {
						resultDel = 1; // 파일 삭제 성공
						System.out.println("파일삭제성공 : 새파일 안 넣었을 때");
						memberDTO.setProfile_img_addr("none");
					} else {
						resultDel = 0; // 파일 삭제 실패
					}
				}	
			}
		}

		int result = memberService.profileModify(memberDTO);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("resultDel", resultDel);
		modelAndView.setViewName("myProfile.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/mypage/myWishList.do")
	public ModelAndView myWishList(HttpServletRequest request) {
		int like_able = 0;
		System.out.println("myWishList.do");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");


		MemberDTO memberDTO = memberService.memberView(member_id);


		memberDTO = memberService.memberView(member_id);
		
		System.out.println(member_id);
		ModelAndView modelAndView = new ModelAndView();
		
		// '내가 찜한' -> 영화 코드-> 영화 리스트
		List<SelectDTO> selectlist = selectService.selectMemberList(member_id);
		// 해당 영화 리스트 -> 영화코드 리스트 -> 영화 사진 '한장' 리스트
		int pg = 1;		
		int endNum = 0;
		int startNum = 0;
		String[] movie_type = null;
		String[] make_nation = null;
		String[] movie_show_grade = null;
		String movie_keyword = "";
		String movie_search = "";

//		받아온 값 저장
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
			endNum = pg * 6;
			startNum = endNum - 5;	
		}

		int movie_code = 0;
		Map<Integer, Object> photo_map = new HashMap<>();
		Map<Integer, Object> like_map = new HashMap<>();
		ArrayList<MovieDTO> movie_list = new ArrayList<>();
		for(SelectDTO selectDTO : selectlist) {
			movie_code = selectDTO.getMovie_code();
			MoviePhotoDTO moviePhotoDTO =moviePhotoService.moviePosterView(movie_code);
			MovieDTO movieDTO = movieService.movieView(movie_code);
			movie_list.add(movieDTO);
			photo_map.put(movie_code, moviePhotoDTO.getMovie_photo_addr());
			System.out.println("for - " +movie_code + "/ " + movieDTO+ " / " + moviePhotoDTO);
			
			if(member_id != null) {
				like_able = selectService.selectMovieList(member_id, movie_code);	
				System.out.println("movie_code : " + movie_code);
				System.out.println("like_able : " + like_able);
				like_map.put(movie_code, like_able);
				System.out.println("like_map:" + like_map);
			}else {
				like_map.put(movie_code, like_able);
			}
			
		}
		System.out.println("photo : " + photo_map);
		System.out.println("movie : " + movie_list);
		modelAndView.addObject("like_map", like_map);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("movie_list", movie_list);
		modelAndView.addObject("photo_map", photo_map);
		modelAndView.setViewName("myWishList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="/main/mypage/myWatchedMovie.do")
	public ModelAndView myWatchedMovieList(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("p"));
		int endNum = pg*10;			
		int startNum = endNum-9;	
		
		HttpSession session = request.getSession();
		String reserve_id = (String)session.getAttribute("memId");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(reserve_id);
		
		// 내가 본 영화 내역
		ArrayList<Integer> watchedCodes
		= memberReserveService.getWatchedCodes(reserve_id,startNum,endNum);

		List<MemberReserveListDTO> watchedList = new ArrayList<>();
		for(int i=0,n=watchedCodes.size();i<n;i++) {
			int watched_code = watchedCodes.get(i);
			System.out.println("내가본영화코드:"+watched_code);
			MemberReserveListDTO memberWatchedListDTO = new MemberReserveListDTO();
			memberWatchedListDTO = memberReserveService.getAllReserveList(watched_code);
			int count_seats = memberReserveService.countSeats(watched_code);
			memberWatchedListDTO.setCount_seats(count_seats);	
			watchedList.add(i,memberWatchedListDTO);
		}
		
		int totalWatch = memberReserveService.getTotalWatched(reserve_id); // 내가 본 영화 총 갯수
		int totalPWatch = (totalWatch+9)/10;			
		//================================
		int startPageWatch = (pg-1)/5*5+1;	
		int endPageWatch = startPageWatch + 4;		
		if(totalPWatch < endPageWatch) endPageWatch = totalPWatch;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("p", pg);
		modelAndView.addObject("totalWatch", totalWatch);
		modelAndView.addObject("startPageWatch", startPageWatch);
		modelAndView.addObject("endPageWatch", endPageWatch);
		modelAndView.addObject("totalPWatch", totalPWatch);	
		modelAndView.addObject("watchedList", watchedList);		
		modelAndView.setViewName("myWatchedMovie.jsp?p="+pg);
		return modelAndView;
	}
	
}
