package movietrailer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MoviePage;
import movietrailer.bean.MovieTrailerDTO;


@Controller
public class MovieTrailerController {
	@Autowired
	private MovieTrailerService movieTrailerService;
	
	@RequestMapping(value = "/admin/movieTrailer/movieTrailer.do")
	public ModelAndView movieTrailerList(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		System.out.println("trailer pg : " + page);
		int endNum = page * 9;
		int startNum = endNum - 8;
		
		ArrayList<MovieTrailerDTO> list = movieTrailerService.movieTrailerList(startNum, endNum, movie_code);
		
		int totalA = movieTrailerService.getTotalA(movie_code);
		int totalPage = (totalA + 8) / 9;
		
		int startPage = (page-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(totalPage < endPage) endPage = totalPage;
		
		
		
		MoviePage moviePage = new MoviePage();
		moviePage.setEndPage(endPage);
		moviePage.setStartPage(startPage);
		moviePage.setTotalPage(totalPage);
		moviePage.setPg(page);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("movieTrailer.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/movieTrailer/movieTrailerInsertForm.do")
	public ModelAndView movieTrailerInsertForm(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("movieTrailerInsertForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/movieTrailer/movieTrailerInsert.do", method = RequestMethod.POST)
	public ModelAndView movieTrailerInsert(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		MovieTrailerDTO movieTrailerDTO = new MovieTrailerDTO();
		movieTrailerDTO.setMovie_code(movie_code);
		movieTrailerDTO.setMovie_trailer_name(request.getParameter("movie_trailer_name"));
		movieTrailerDTO.setMovie_trailer_addr(request.getParameter("movie_trailer_addr"));
		
		int result = movieTrailerService.movieTrailerInsert(movieTrailerDTO);
		ModelAndView modelAndView = new ModelAndView();
		if(result == 0) {
			System.out.println("입력 실패");
		}else if(result == 1) {
			System.out.println("입력 성공");
		}
		
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("movieTrailer.do");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/movieTrailer/movieTrailerDelete.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView movieTrailerDelete(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		int movie_trailer_code = Integer.parseInt(request.getParameter("movie_trailer_code"));
		int result = movieTrailerService.movieTrailerDelete(movie_trailer_code);
		
		if(result == 0) {
			System.out.println("삭제 실패");
		}else if(result == 1) {
			System.out.println("삭제 성공");
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("movieTrailer.do");
		return modelAndView;
	}
}
