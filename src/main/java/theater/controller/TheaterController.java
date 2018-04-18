package theater.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import theater.bean.TheaterDTO;

@Controller
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	
	@RequestMapping(value="/theater.main/theaterInsertForm.do")
	public ModelAndView theaterInsertForm() { 
		System.out.println("글작성");
		// 매개변수가 반드시 2개일 필요 없음
		// HttpServletRequest request도 안 쓰고
		// BoardDAO도 여기선 안 쓰니까
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("theaterInsertForm.jsp");
		return modelAndView;
		// return "boardWriteForm";
	}
	
	
	@RequestMapping(value="/theater.main/theaterInsert.do")
	public ModelAndView theaterInsert(HttpServletRequest request) {
		System.out.println("극장 등록 처리");
		try {
			request.setCharacterEncoding("utf-8");	// 예외처리만 해주면 됨
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("예외");
		}
		// 1. 사용자 입력 정보 추출
		System.out.println("테스트1");
		String theater_photo_addr = request.getParameter("theater_photo_addr");
		String theater_name = request.getParameter("theater_name");
		String theater_phone = request.getParameter("theater_phone");
		HttpSession session = request.getSession();

		System.out.println(theater_name);
		System.out.println(theater_photo_addr);
		System.out.println(theater_phone);
		
//		int code = (Integer)session.getAttribute("code");
		System.out.println("테스트2");
		// 2. DB 연동처리
		TheaterDTO theaterDTO = new TheaterDTO();
//		theaterDTO.setCode(code);
		theaterDTO.setTheater_name(theater_name);
		theaterDTO.setTheater_phone(theater_phone);
		theaterDTO.setTheater_photo_addr(theater_photo_addr);
		
		System.out.println("테스트3");
		//BoardDAO boardDAO = new BoardDAO();
		int result = theaterService.theaterInsert(theaterDTO);
		
		System.out.println("테스트4");
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterInsert.jsp");
		return modelAndView;
		
/*		// 3. 검색 결과를 request에 저장하고 목록 화면으로 이동한다.
		request.setAttribute("result", result);
		
		return "boardWrite";*/
	}
	
	
	@RequestMapping(value="/theater.main/theaterList.do")
	public ModelAndView boardList(HttpServletRequest request) {
		
		System.out.println("글 목록 처리");
		// 1. 사용자 입력 정보 추출
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
		int endNum = pg*5;			// 1*5 = 5
		int startNum = endNum-4;	// 5-4 = 1
		System.out.println("테스트1");
		//BoardDAO boardDAO = new BoardDAO();
		ArrayList<TheaterDTO> list = theaterService.theaterList(startNum, endNum);
		
		int totalA = theaterService.getTotalA();	// 총글수
		int totalP = (totalA+4)/5;			// 총페이지수
		//================================
		int startPage = (pg-1)/3*3+1;		// (2-1)/3*3+1=1
		int endPage = startPage + 2;		// endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		System.out.println("테스트2");
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
		System.out.println("테스트3");
		modelAndView.setViewName("theaterList.jsp");
		return modelAndView;

	}

	@RequestMapping(value="/theater.main/theaterView.do")
	public ModelAndView theaterView(HttpServletRequest request) {
		System.out.println("글 상세보기");
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
		//BoardDAO boardDAO = new BoardDAO();
		theaterService.updateHit(theater_code);
		TheaterDTO theaterDTO = theaterService.theaterView(theater_code);
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("theaterDTO", theaterDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("theater_code", theater_code);
		modelAndView.setViewName("theaterView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/theater.main/theaterDelete.do")
	public ModelAndView theaterDelete(HttpServletRequest request) {
		System.out.println("글 삭제");
		// 1. 사용자 입력 정보 추출
		System.out.println("테스트0");
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		System.out.println("코드");
		// 2. DB 연동처리
		//BoardDAO boardDAO = new BoardDAO();
		int result = theaterService.theaterDelete(theater_code);
		System.out.println("테스트1");

		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterDelete.jsp");
		System.out.println("테스트3");
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/theater.main/theaterModifyForm.do")
	public ModelAndView boardModifyForm(HttpServletRequest request) { 
		System.out.println("수정");
		
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		TheaterDTO theaterDTO = theaterService.theaterView(theater_code);
		System.out.println("테스트-1");
		
		System.out.println("테스트0");
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("테스트1");
		modelAndView.addObject("theaterDTO", theaterDTO);
		System.out.println("테스트2");
		modelAndView.setViewName("theaterModifyForm.jsp");
		System.out.println("테스트3");
		return modelAndView;
	
	}
	
	@RequestMapping(value="/theater/theaterModify.do")
	public ModelAndView boardModify(HttpServletRequest request) {
		System.out.println("글 수정하기");
		try { // 데이터베이스에 한글이 깨지지 않도록 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String theater_name = request.getParameter("theater_name");
		String theater_photo_addr = request.getParameter("theater_photo_addr");
		String theater_phone = request.getParameter("theater_phone");
		// 2. DB 연동처리
		// 데이터의 갯수가 많기 때문에 자바빈즈 클래스에 담아서 전달
		TheaterDTO boardDTO = new TheaterDTO();
		boardDTO.setTheater_code(theater_code);
		boardDTO.setTheater_name(theater_name);
		boardDTO.setTheater_photo_addr(theater_photo_addr);
		boardDTO.setTheater_phone(theater_phone);
		
		//BoardDAO boardDAO = new BoardDAO();
		int result = theaterService.theaterModify(boardDTO);
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("theater_code", theater_code);
		modelAndView.setViewName("boardModify.jsp");
		return modelAndView;
	}
	
	
}
