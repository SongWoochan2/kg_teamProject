package evaluat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import evaluat.bean.EvaluatDTO;
import evaluat.bean.EvaluatLikeDTO;
import movie.controller.MovieService;
import reserve.controller.ReserveService;

@Controller
public class EvaluatController {
	@Autowired
	private EvaluatService evaluatService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping(value="/main/movie/reviewDelete.do")
	public ModelAndView reviewDelete(HttpServletRequest request) {
		int review_pg = 1;
		int movie_pg = 1;
		int photo_pg = 1;
		int trailer_pg = 1;
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		// 공통사항
		if(request.getParameter("review_pg") != null) {
			review_pg = Integer.parseInt(request.getParameter("review_pg"));			
		}
		// 리뷰 페이지
		if(request.getParameter("movie_pg") != null) {
			movie_pg = Integer.parseInt(request.getParameter("movie_pg"));
		}
		// 영화 상세 페이지
		if(request.getParameter("photo_pg") != null) {
			photo_pg = Integer.parseInt(request.getParameter("photo_pg"));			
		}
		if(request.getParameter("trailer_pg") != null) {
			trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));			
		}
		
		
		System.out.println("evaluat_code : " + Integer.parseInt(request.getParameter("evaluat_code")));
		
		int like_delete_result = evaluatService.deleteEvaluatLike(Integer.parseInt(request.getParameter("evaluat_code")));
	
		int delete_Result = evaluatService.deleteEvaluat(Integer.parseInt(request.getParameter("evaluat_code")));			
		
		int acc_evaluat_score = 0;
		if(evaluatService.movieScoreTotal(movie_code) == null) {
			acc_evaluat_score = 0;
		}else {
			acc_evaluat_score = evaluatService.movieScoreTotal(movie_code);
		}
		int update_Score = movieService.updateEvaluatScore(movie_code, acc_evaluat_score);
		
		int movie_evaluat_num = 0;
		if(evaluatService.getTotal(movie_code) == null) {
			movie_evaluat_num = 0;
		}else {
			movie_evaluat_num = evaluatService.getTotal(movie_code);
		}
		int update_Num = movieService.updateEvaluatNum(movie_code, movie_evaluat_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("movie_code", movie_code);
		if(request.getParameter("review_pg") != null) {
			modelAndView.addObject("review_pg", review_pg);
		}
		if(request.getParameter("movie_pg") != null) {
			modelAndView.addObject("pagetype", "moviereview");
			modelAndView.addObject("movie_pg", movie_pg);
		}
		if(request.getParameter("photo_pg") != null) {
			modelAndView.addObject("photo_pg", photo_pg);
		}
		if(request.getParameter("trailer_pg") != null) {
			modelAndView.addObject("pagetype", "movieinfo");
			modelAndView.addObject("trailer_pg", trailer_pg);
		}
		modelAndView.addObject("delete_Result", delete_Result);
		modelAndView.addObject("update_Score", update_Score);
		modelAndView.addObject("update_Num", update_Num);
		modelAndView.setViewName("movieReviewDelete.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/reviewInsert.do")
	public ModelAndView reviewInsert(HttpServletRequest request, HttpSession session) {
		int movie_pg = 1;
		int photo_pg = 1;
		int trailer_pg = 1;
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		ModelAndView modelAndView = new ModelAndView();
		if(session.getAttribute("memId") == null) {
			modelAndView.setViewName("movieLoginRequest.jsp");
		}else {
			String member_id = (String) session.getAttribute("memId");
			int check_result = evaluatService.evaluatMemberCheck(member_id, movie_code);
			int reserve_check = reserveService.movieReserveCheck(member_id, movie_code);
			
			if(reserve_check == 0) {
				modelAndView.setViewName("movieReserveCheck.jsp");
			}else if(check_result > 0) {
				modelAndView.setViewName("evaluatMemberCheck.jsp");
			}else {
				// 리뷰 페이지
				if(request.getParameter("movie_pg") != null) {
					movie_pg = Integer.parseInt(request.getParameter("movie_pg"));
				}
				// 영화 상세 페이지
				if(request.getParameter("photo_pg") != null) {
					photo_pg = Integer.parseInt(request.getParameter("photo_pg"));			
				}
				if(request.getParameter("trailer_pg") != null) {
					trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));			
				}
				int evaluat_score = Integer.parseInt(request.getParameter("evaluat_score"));
				
				
				EvaluatDTO evaluatDTO = new EvaluatDTO();
				evaluatDTO.setEvaluat_id(member_id);
				evaluatDTO.setMovie_code(movie_code);
				evaluatDTO.setEvaluat_content(request.getParameter("evaluat_content"));
				evaluatDTO.setEvaluat_score(evaluat_score);
				
				int insert_Result = evaluatService.insertEvaluat(evaluatDTO);
				int acc_evaluat_score = evaluatService.movieScoreTotal(movie_code);
				int update_Score = movieService.updateEvaluatScore(movie_code, acc_evaluat_score);
				int movie_evaluat_num = evaluatService.getTotal(movie_code);
				int update_Num = movieService.updateEvaluatNum(movie_code, movie_evaluat_num);
				
				modelAndView.addObject("update_Score", update_Score);
				modelAndView.addObject("update_Num", update_Num);
				modelAndView.addObject("movie_code", movie_code);
				modelAndView.addObject("insert_Result", insert_Result);
				if(request.getParameter("movie_pg") != null) {
					modelAndView.addObject("pagetype", "moviereview");
					modelAndView.addObject("movie_pg", movie_pg);
				}
				if(request.getParameter("photo_pg") != null) {
					modelAndView.addObject("photo_pg", photo_pg);
				}
				if(request.getParameter("trailer_pg") != null) {
					modelAndView.addObject("pagetype", "movieinfo");
					modelAndView.addObject("trailer_pg", trailer_pg);
				}
				System.out.println("insert_Result : " + insert_Result);
				modelAndView.setViewName("movieReviewInsert.jsp");
			}
			
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/main/movie/reviewLike.do")
	public ModelAndView reviewLike(HttpServletRequest request, HttpSession session) {
		String member_id = "";
		int review_pg = 1;
		int movie_pg = 1;
		int photo_pg = 1;
		int trailer_pg = 1;
		// 공통 사항
		if(request.getParameter("review_pg") != null) {
			review_pg = Integer.parseInt(request.getParameter("review_pg"));			
		}
		// 리뷰 페이지
		if(request.getParameter("movie_pg") != null) {
			movie_pg = Integer.parseInt(request.getParameter("movie_pg"));
		}
		// 영화 상세 페이지
		if(request.getParameter("photo_pg") != null) {
			photo_pg = Integer.parseInt(request.getParameter("photo_pg"));			
		}
		if(request.getParameter("trailer_pg") != null) {
			trailer_pg = Integer.parseInt(request.getParameter("trailer_pg"));			
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
			EvaluatDTO evaluatDTO = evaluatService.evaluatView(Integer.parseInt(request.getParameter("evaluat_code")));
			member_id = (String) session.getAttribute("memId");	
			
			if(evaluatDTO.getEvaluat_id().equals(member_id)) {
				modelAndView.setViewName("movieIdCheck.jsp");
			}else {
				// 좋아요 체크(필요요소 : 평가코드, 멤버아이디)
				int check_result = evaluatService.likeMemberCheck(member_id, evaluatDTO.getEvaluat_code());
				
				if(check_result > 0) {
					modelAndView.setViewName("likeMemberCheck.jsp");
				}else {
					// 좋아요 추가
					EvaluatLikeDTO evaluatLikeDTO = new EvaluatLikeDTO();
					evaluatLikeDTO.setEvaluat_code(evaluatDTO.getEvaluat_code());
					evaluatLikeDTO.setLike_id(member_id);
					int insert_result = evaluatService.insertEvaluatLike(evaluatLikeDTO);
					int evaluat_like_num = evaluatService.evaluatLikeCount(evaluatDTO.getEvaluat_code());
					int update_result = evaluatService.updateLikeNum(evaluatDTO.getEvaluat_code(), evaluat_like_num);
					
					if(update_result == 1) {
						if(request.getParameter("review_pg") != null) {
							modelAndView.addObject("review_pg", review_pg);
						}
						if(request.getParameter("movie_pg") != null) {
							modelAndView.addObject("pagetype", "moviereview");
							modelAndView.addObject("movie_pg", movie_pg);
						}
						if(request.getParameter("photo_pg") != null) {
							modelAndView.addObject("photo_pg", photo_pg);	
						}
						if(request.getParameter("trailer_pg") != null) {
							modelAndView.addObject("pagetype", "movieinfo");
							modelAndView.addObject("trailer_pg", trailer_pg);			
						}
						modelAndView.addObject("movie_code", request.getParameter("movie_code"));
						modelAndView.setViewName("reviewLikeSuccess.jsp");						
					}
				}
			}
		
		
		return modelAndView;
	}
}
