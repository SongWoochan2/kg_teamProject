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
		
		if(request.getParameter("photo_pg") != null) {
			photo_pg = Integer.parseInt(request.getParameter("photo_pg"));				
		}
		if(request.getParameter("trailer_pg") != null) {
			trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));					
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
		if(request.getParameter("movie_code") != null) {
			modelAndView.addObject("movie_code", movie_code);
		}
		if(request.getParameter("photo_pg") != null) {
			modelAndView.addObject("photo_pg", photo_pg);			
		}
		if(request.getParameter("trailer_pg") != null) {
			modelAndView.addObject("trailer_pg", trailer_pg);			
		}
		modelAndView.setViewName("movieLikeTmp.jsp");
		return modelAndView;
	}
	
}
