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

import movie.bean.MovieDTO;
import movie.bean.MoviePage;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.controller.MoviePhotoService;
import movietrailer.bean.MovieTrailerDTO;
import movietrailer.controller.MovieTrailerService;
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
	// 관리자 영역
	
	@RequestMapping(value="/admin/movie/movieAdmin.do")
	public ModelAndView movieAdminForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String admin_id = (String) session.getAttribute("admin_id");
		ModelAndView modelAndView = new ModelAndView();
		if(admin_id != null) {
			System.out.println("입장 성공");
			int pg = Integer.parseInt(request.getParameter("pg"));
			System.out.println("pg : " + pg);
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
	public ModelAndView movieDetailView(HttpServletRequest request, HttpSession session) {
		String member_id = (String) session.getAttribute("memId");
		int photo_pg = Integer.parseInt(request.getParameter("photo_pg"));	
		int trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));		
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		
		// 찜하기 정보/등록
		if(request.getParameter("good") != null) {
			int good = Integer.parseInt(request.getParameter("good"));
			int good_update = movieService.goodUpdate(movie_code,good);
			if(good_update == 1) {
				System.out.println("수정완료");
				
				if(good == 1) {
					int add_result = selectService.addSelect(member_id, movie_code);
					if(add_result == 1) {
						System.out.println("추가완료");
					}else if(add_result == 0) {
						System.out.println("추가실패");
					}					
				}else if(good == -1) {
					int delete_result = selectService.deleteSelect(member_id, movie_code);
					if(delete_result == 1) {
						System.out.println("삭제완료");
					}else if(delete_result == 0) {
						System.out.println("삭제실패");
					}					
				}
				
			}else if(good_update == 0) {
				System.out.println("수정실패");				
			}
		}
		
		int like_able = selectService.selectMovieList(member_id, movie_code);
		
		int p_endNum = photo_pg;
		int p_startNum = p_endNum;	
		int t_endNum = trailer_pg*3;
		int t_startNum = t_endNum-2;	
		
		
		
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

		MovieDTO movieDTO = movieService.movieView(movie_code);
		MoviePhotoDTO poster_addr = moviePhotoService.moviePosterView(movie_code);
		ArrayList<MovieTrailerDTO> trailer_list = movieTrailerService.movieTrailerList(t_startNum, t_endNum, movie_code);
		ArrayList<MoviePhotoDTO> photo_list = moviePhotoService.moviePhotoList(p_startNum, p_endNum, movie_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("like_able", like_able);
		modelAndView.addObject("movieDTO", movieDTO);
		modelAndView.addObject("poster_addr", poster_addr);
		modelAndView.addObject("photo_list", photo_list);
		modelAndView.addObject("p_moviePage", p_moviePage);
		modelAndView.addObject("trailer_list", trailer_list);
		modelAndView.addObject("t_moviePage", t_moviePage);
		modelAndView.setViewName("movieInfo.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/movieFinder.do")
	public ModelAndView movieFinder(HttpServletRequest request) {
			int pg = 1;		
			int endNum = 0;
			int startNum = 0;
			String[] movie_type = null;
			String[] make_nation = null;
			String[] movie_show_grade = null;
			String movie_keyword = "";
			String movie_search = "";

//			받아온 값 저장
			if(request.getParameter("pg") != null) {
				pg = Integer.parseInt(request.getParameter("pg"));
				endNum = pg * 12;
				startNum = endNum - 11;	
			}
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
			
			ArrayList<MovieDTO> find_list = movieService.movieFinder(map);
			Map<Integer, String> photo_map = new HashMap<>();
			
			for(MovieDTO finder_result : find_list) {
//				System.out.println("영화명 : " +finder_result.getMovie_name());
				
				MoviePhotoDTO photo_addr = moviePhotoService.moviePosterView(finder_result.getMovie_code());
				
				photo_map.put(finder_result.getMovie_code(), photo_addr.getMovie_photo_addr());	
//				System.out.println("photo_addr : "+photo_addr.getMovie_photo_addr());
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
		modelAndView.addObject("movie_search", movie_type);
		modelAndView.addObject("movie_keyword", movie_type);
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.addObject("find_list", find_list);
		modelAndView.addObject("photo_map", photo_map);
		modelAndView.setViewName("movieFinder.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/movieChart.do")
	public ModelAndView movieChart(HttpServletRequest request) {
//		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("movieChart.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/movieReview.do")
	public ModelAndView movieReview(HttpServletRequest request) {
		int movie_count = 0;
		int movie_code = 0 ;
		int movie_pg = Integer.parseInt(request.getParameter("movie_pg"));
		
		int m_endNum = movie_pg*4;
		int m_startNum = m_endNum-3;	

		
		ArrayList<String> code_list = showPresentService.getUniqueMovieCode();
		for(String tmp : code_list) {movie_count++;}
		
		ArrayList<MovieDTO> movie_list =  movieService.presentMovieList(code_list,m_startNum,m_endNum);
		Map<Integer, String> poster_map = new HashMap<>();
		
		for(MovieDTO movie_result : movie_list) {
//			System.out.println("영화이름 : " + movie_result.getMovie_name());
			
			MoviePhotoDTO photo_addr = moviePhotoService.moviePosterView(movie_result.getMovie_code());
			poster_map.put(movie_result.getMovie_code(), photo_addr.getMovie_photo_addr());	
			
//			System.out.println("photo_addr : "+photo_addr.getMovie_photo_addr());
		}
		
		int m_totalA = movie_count;
		int m_totalPage = ((m_totalA+3) / 4);		
		
		if(m_totalPage < movie_pg) movie_pg = m_totalPage;
		
		MoviePage m_moviePage = new MoviePage();
		m_moviePage.setTotalA(m_totalA);
		m_moviePage.setTotalPage(m_totalPage);
		m_moviePage.setPg(movie_pg);
		
	//		if(request.getParameter("movie_code") == null) {
	//		movie_code = 0;
	//	}else {
	//		movie_code = Integer.parseInt(request.getParameter("movie_code"));			
	//	}
	//	MoviePhotoDTO poster_addr = moviePhotoService.moviePosterView(movie_code);
		
		
		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("movie_code", movie_code);
		modelAndView.addObject("m_moviePage", m_moviePage);
		modelAndView.addObject("poster_map", poster_map);
		modelAndView.addObject("movie_list", movie_list);
		modelAndView.setViewName("movieReview.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/main/main/movieMain.do")
	public ModelAndView movieMain(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.jsp");
		return modelAndView;
	}

	
					
}



















