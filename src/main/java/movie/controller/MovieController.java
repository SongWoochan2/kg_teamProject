package movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import evaluat.bean.EvaluatDTO;
import evaluat.controller.EvaluatService;
import movie.bean.MovieDTO;
import movie.bean.MoviePage;
import movie.bean.MovieResultDTO;
import movie.bean.ReserveRank;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.bean.MoviePosterDTO;
import moviephoto.controller.MoviePhotoService;
import movietrailer.bean.MovieTrailerDTO;
import movietrailer.controller.MovieTrailerService;
import select.bean.SelectDTO;
import select.controller.SelectService;
import showPresent.controller.ShowPresentService;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieService;
	@Autowired
	private MoviePhotoService moviePhotoService;
	@Autowired
	private MovieTrailerService movieTrailerService;
	@Autowired
	private SelectService selectService;
	@Autowired
	private ShowPresentService showPresentService;
	@Autowired
	private EvaluatService evaluatService;
	
	// 관리자 영역
	
	@RequestMapping(value="/admin/movie/movieAdmin.do")
	public ModelAndView movieAdminForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			
		String admin_id = (String) session.getAttribute("admin_id");
		ModelAndView modelAndView = new ModelAndView();
		if(admin_id != null) {
			System.out.println("입장 성공");
			int pg = Integer.parseInt(request.getParameter("pg"));
			int endNum = pg * 10;
			int startNum = endNum - 9;
			
			ArrayList<MovieDTO> list = movieService.movieList(startNum, endNum);
			
			int totalA = movieService.getTotalA();
			int totalPage = (totalA + 9) / 10;
			
			int startPage = (pg-1)/3*3 + 1;
			int endPage = startPage + 2;
			if(totalPage < endPage) endPage = totalPage;
			
			
			MoviePage moviePage = new MoviePage();
			moviePage.setEndPage(endPage);
			moviePage.setStartPage(startPage);
			moviePage.setTotalPage(totalPage);
			moviePage.setPg(pg);
			
			
			modelAndView.addObject("list", list);
			modelAndView.addObject("moviePage", moviePage);
			
			modelAndView.setViewName("movieAdmin.jsp");
			
		}else if(admin_id == null) {
			modelAndView.setViewName("../adminMain/adminLoginCheck.jsp");
			System.out.println("입장 실패");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieInsertForm.do")
	public ModelAndView movieInsertForm(HttpServletRequest request) {

		String page = request.getParameter("pg");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieInsertForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieInsert.do")
	public ModelAndView movieInsert(HttpServletRequest request) {
		MovieDTO movieDTO = new MovieDTO();
		String page = request.getParameter("pg");
		movieDTO.setMovie_name(request.getParameter("movie_name"));
		movieDTO.setMovie_content(request.getParameter("movie_content"));
		movieDTO.setMake_nation(request.getParameter("make_nation"));
		movieDTO.setMovie_director(request.getParameter("movie_director"));
		movieDTO.setMovie_recycle_time(Integer.parseInt(request.getParameter("movie_recycle_time")));
		movieDTO.setMovie_show_grade_name(request.getParameter("movie_show_grade_name"));
		movieDTO.setMovie_type1(request.getParameter("movie_type1"));
		movieDTO.setMovie_type2(request.getParameter("movie_type2"));
		movieDTO.setMovie_type3(request.getParameter("movie_type3"));
		movieDTO.setMovie_open_date(request.getParameter("movie_open_date"));
		movieDTO.setAppear_actor(request.getParameter("appear_actor"));
		int result = movieService.movieInsert(movieDTO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result",result);
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieInsert.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieView.do")
	public ModelAndView movieView(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		MovieDTO movieDTO = movieService.movieView(movie_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movieDTO", movieDTO);
		modelAndView.setViewName("movieView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieDelete.do")
	public ModelAndView movieDelete(HttpServletRequest request) {
		String page = request.getParameter("pg");
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		int result = movieService.movieDelete(movie_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieDelete.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieModifyForm.do")
	public ModelAndView movieModifyForm(HttpServletRequest request) {
		String page = request.getParameter("pg");
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieModifyForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieModify.do")
	public ModelAndView movieModify(HttpServletRequest request) {
		String page = request.getParameter("pg");
		MovieDTO movieDTO = new MovieDTO();
		movieDTO.setMovie_code(Integer.parseInt(request.getParameter("movie_code")));
		movieDTO.setMovie_name(request.getParameter("movie_name"));
		movieDTO.setMovie_content(request.getParameter("movie_content"));
		movieDTO.setMake_nation(request.getParameter("make_nation"));
		movieDTO.setMovie_director(request.getParameter("movie_director"));
		movieDTO.setMovie_recycle_time(Integer.parseInt(request.getParameter("movie_recycle_time")));
		movieDTO.setMovie_show_grade_name(request.getParameter("movie_show_grade_name"));
		movieDTO.setMovie_type1(request.getParameter("movie_type1"));
		movieDTO.setMovie_type2(request.getParameter("movie_type2"));
		movieDTO.setMovie_type3(request.getParameter("movie_type3"));
		movieDTO.setMovie_open_date(request.getParameter("movie_open_date"));
		movieDTO.setAppear_actor(request.getParameter("appear_actor"));
		int result = movieService.movieModify(movieDTO);
		ModelAndView modelAndView = new ModelAndView();
		
		
		modelAndView.addObject("result",result);
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieModify.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/searchMovies.do")
	public void movieSearch(HttpServletRequest request, HttpServletResponse response) {
		String movie_name= request.getParameter("movie_name");

		List<MovieDTO> movie_list = null;
		
		if(movie_name == null) {
			movie_list = movieService.movieList(0, 100);
		} else {			
			movie_list = movieService.movieSearchByName(movie_name);
		}
		
		JSONArray json_list = new JSONArray();
		for(MovieDTO tmp : movie_list) {
			JSONObject json_movie = new JSONObject();
			json_movie.put("movie_code", tmp.getMovie_code());
			json_movie.put("movie_name", tmp.getMovie_name());
			json_movie.put("movie_director", tmp.getMovie_director());
			json_movie.put("movie_recycle_time", tmp.getMovie_recycle_time());
			json_movie.put("movie_open_date", tmp.getMovie_open_date());
			json_list.add(json_movie);
		}
		
		JSONObject json = new JSONObject();
		json.put("movie_list", json_list);
		
		try {
			response.getWriter().println(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	// 메인 영역
	
	
	@RequestMapping(value="/main/movie/movieDetailView.do")
	public ModelAndView movieDetailView(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		int like_able = 0;
		String member_id = (String) session.getAttribute("memId");
		int photo_pg = 1;
		int trailer_pg = 1;
		int review_pg = 1;
		if(request.getParameter("photo_pg") != null) {
			photo_pg = Integer.parseInt(request.getParameter("photo_pg"));				
		}
		if(request.getParameter("trailer_pg") != null) {
			trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));					
		}
		if(request.getParameter("review_pg") != null) {
			review_pg = Integer.parseInt(request.getParameter("review_pg"));				
		}
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));

		if(member_id != null) {
			like_able = selectService.selectMovieList(member_id, movie_code);							
		}
		
		int p_endNum = photo_pg;
		int p_startNum = p_endNum;	
		int t_endNum = trailer_pg*3;
		int t_startNum = t_endNum-2;	
		int e_endNum = review_pg*4;
		int e_startNum = e_endNum-3;
		
		// 영화 예매율 구하기
		Integer all_reserve_num =null;
		if(movieService.allReserveCount() == null) {
			all_reserve_num = 0;
		}else {
			all_reserve_num = movieService.allReserveCount();				
		}
		double movieReserveNum = movieReserveNum(movie_code);
		double reserve_rate = Double.parseDouble(String.format("%.3f",(double)movieReserveNum/all_reserve_num))*100;
		
		// review_page 정보
		int e_totalA = evaluatService.getTotal(movie_code);
		int e_totalPage = (e_totalA+3) / 4;
		int e_startPage = (review_pg-1)/3*3 + 1;
		int e_endPage = e_startPage + 2;
		if(e_totalPage < e_endPage) e_endPage = e_totalPage;
		
		MoviePage e_moviePage = new MoviePage();
		e_moviePage.setStartPage(e_startPage);
		e_moviePage.setEndPage(e_endPage);
		e_moviePage.setTotalA(e_totalA);
		e_moviePage.setTotalPage(e_totalPage);
		e_moviePage.setPg(review_pg);
		
		
		// photo_page 정보
		int p_totalA = moviePhotoService.getTotalA(movie_code);
		int p_totalPage = (p_totalA) / 1;
		
		if(p_totalPage < photo_pg) photo_pg = p_totalPage;
		
		MoviePage p_moviePage = new MoviePage();
		p_moviePage.setTotalA(p_totalA);
		p_moviePage.setTotalPage(p_totalPage);
		p_moviePage.setPg(photo_pg);
		
		// trailer_page 정보
		int t_totalA = movieTrailerService.getTotalA(movie_code);
		int t_totalPage = (t_totalA + 2) / 3;
		
		if(t_totalPage < trailer_pg) trailer_pg = t_totalPage;
		
		MoviePage t_moviePage = new MoviePage();
		t_moviePage.setTotalA(t_totalA);
		t_moviePage.setTotalPage(t_totalPage);
		t_moviePage.setPg(trailer_pg);

		ModelAndView modelAndView = new ModelAndView();
		MovieDTO movieDTO = movieService.movieView(movie_code);
		if(moviePhotoService.moviePosterView(movie_code) != null) {
			MoviePhotoDTO poster_addr = moviePhotoService.moviePosterView(movie_code);			
			modelAndView.addObject("poster_addr", poster_addr);
		}
		ArrayList<MovieTrailerDTO> trailer_list = movieTrailerService.movieTrailerList(t_startNum, t_endNum, movie_code);
		ArrayList<MoviePhotoDTO> photo_list = moviePhotoService.moviePhotoList(p_startNum, p_endNum, movie_code);
		ArrayList<EvaluatDTO> evaluat_list = evaluatService.EvaluatList(movie_code, e_startNum, e_endNum);
		
		modelAndView.addObject("like_able", like_able);
		modelAndView.addObject("movieDTO", movieDTO);
		modelAndView.addObject("evaluat_list", evaluat_list);
		modelAndView.addObject("e_moviePage", e_moviePage);
		modelAndView.addObject("photo_list", photo_list);
		modelAndView.addObject("p_moviePage", p_moviePage);
		modelAndView.addObject("trailer_list", trailer_list);
		modelAndView.addObject("t_moviePage", t_moviePage);
		modelAndView.addObject("reserve_rate", reserve_rate);
		modelAndView.setViewName("movieInfo.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/movie/movieFinder_result.do")
	public ModelAndView movieFinder_result(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("파인더");
		int pg = 1;		
		int endNum = 0;
		int startNum = 0;
		String[] movie_type = null;
		String[] make_nation = null;
		String[] movie_show_grade = null;
		String movie_keyword = null;
		String movie_search = "";
		int movie_code = 0;
		
//			받아온 값 저장
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		endNum = pg * 12;
		startNum = endNum - 11;	
		if(request.getParameterValues("movie_type") != null) {
			movie_type = request.getParameterValues("movie_type");	
		}
		if(request.getParameterValues("movie_show_grade") != null) {
			movie_show_grade = request.getParameterValues("movie_show_grade");					
		}
		if(request.getParameterValues("make_nation") != null) {
			make_nation = request.getParameterValues("make_nation");					
		}
		if(request.getParameter("movie_search") != null) {
			movie_search = request.getParameter("movie_search");
		}
		if(request.getParameter("movie_keyword") != null) {
			movie_keyword = request.getParameter("movie_keyword");
		}
		
		
//			받아온 값 처리
		Map<String, Object> map = new HashMap<>();
		
		map.put("movie_type", movie_type);
		map.put("make_nation", make_nation);
		map.put("movie_show_grade", movie_show_grade);
		map.put("movie_search", movie_search);
		map.put("movie_keyword", movie_keyword);
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		ArrayList<Integer> code_list = new ArrayList<>();
		ArrayList<MovieDTO> find_list = movieService.movieFinder(map);
		Map<Integer, String> poster_map = new HashMap<>();
		Map<Integer, Double> reserve_rate_map = new HashMap<>();
		
		
		Integer all_reserve_num =null;
		if(movieService.allReserveCount() == null) {
			all_reserve_num = 0;
		}else {
			all_reserve_num = movieService.allReserveCount();				
		}
		
		for(MovieDTO finder_result : find_list) {
			code_list.add(finder_result.getMovie_code());			
			
			// 영화 예매율 구하기
			double movieReserveNum = movieReserveNum(finder_result.getMovie_code());
			double reserve_rate = Double.parseDouble(String.format("%.3f",(double)movieReserveNum/all_reserve_num))*100;
			reserve_rate_map.put(finder_result.getMovie_code(), reserve_rate);
		}
		if(code_list.size() == 0) {code_list = null;}
		ArrayList<MoviePosterDTO> poster_list = moviePhotoService.moviePosterList(code_list, 1, 12);
		for(MoviePosterDTO poster_result : poster_list) {
			poster_map.put(poster_result.getMovie_code(), poster_result.getMovie_photo_addr());
		}
		
		
//			페이징 영역
		
		int totalA = movieService.FinderTotalA(map);
		int totalPage = (totalA + 11) / 12;
		
		int startPage = (pg-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(totalPage < endPage) endPage = totalPage;
		
		MoviePage moviePage = new MoviePage();
		moviePage.setTotalA(totalA);
		moviePage.setEndPage(endPage);
		moviePage.setStartPage(startPage);
		moviePage.setTotalPage(totalPage);
		moviePage.setPg(pg);
		

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("movie_show_grade", movie_show_grade);
		modelAndView.addObject("make_nation", make_nation);
		modelAndView.addObject("movie_type", movie_type);
		modelAndView.addObject("movie_search", movie_search);
		modelAndView.addObject("movie_keyword", movie_keyword);
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.addObject("find_list", find_list);
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("reserve_rate_map", reserve_rate_map);
		modelAndView.setViewName("Finder_nevi.jsp");
		return modelAndView;
		
		
	}
	
	
	@RequestMapping(value="/main/movie/movieFinder.do")
	public ModelAndView movieFinder(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("파인더");
			int pg = 1;		
			int endNum = 0;
			int startNum = 0;
			String[] movie_type = null;
			String[] make_nation = null;
			String[] movie_show_grade = null;
			String movie_keyword = null;
			String movie_search = "";
			int movie_code = 0;
			
//			받아온 값 저장
			if(request.getParameter("pg") != null) {
				pg = Integer.parseInt(request.getParameter("pg"));
			}
			endNum = pg * 12;
			startNum = endNum - 11;	
			if(request.getParameterValues("movie_type") != null) {
				movie_type = request.getParameterValues("movie_type");	
			}
			if(request.getParameterValues("movie_show_grade") != null) {
				movie_show_grade = request.getParameterValues("movie_show_grade");					
			}
			if(request.getParameterValues("make_nation") != null) {
				make_nation = request.getParameterValues("make_nation");					
			}
			if(request.getParameter("movie_search") != null) {
				movie_search = request.getParameter("movie_search");
			}
			if(request.getParameter("movie_keyword") != null) {
				movie_keyword = request.getParameter("movie_keyword");
			}
			
			
//			받아온 값 처리
			Map<String, Object> map = new HashMap<>();
			
			map.put("movie_type", movie_type);
			map.put("make_nation", make_nation);
			map.put("movie_show_grade", movie_show_grade);
			map.put("movie_search", movie_search);
			map.put("movie_keyword", movie_keyword);
			map.put("endNum", endNum);
			map.put("startNum", startNum);
			ArrayList<Integer> code_list = new ArrayList<>();
			ArrayList<MovieDTO> find_list = movieService.movieFinder(map);
			Map<Integer, String> poster_map = new HashMap<>();
			Map<Integer, Double> reserve_rate_map = new HashMap<>();
			
			
			Integer all_reserve_num =null;
			if(movieService.allReserveCount() == null) {
				all_reserve_num = 0;
			}else {
				all_reserve_num = movieService.allReserveCount();				
			}
			
			for(MovieDTO finder_result : find_list) {
				code_list.add(finder_result.getMovie_code());			
				
				// 영화 예매율 구하기
				double movieReserveNum = movieReserveNum(finder_result.getMovie_code());
				double reserve_rate = Double.parseDouble(String.format("%.3f",(double)movieReserveNum/all_reserve_num))*100;
				reserve_rate_map.put(finder_result.getMovie_code(), reserve_rate);
			}
			if(code_list.size() == 0) {code_list = null;}
			ArrayList<MoviePosterDTO> poster_list = moviePhotoService.moviePosterList(code_list, 1, 12);
			for(MoviePosterDTO poster_result : poster_list) {
				poster_map.put(poster_result.getMovie_code(), poster_result.getMovie_photo_addr());
			}
			
			
//			페이징 영역
			
			int totalA = movieService.FinderTotalA(map);
			int totalPage = (totalA + 11) / 12;
			
			int startPage = (pg-1)/3*3 + 1;
			int endPage = startPage + 2;
			if(totalPage < endPage) endPage = totalPage;
			
			MoviePage moviePage = new MoviePage();
			moviePage.setTotalA(totalA);
			moviePage.setEndPage(endPage);
			moviePage.setStartPage(startPage);
			moviePage.setTotalPage(totalPage);
			moviePage.setPg(pg);
			
			
			
//			JSONArray j_find_list = new JSONArray();
//			for(MovieDTO tmp : find_list) {
//				JSONObject json_movie = new JSONObject();
//				json_movie.put("movie_code", tmp.getMovie_code());
//				json_movie.put("movie_name", tmp.getMovie_name());
//				json_movie.put("good_num", tmp.getGood_num());
//				json_movie.put("ACC_AUDIENCE_NUM", tmp.getAcc_audience_num());
//				json_movie.put("movie_evaluat_num", tmp.getMovie_evaluat_num());
//				json_movie.put("acc_evaluat_score", tmp.getAcc_evaluat_score());
//				json_movie.put("movie_open_date", tmp.getMovie_open_date());
//				j_find_list.add(json_movie);
//			}
//			
//
//			JSONObject json_moviePage = new JSONObject();
//			json_moviePage.put("totalA", moviePage.getTotalA());
//			json_moviePage.put("endPage", moviePage.getEndPage());
//			json_moviePage.put("startPage", moviePage.getStartPage());
//			json_moviePage.put("totalPage", moviePage.getTotalPage());
//			json_moviePage.put("pg", moviePage.getPg());
//	
//			
//			JSONArray j_movie_type = new JSONArray();
//			if(movie_type != null) {
//				for(String tmp : movie_type) {
//					JSONObject json_movie_type = new JSONObject();
//					json_movie_type.put("movie_code", tmp);
//					j_movie_type.add(json_movie_type);
//				}
//			}
//			
//			JSONArray j_make_nation = new JSONArray();
//			if(make_nation != null) {	
//				for(String tmp : make_nation) {
//					JSONObject json_make_nation = new JSONObject();
//					json_make_nation.put("make_nation", tmp);
//					j_make_nation.add(json_make_nation);
//				}
//			}
//			
//			JSONArray j_movie_show_grade = new JSONArray();
//			if(movie_show_grade != null) {
//				for(String tmp : movie_show_grade) {
//					JSONObject json_movie_show_grade = new JSONObject();
//					json_movie_show_grade.put("movie_show_grade", tmp);
//					j_movie_show_grade.add(json_movie_show_grade);
//				}
//			}
//
//			JSONArray j_poster_map = new JSONArray();
//			for(int i =0; i<poster_map.size(); i++) {
//				JSONObject json_poster_map = new JSONObject();
//				json_poster_map.put("poster_code", poster_map.keySet());
//				json_poster_map.put("poster_addr", poster_map.values());
//				j_poster_map.add(json_poster_map);
//			}
//			
//			JSONArray j_reserve_rate_map = new JSONArray();
//			for(int i =0; i<reserve_rate_map.size(); i++) {
//				JSONObject json_reserve_rate_map = new JSONObject();
//				json_reserve_rate_map.put("reserve_rate_code", reserve_rate_map.keySet());
//				json_reserve_rate_map.put("reserve_rate", reserve_rate_map.values());
//				j_reserve_rate_map.add(json_reserve_rate_map);
//			}
//
//			JSONObject json = new JSONObject();
//			json.put("find_list", j_find_list);
//			json.put("make_nation", j_make_nation);
//			json.put("movie_type", j_movie_type);
//			json.put("movie_show_grade", j_movie_show_grade);
//			json.put("json_moviePage", json_moviePage);
//			json.put("movie_search", movie_search);
//			json.put("movie_keyword", movie_keyword);
//			json.put("j_poster_map", j_poster_map);
//			json.put("j_reserve_rate_map", j_reserve_rate_map);
//			
//			try {
//				response.getWriter().println(json);
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			return;
			
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("movie_show_grade", movie_show_grade);
		modelAndView.addObject("make_nation", make_nation);
		modelAndView.addObject("movie_type", movie_type);
		modelAndView.addObject("movie_search", movie_search);
		modelAndView.addObject("movie_keyword", movie_keyword);
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.addObject("find_list", find_list);
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("reserve_rate_map", reserve_rate_map);
		modelAndView.setViewName("movieFinder.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/movieChart.do")
	public ModelAndView movieChart(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		String member_id = (String) session.getAttribute("memId");
		int pg = 1;
		int like_able = 0;
		String chartType = "";
		
		if(request.getParameter("chartType") != null) {
			chartType = request.getParameter("chartType");
		}else {
			chartType = "movieReserveRank";
		}
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		int endNum = pg * 12;
		int startNum = endNum - 11;	
		int totalA = movieService.movieNonOpenTotal();
		int totalPage = (totalA + 11) / 12;
		
		int startPage = (pg-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(totalPage < endPage) endPage = totalPage;
		MoviePage moviePage = new MoviePage();
		moviePage.setTotalA(totalA);
		moviePage.setEndPage(endPage);
		moviePage.setStartPage(startPage);
		moviePage.setTotalPage(totalPage);
		moviePage.setPg(pg);
		ArrayList<Integer> code_list = new ArrayList<>();
		ArrayList<ReserveRank> reserve_list = null;
		ArrayList<MovieDTO> top_movie_list = null;
		ArrayList<MovieDTO> bottom_movie_list = null;
		Map<Integer, String> poster_map = new HashMap<>();
		Map<Integer, Double> reserve_rate_map = new HashMap<>();
		Map<Integer, Object> like_map = new HashMap<>();
		int reserve_count = 0;
		
		if(chartType.equals("movieReserveRank")) {
			
			reserve_list = movieService.movieReserveRank(1, 7);
			top_movie_list = new ArrayList<>();
			bottom_movie_list = new ArrayList<>();
			
			for(ReserveRank rank : reserve_list) {
				reserve_count++;
				MovieDTO movieDTO = movieService.movieView(rank.getMovie_code());
				if(reserve_count<4) {
					top_movie_list.add(movieDTO);
				}else if(reserve_count>=4) {
					bottom_movie_list.add(movieDTO);
				}	
			}
			
		}else if(chartType.equals("movieNonOpenRank")) {
			top_movie_list = movieService.movieNonOpenRank(startNum,endNum);
		}else if(chartType.equals("movieScoreRank")) {
			top_movie_list = movieService.movieScoreRank(1,3);
			bottom_movie_list = movieService.movieScoreRank(4,7);
		}else if(chartType.equals("movieAudienceRank")) {
			top_movie_list = movieService.movieAudienceRank(1, 3);
			bottom_movie_list = movieService.movieAudienceRank(4, 7);
		}
		
		Integer all_reserve_num =null;
		if(movieService.allReserveCount() == null) {
			all_reserve_num = 0;
		}else {
			all_reserve_num = movieService.allReserveCount();				
		}
		
		int top_count=0;
		if(top_movie_list != null) {
			code_list.clear();
			for(MovieDTO movieDTO : top_movie_list) {
				top_count++;
				code_list.add(movieDTO.getMovie_code());
				
				// 영화 예매율 구하기
				double movieReserveNum = movieReserveNum(movieDTO.getMovie_code());
				double reserve_rate = ((double)movieReserveNum/all_reserve_num)*100;
				reserve_rate_map.put(movieDTO.getMovie_code(), reserve_rate);
				
				if(member_id != null) {
					like_able = selectService.selectMovieList(member_id, movieDTO.getMovie_code());							
					like_map.put(movieDTO.getMovie_code(), like_able);
				}else {
					like_map.put(movieDTO.getMovie_code(), like_able);
				}
			}
			if(code_list.size()==0) {code_list=null;}
			ArrayList<MoviePosterDTO> top_poster_list = moviePhotoService.moviePosterList(code_list, 1, top_count);
			for(MoviePosterDTO poster_result : top_poster_list) {
				poster_map.put(poster_result.getMovie_code(), poster_result.getMovie_photo_addr());
			}
		}
		
		int bottom_count=0;
		if(bottom_movie_list != null) {
			code_list.clear();
			for(MovieDTO movieDTO : bottom_movie_list) {
				bottom_count++;
				code_list.add(movieDTO.getMovie_code());
				
				// 영화 예매율 구하기
				double movieReserveNum = movieReserveNum(movieDTO.getMovie_code());
				double reserve_rate = ((double)movieReserveNum/all_reserve_num)*100;
				reserve_rate_map.put(movieDTO.getMovie_code(), reserve_rate);
				
				if(member_id != null) {
					like_able = selectService.selectMovieList(member_id, movieDTO.getMovie_code());							
					like_map.put(movieDTO.getMovie_code(), like_able);
				}else {
					like_map.put(movieDTO.getMovie_code(), like_able);
				}
			}
			if(code_list.size()==0) {code_list=null;}
			ArrayList<MoviePosterDTO> bottom_poster_list = moviePhotoService.moviePosterList(code_list, 1, bottom_count);
			for(MoviePosterDTO poster_result : bottom_poster_list) {
				poster_map.put(poster_result.getMovie_code(), poster_result.getMovie_photo_addr());
			}
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		if(request.getParameter("pg") != null) {
			modelAndView.addObject("moviePage", moviePage);			
		}
		modelAndView.addObject("reserve_rate_map", reserve_rate_map);
		modelAndView.addObject("chartType", chartType);
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("like_map", like_map);
		if(top_movie_list != null) {
			modelAndView.addObject("top_movie_list", top_movie_list);			
		}
		if(bottom_movie_list != null) {
			modelAndView.addObject("bottom_movie_list", bottom_movie_list);			
		}
		modelAndView.setViewName("movieChart.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/movieReview.do")
	public ModelAndView movieReview(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		String member_id = (String) session.getAttribute("memId");
		int movie_code = 0;
		int movie_pg = 1;
		int review_pg = 1;
		ArrayList<EvaluatDTO> evaluat_list = null;
		if(request.getParameter("movie_pg") != null) {
			movie_pg = Integer.parseInt(request.getParameter("movie_pg"));
		}
		if(request.getParameter("review_pg") != null) {
			review_pg = Integer.parseInt(request.getParameter("review_pg"));
		}
		
		int m_endNum = movie_pg*4;
		int m_startNum = m_endNum-3;	

		int e_endNum = review_pg*6;
		int e_startNum = e_endNum-5;	
		

		Integer show_movie_total = showPresentService.getUniqueMovieCodeCount();
		ArrayList<MovieDTO> movie_list =  movieService.presentMovieList(m_startNum,m_endNum);
		Map<Integer, MoviePhotoDTO> poster_map = moviePhotoService.getMapOfShowMoviePoster();
		Map<Integer, SelectDTO> like_map = null;
		if(member_id != null) {
			like_map = selectService.getSelectOfMember(member_id);			
		}
		Map<Integer, ReserveRank> reserve_rate_map_pre = movieService.getMapOfReserveNum();
		int totalReserveNum = 0;
		for(ReserveRank tmp : reserve_rate_map_pre.values()) {
			totalReserveNum += tmp.getReserve_num();
		}
		Map<Integer, Double> reserve_rate_map = new HashMap<>();
		
		for(ReserveRank tmp : reserve_rate_map_pre.values()) {
			reserve_rate_map.put(
					tmp.getMovie_code(), 
					Double.parseDouble(String.format("%.3f",(double)tmp.getReserve_num()/totalReserveNum))*100);
		}
		
		int m_totalA = show_movie_total;
		int m_totalPage = ((m_totalA+3) / 4);		
		if(m_totalPage < movie_pg) movie_pg = m_totalPage;
		
		MoviePage m_moviePage = new MoviePage();
		m_moviePage.setTotalA(m_totalA);
		m_moviePage.setTotalPage(m_totalPage);
		m_moviePage.setPg(movie_pg);
		
		if(request.getParameter("movie_code") == null) {
			movie_code = movie_list.get(0).getMovie_code();
		}else {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));			
		}
		
		int e_totalA = evaluatService.getTotal(movie_code);
		int e_totalPage = ((e_totalA+5) / 6);
		int e_startPage = (review_pg-1)/3*3 + 1;
		int e_endPage = e_startPage + 2;

		if(e_totalPage < e_endPage) e_endPage = e_totalPage;
		
		
		MoviePage e_moviePage = new MoviePage();
		e_moviePage.setTotalA(e_totalA);
		e_moviePage.setStartPage(e_startPage);
		e_moviePage.setEndPage(e_endPage);
		e_moviePage.setTotalPage(e_totalPage);
		e_moviePage.setPg(review_pg);
		
		evaluat_list = evaluatService.EvaluatList(movie_code, e_startNum, e_endNum);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.addObject("reserve_rate_map", reserve_rate_map);
		modelAndView.addObject("totalReserveNum", totalReserveNum);
		if(member_id != null) {
			modelAndView.addObject("like_map", like_map);
		}
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("m_moviePage", m_moviePage);
		modelAndView.addObject("e_moviePage", e_moviePage);
		modelAndView.addObject("movie_list", movie_list);
		if(evaluat_list != null) {			
			modelAndView.addObject("evaluat_list", evaluat_list);
		}
		modelAndView.setViewName("movieReview.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/main/main/movieMain.do")
	public ModelAndView movieMain(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		String member_id = (String) session.getAttribute("memId");
		int like_able = 0;
		ArrayList<Integer> code_list = new ArrayList<>();
		ArrayList<ReserveRank> reserve_list = null;
		ArrayList<MovieDTO> movie_list = new ArrayList<>();
		Map<Integer, String> poster_map = new HashMap<>();
		Map<Integer, Double> reserve_rate_map = new HashMap<>();
		Map<Integer, Object> like_map = new HashMap<>();
		reserve_list = movieService.movieReserveRank(1, 3);
		
		
		Integer all_reserve_num =null;
		if(movieService.allReserveCount() == null) {
			all_reserve_num = 0;
		}else {all_reserve_num = movieService.allReserveCount();}
		
		for(ReserveRank rank : reserve_list) {
			code_list.add(rank.getMovie_code());
			MovieDTO movieDTO = movieService.movieView(rank.getMovie_code());
			
			movie_list.add(movieDTO);
			
			// 영화 예매율 구하기
			double movieReserveNum = movieReserveNum(rank.getMovie_code());
			double reserve_rate = Double.parseDouble(String.format("%.3f",(double)movieReserveNum/all_reserve_num))*100;
			reserve_rate_map.put(rank.getMovie_code(), reserve_rate);
			
			if(member_id != null) {
				like_able = selectService.selectMovieList(member_id, movieDTO.getMovie_code());							
				like_map.put(movieDTO.getMovie_code(), like_able);
			}else {
				like_map.put(movieDTO.getMovie_code(), like_able);
			}
		}
		

		
		ArrayList<MoviePosterDTO> poster_list = moviePhotoService.moviePosterList(code_list, 1, 3);
		for(MoviePosterDTO poster_result : poster_list) {
			poster_map.put(poster_result.getMovie_code(), poster_result.getMovie_photo_addr());
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("movie_list", movie_list);
		modelAndView.addObject("reserve_rate_map", reserve_rate_map);
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("like_map", like_map);
		modelAndView.setViewName("index.jsp");
		return modelAndView;
	}

	public double movieReserveNum(int movie_code) {
		Integer movieReserveNum = 0;
		
		if(movieService.movieReserveNum(movie_code) == null) {
			movieReserveNum = 0;
		}else {
			movieReserveNum = movieService.movieReserveNum(movie_code);
		}
		return movieReserveNum;
	}
}



















