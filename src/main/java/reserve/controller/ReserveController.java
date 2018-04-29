package reserve.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
import reserve.bean.ReserveDTO;
import resource.provider.ResourceProvider;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/movieList_forReserve.do")
	public void movieList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		
		int theater_code = 0;
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}
		String show_date = request.getParameter("show_date");

	    List<MovieDTO> list = reserveService.getMovieList(show_date, theater_code);

		JSONArray movie_list = new JSONArray();
		for(MovieDTO tmp : list) {
			JSONObject movie = new JSONObject();
			movie.put("movie_code", tmp.getMovie_code());
			movie.put("movie_name", tmp.getMovie_name());
			movie.put("movie_show_grade_name", tmp.getMovie_show_grade_name());
			movie_list.add(movie);
		}
		
		JSONObject json = new JSONObject();
		json.put("movies", movie_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value="/theaterList_forReserve.do")
	public void theaterList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		String show_date = request.getParameter("show_date");

	    List<TheaterDTO> list = reserveService.getTheaterList(show_date, movie_code);

		JSONArray theater_list = new JSONArray();
		for(TheaterDTO tmp : list) {
			JSONObject theater = new JSONObject();
			theater.put("theater_code", tmp.getTheater_code());
			theater.put("theater_name", tmp.getTheater_name());
			theater_list.add(theater);
		}
		
		JSONObject json = new JSONObject();
		json.put("theaters", theater_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value="/showList_forReserve.do")
	public void showList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		int theater_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		if(request.getParameter("theater_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("theater_code"));
		}
	    List<ShowPresentAllVO> list = reserveService.getShowList(movie_code, theater_code);

		JSONArray show_list = new JSONArray();
		for(ShowPresentAllVO tmp : list) {
			JSONObject show = new JSONObject();
			show.put("show_date", tmp.getShow_date());
			show.put("show_time", tmp.getShow_time());
			show.put("show_minute", tmp.getShow_minute());
			show.put("movie_name", tmp.getMovie_name());
			show.put("movie_recycle_time", tmp.getMovie_recycle_time());
			show.put("movie_director", tmp.getMovie_director());
			show.put("show_present_code", tmp.getShow_present_code());
			show.put("show_place_code", tmp.getShow_place_code());
			show.put("show_place_name", tmp.getShow_place_name());
			show_list.add(show);
		}
		
		JSONObject json = new JSONObject();
		json.put("shows", show_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
	
	/*@RequestMapping(value="/admin/theater/theaterInsertForm.do", method=RequestMethod.GET)
	public ModelAndView supertheaterInsertForm(HttpServletRequest request, HttpServletResponse response) { 
		System.out.println("글작성");
		// 매개변수가 반드시 2개일 필요 없음
		// HttpServletRequest request도 안 쓰고

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("theaterInsertForm.jsp");
		return modelAndView;

	}*/
	
	/*@RequestMapping(value="/theater.main/theaterInsertForm.do")
	public ModelAndView theaterInsertForm() { 
		System.out.println("글작성");
		// 매개변수가 반드시 2개일 필요 없음
		// HttpServletRequest request도 안 쓰고

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("theaterInsertForm.jsp");
		return modelAndView;

	}*/
	
	/*@RequestMapping(value="/admin/theater/theaterInsert.do", method=RequestMethod.POST)
	public ModelAndView supertheaterInsert(HttpServletRequest request,  MultipartFile theater_photo_addr, HttpServletResponse response) {
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
		int result = reserveService.theaterInsert(theaterDTO);
	
		// 3. 화면 네비게이션
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterInsert.jsp");
		return modelAndView;

	}

	*/
	@RequestMapping(value="/main/reserve/reserve.do")
	public ModelAndView theaterList(HttpServletRequest request) {
		System.out.println("reserve2.do");
		System.out.println("글 목록 처리");
		// 1. 사용자 입력 정보 추출
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
	
		//int day_count = Integer.parseInt(request.getParameter("day_count"));
		int day_count = 3;
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, day_count);
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DATE);
		
		String show_date = "" + year + month + day;
		
		System.out.println("상영 날짜 : "+show_date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String n2 = sdf.format(now);
		System.out.println("오늘 날짜 : "+ n2);
	
		
		
		int theater_code = 3;
		System.out.println("극장 코드 : " + theater_code);
		ArrayList<ReserveDTO> list = reserveService.reserveList(show_date, theater_code );
		
		System.out.println("리스트 : " + list);
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("show_date", show_date);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("reserve.jsp");
		System.out.println("끝");
		return modelAndView;

	}

	/*@RequestMapping(value="/admin/theater/theaterView.do")
	public ModelAndView supertheaterView(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("글 상세보기");
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동처리
		
		reserveService.updateHit(theater_code);
		TheaterDTO theaterDTO = reserveService.theaterView(theater_code);
		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("theaterDTO", theaterDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("theater_code", theater_code);
		modelAndView.setViewName("theaterView.jsp");
		return modelAndView;
	}*/
	
	/*@RequestMapping(value="/admin/theater/theaterDelete.do")
	public ModelAndView supertheaterDelete(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("글 삭제");
		// 1. 사용자 입력 정보 추출
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		// 2. DB 연동처리
	
		int result = reserveService.theaterDelete(theater_code);

		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("theaterDelete.jsp");
		return modelAndView;
	}*/
	
	
	
/*	@RequestMapping(value="/admin/theater/theaterModifyForm.do")
	public ModelAndView supertheaterModifyForm(HttpServletRequest request,HttpServletResponse response ) { 
		System.out.println("수정");
		
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		TheaterDTO theaterDTO = reserveService.theaterView(theater_code);
		ModelAndView modelAndView = new ModelAndView();
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		modelAndView.addObject("theaterDTO", theaterDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("theaterModifyForm.jsp");
		return modelAndView;
	
	}
	
	@RequestMapping(value="/admin/theater/theaterModify.do", method=RequestMethod.POST)
	public ModelAndView supertheaterModify(HttpServletRequest request, MultipartFile theater_photo_addr,HttpServletResponse response) {
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
	     int result = reserveService.theaterModify(theaterDTO);
	     modelAndView.addObject("result", result);
	     modelAndView.setViewName("theaterModify.jsp");
	     return modelAndView;
	}*/
}
