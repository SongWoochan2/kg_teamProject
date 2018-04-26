package showPresent.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
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

	    String show_date = "" + year + month + date;
	    
	    List<ShowPresentAllVO> list = showPresentService.getShowPresentList(show_date, theater_code);

		JSONArray json_list = new JSONArray();
		for(ShowPresentAllVO tmp : list) {
			JSONObject json_show = new JSONObject();
			json_show.put("show_time", tmp.getShow_time());
			json_show.put("movie_name", tmp.getMovie_name());
			json_show.put("movie_recycle_time", tmp.getMovie_recycle_time());
			json_show.put("movie_director", tmp.getMovie_director());
			json_show.put("show_present_code", tmp.getShow_present_code());
			json_show.put("show_place_code", tmp.getShow_place_code());
			json_show.put("show_place_name", tmp.getShow_place_name());
			json_list.add(json_show);
		}
		
		JSONObject json = new JSONObject();
		json.put("show_list", json_list);
		
		
	    int place_num = 0;
	    Map<Integer, String> place_map = new HashMap<>();
	    for(ShowPresentAllVO tmp : list) {
	    	int show_place_code = tmp.getShow_place_code();
	    	if(!place_map.containsKey(show_place_code)) {
	    		place_map.put(show_place_code, tmp.getShow_place_name());
	    		place_num++;
	    	}
	    }
	    
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("json", json.toJSONString());
	    modelAndView.addObject("place_num", place_num);
	    modelAndView.addObject("place_map", place_map);
	    modelAndView.setViewName("/admin/showPresent/showPresentList.jsp");
	    
		
		return modelAndView;
	}
	
	

	
	
	
	
}
