package showPresent.controller;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import showPresent.bean.ShowPresentAllVO;

@Controller
public class ShowPresentController {
	
	@Autowired
	public ShowPresentService showPresentService;

	
	@RequestMapping(value="/showPresentList.do")
	public ModelAndView supertheaterList(HttpServletRequest request, HttpServletResponse response) {
		int count = Integer.parseInt(request.getParameter("count"));
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));

		Calendar cal = Calendar.getInstance();
	    cal.add(cal.DATE, count);

	    int year = cal.get(cal.YEAR);  //YEAR 는 모두 대문자로 써야한다.
	    int month = cal.get(cal.MONTH);
	    int date = cal.get(cal.DATE) ;

	    String show_date = year + "-" + month + "-" + date;
	    
	    List<ShowPresentAllVO> list = showPresentService.getShowPresentList(show_date, theater_code);
	    
	    int place_num = 0;
	    Set<Integer> place_set = new HashSet<>();
	    for(ShowPresentAllVO tmp : list) {
	    	int show_place_code = tmp.getShow_place_code();
	    	if(place_set.contains(show_place_code)) {
	    		place_set.add(show_place_code);
	    		place_num++;
	    	}
	    }
	    
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("place_num", place_num);
	    modelAndView.addObject("place_set", place_set);
	    modelAndView.setViewName("/admin/showPresent/showPresentList.jsp");
	    
		
		return modelAndView;
	}
	
	

	
	
	
	
}
