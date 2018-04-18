package showPlace.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import showPlace.bean.ShowPlaceVO;

@Controller
public class ShowPlaceController {

	@Autowired
	private ShowPlaceService showPlaceService;
	
	
	@RequestMapping("/admin/showPlaceList.do")
	public ModelAndView showPlaceList(HttpServletRequest request) {

		List<ShowPlaceVO> show_place_list = showPlaceService.selectList();
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("show_place_list", show_place_list);
		
		modelAndView.setViewName("showPlaceList.jsp");
		
		return modelAndView;
	}

	@RequestMapping("/admin/showPlaceView.do")
	public ModelAndView showPlaceView(HttpServletRequest request) {
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
		
		ShowPlaceVO showPlaceVO = showPlaceService.selectOne(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("showPlaceVO", showPlaceVO);
		
		modelAndView.setViewName("showPlaceView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/showPlaceDelete.do")
	public ModelAndView boardDelete(HttpServletRequest request) { 
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
	
		int su = showPlaceService.deleteShowPlace(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("showPlaceDelete.jsp");
		
		return modelAndView;
	}
	
	

}
