package theater.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import resource.provider.ResourceProvider;
import theater.bean.TheaterDTO;

@Controller
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/admin/theater/theaterInsertForm.do", method=RequestMethod.GET)
	public ModelAndView theaterInsertForm() { 
		System.out.println("글작성");
		// 매개변수가 반드시 2개일 필요 없음
		// HttpServletRequest request도 안 쓰고

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("theaterInsertForm.jsp");
		return modelAndView;

	}
	
	/*@RequestMapping(value="/theater.main/theaterInsertForm.do")
	public ModelAndView theaterInsertForm() { 
		System.out.println("글작성");
		// 매개변수가 반드시 2개일 필요 없음
		// HttpServletRequest request도 안 쓰고

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("theaterInsertForm.jsp");
		return modelAndView;

	}*/
	
	@RequestMapping(value="/admin/theater/theaterInsert.do", method=RequestMethod.POST)
	public ModelAndView theaterInsert(HttpServletRequest request,  MultipartFile theater_photo_addr) {
		System.out.println("극장 등록 처리");
		
//		String filePath = "J://1802JavaSW_HBN//spring//teamProject//src//main//webapp//image//theater_juso";
		String filePath = resourceProvider.getPath("image/theater_juso");
		String fileName = theater_photo_addr.getOriginalFilename();	
		File file = new File(filePath, fileName);
		ModelAndView modelAndView = new ModelAndView();
		
		// 파일을 storage 폴더에 복사
				try {
					// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
					FileCopyUtils.copy(theater_photo_addr.getInputStream(), new FileOutputStream(file));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				
				
				
				
		try {
			request.setCharacterEncoding("utf-8");	// 예외처리만 해주면 됨
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("예외");
		}
		// 1. 사용자 입력 정보 추출
		String theater_name = request.getParameter("theater_name");
		String theater_phone = request.getParameter("theater_phone");
		HttpSession session = request.getSession();
		// 2. DB 연동처리
		TheaterDTO theaterDTO = new TheaterDTO();
		theaterDTO.setTheater_name(theater_name);
		theaterDTO.setTheater_phone(theater_phone);
		theaterDTO.setTheater_photo_addr(fileName);
		int result = theaterService.theaterInsert(theaterDTO);
	
		// 3. 화면 네비게이션
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterInsert.jsp");
		return modelAndView;

	}

	@RequestMapping(value="/admin/theater/theaterList.do")
	public ModelAndView theaterList(HttpServletRequest request) {
		
		System.out.println("글 목록 처리");
		// 1. 사용자 입력 정보 추출
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
		int endNum = pg*5;			// 1*5 = 5
		int startNum = endNum-4;	// 5-4 = 1
		
		ArrayList<TheaterDTO> list = theaterService.theaterList(startNum, endNum);
		int totalA = theaterService.getTotalA();	// 총글수
		int totalP = (totalA+4)/5;			// 총페이지수
		//================================
		int startPage = (pg-1)/3*3+1;		// (2-1)/3*3+1=1
		int endPage = startPage + 2;		// endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("theaterList.jsp");
		return modelAndView;

	}

	@RequestMapping(value="/admin/theater/theaterView.do")
	public ModelAndView theaterView(HttpServletRequest request) {
		System.out.println("글 상세보기");
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
		
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
	
	@RequestMapping(value="/admin/theater/theaterDelete.do")
	public ModelAndView theaterDelete(HttpServletRequest request) {
		System.out.println("글 삭제");
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		// 2. DB 연동처리
	
		int result = theaterService.theaterDelete(theater_code);

		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterDelete.jsp");
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/admin/theater/theaterModifyForm.do")
	public ModelAndView theaterModifyForm(HttpServletRequest request) { 
		System.out.println("수정");
		
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		TheaterDTO theaterDTO = theaterService.theaterView(theater_code);
		ModelAndView modelAndView = new ModelAndView();
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		modelAndView.addObject("theaterDTO", theaterDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("theaterModifyForm.jsp");
		return modelAndView;
	
	}
	
	@RequestMapping(value="/admin/theater/theaterModify.do", method=RequestMethod.POST)
	public ModelAndView theaterModify(HttpServletRequest request, MultipartFile theater_photo_addr) {
		   // 데이터
	    System.out.println("수정완료");
	    ModelAndView modelAndView = new ModelAndView();
					
	    HttpSession session = request.getSession();
        try {
           request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
           e.printStackTrace();
           System.out.println("인코딩에러");
        }
        int theater_code = Integer.parseInt(request.getParameter("theater_code"));
        String theater_name = request.getParameter("theater_name");
//	            String theater_photo_addr = request.getParameter("theater_photo_addr");
//	            System.out.println(theater_photo_addr);
        String theater_phone = request.getParameter("theater_phone");
        // 데이터 지정
        TheaterDTO theaterDTO = new TheaterDTO();
        theaterDTO.setTheater_code(theater_code);
        theaterDTO.setTheater_name(theater_name);
//	            theaterDTO.setTheater_photo_addr(theater_photo_addr);
        theaterDTO.setTheater_phone(theater_phone);

  	    if(!theater_photo_addr.isEmpty()) {
  	    	  // 이미지 파일 저장
  	    	  
  	    	  String filePath = resourceProvider.getPath("image/theater_juso");
  	    	  String fileName = theater_photo_addr.getOriginalFilename();
  	    	  File file = new File(filePath, fileName);
  	    	  
  	    	  System.out.println("check1 : " + theater_photo_addr);
  	    	  System.out.println("check2 : " + fileName);
  	    	  System.out.println("check3 : " + theater_photo_addr.isEmpty());
  	    	  // 파일을 storage 폴더에 복사
  	    	  try {
  	    		  // getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStream을 구한다.
  	    		  FileCopyUtils.copy(theater_photo_addr.getInputStream(), new FileOutputStream(file));
  	    	  } catch (FileNotFoundException e) {
  	    		  e.printStackTrace();
  	    	  } catch (IOException e) {
  	    		  e.printStackTrace();
  	    	  }
  	    	  
  	    	  // DTO에 filename 넣기
  	    	  theaterDTO.setTheater_photo_addr(fileName);
  	      }
	    //DB
	     int result = theaterService.theaterModify(theaterDTO);
	     modelAndView.addObject("result", result);
	     modelAndView.setViewName("theaterModify.jsp");
	     return modelAndView;
	}
}
