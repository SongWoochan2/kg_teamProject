package select.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.controller.MovieService;

@Controller
public class SelectController {
	@Autowired
	private SelectService selectService;
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value="/main/movie/selectLike.do")
	public ModelAndView selectLike(HttpServletRequest request, HttpSession session) {
		int like_able = 0;
		int photo_pg = 1;
		int trailer_pg = 1;
		int review_pg = 1;
		int movie_pg = 1;
		int chart_pg = 1;
		String pagetype = null;
		// 영화 상세 정보
		if(request.getParameter("photo_pg") != null) {
			photo_pg = Integer.parseInt(request.getParameter("photo_pg"));				
		}
		if(request.getParameter("trailer_pg") != null) {
			trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));					
		}
		// 영화 리뷰
		if(request.getParameter("review_pg") != null) {
			review_pg = Integer.parseInt(request.getParameter("review_pg"));				
		}
		if(request.getParameter("movie_pg") != null) {
			movie_pg = Integer.parseInt(request.getParameter("movie_pg"));					
		}
		// 위시 리스트, 영화 차트
		if(request.getParameter("pagetype")!=null) {
			pagetype = request.getParameter("pagetype");
		}
		// 영화 차트
		if(request.getParameter("chart_pg") != null) {
			movie_pg = Integer.parseInt(request.getParameter("chart_pg"));					
		}
		
		
		
		String member_id = (String) session.getAttribute("memId");
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
		
		if(member_id != null) {
			like_able = selectService.selectMovieList(member_id, movie_code);							
		}
		
		ModelAndView modelAndView = new ModelAndView();
		if(request.getParameter("pagetype")!=null) {
			modelAndView.addObject("pagetype", pagetype);	
		}
		// 공통 사항
		if(request.getParameter("movie_code") != null) {
			modelAndView.addObject("movie_code", movie_code);
		}
		// 리뷰 페이지, 영화 상세 페이지
		if(request.getParameter("review_pg") != null) {
			modelAndView.addObject("review_pg", review_pg);			
		}
		// 영화 상세 페이지
		if(request.getParameter("photo_pg") != null) {
			modelAndView.addObject("pagetype", "movieinfo");	
			modelAndView.addObject("photo_pg", photo_pg);			
		}
		if(request.getParameter("trailer_pg") != null) {
			modelAndView.addObject("trailer_pg", trailer_pg);			
		}
		// 리뷰 페이지
		if(request.getParameter("movie_pg") != null) {
			modelAndView.addObject("pagetype", "moviereview");	
			modelAndView.addObject("movie_pg", movie_pg);			
		}
		// 상영 예정 차트 페이지
		if(request.getParameter("chart_pg") != null) {
			modelAndView.addObject("chart_pg", chart_pg);				
		}
		modelAndView.setViewName("movieLikeTmp.jsp");
		return modelAndView;
	}
	
}
