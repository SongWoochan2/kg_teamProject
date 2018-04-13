package movie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value="/admin/movieAdmin.do")
	public ModelAndView movieAdminForm(HttpServletRequest request) {
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
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("moviePage", moviePage);
				
		modelAndView.addObject("target", "movieAdmin");
		modelAndView.setViewName("redirect:/adminMain/adminMain.do");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/movieInsertForm.do")
	public ModelAndView movieInsertForm(HttpServletRequest request) {
		String pg = request.getParameter("pg");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("target", "movieInsert");
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("redirect:/adminMain/adminMain.do");
		return modelAndView;
		
	}
	
	@RequestMapping(value="/admin/movieInsert.do")
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
			modelAndView.setViewName("movieAdmin.do");
		}else if(result == 1) {
			System.out.println("입력 성공");
			modelAndView.setViewName("movieAdmin.do");
		}
		
		return modelAndView;
	}
}
