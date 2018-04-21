package movie.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
import movie.bean.MoviePage;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieService;
	
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
			
			modelAndView.addObject("pg", moviePage.getPg());
			modelAndView.setViewName("movieAdmin.jsp");
			
		}else if(admin_id == null) {
			System.out.println("입장 실패");
			modelAndView.setViewName("../adminMain/adminIndex.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieInsertForm.do")
	public ModelAndView movieInsertForm(HttpServletRequest request) {
		String page = request.getParameter("pg");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("target", "movieInsert");
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("movieInsert.jsp");
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
		movieDTO.setMovie_type(request.getParameter("movie_type"));
		movieDTO.setMovie_open_date(request.getParameter("movie_open_date"));
		movieDTO.setAppear_actor(request.getParameter("appear_actor"));
		int result = movieService.movieInsert(movieDTO);
		ModelAndView modelAndView = new ModelAndView();
		if(result == 0) {
			System.out.println("입력 실패");		
			modelAndView.addObject("pg", page);
			
		}else if(result == 1) {
			System.out.println("입력 성공");
			modelAndView.addObject("pg", page);
		}
		modelAndView.setViewName("redirect:movieAdmin.do");
		
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
		modelAndView.setViewName("movieModify.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movie/movieModify.do")
	public ModelAndView movieModify(HttpServletRequest request) {
		String page = request.getParameter("pg");
		MovieDTO movieDTO = new MovieDTO();
		movieDTO.setMovie_code(Integer.parseInt(request.getParameter("movie_code")));
		System.out.println("movie_code:"+Integer.parseInt(request.getParameter("movie_code")));
		movieDTO.setMovie_name(request.getParameter("movie_name"));
		System.out.println("movie_name:"+request.getParameter("movie_name"));
		movieDTO.setMovie_content(request.getParameter("movie_content"));
		System.out.println("movie_content : "+request.getParameter("movie_content"));
		movieDTO.setMake_nation(request.getParameter("make_nation"));
		System.out.println("make_nation "+request.getParameter("make_nation"));
		movieDTO.setMovie_director(request.getParameter("movie_director"));
		System.out.println("movie_director "+request.getParameter("movie_director"));		
		movieDTO.setMovie_recycle_time(Integer.parseInt(request.getParameter("movie_recycle_time")));
		System.out.println("movie_recycle_time "+Integer.parseInt(request.getParameter("movie_recycle_time")));		
		movieDTO.setMovie_show_grade_name(request.getParameter("movie_show_grade_name"));
		System.out.println("movie_show_grade_name "+request.getParameter("movie_show_grade_name"));		
		movieDTO.setMovie_type(request.getParameter("movie_type"));
		System.out.println("movie_type " + request.getParameter("movie_type"));
		movieDTO.setMovie_open_date(request.getParameter("movie_open_date"));
		System.out.println("movie_open_date "+request.getParameter("movie_open_date"));
		movieDTO.setAppear_actor(request.getParameter("appear_actor"));
		System.out.println("appear_actor "+request.getParameter("appear_actor"));
		int result = movieService.movieModify(movieDTO);
		ModelAndView modelAndView = new ModelAndView();
		
		if(result == 0) {
			System.out.println("수정 실패");		
			modelAndView.addObject("pg", page);
			
		}else if(result == 1) {
			System.out.println("수정 성공");
			modelAndView.addObject("pg", page);
		}
		
		modelAndView.setViewName("redirect:movieAdmin.do");
		return modelAndView;
	}
}
