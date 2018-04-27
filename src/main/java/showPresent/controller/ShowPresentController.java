package showPresent.controller;

import java.text.SimpleDateFormat;
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

import showPlace.bean.ShowPlaceVO;
import showPlace.controller.ShowPlaceService;
import showPresent.bean.ShowPresentAllVO;
import showPresent.bean.ShowPresentVO;

@Controller
public class ShowPresentController {
	
	@Autowired
	public ShowPresentService showPresentService;
	@Autowired
	public ShowPlaceService ShowPlaceService;

	
	@RequestMapping(value="/showPresentList.do")
	public ModelAndView supertheaterList(HttpServletRequest request, HttpServletResponse response) {
		String count_st = request.getParameter("count");
		int count = 0;
		if(count_st != null){
			count = Integer.parseInt(count_st);
		}
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));

		Calendar cal = Calendar.getInstance();
	    cal.add(cal.DATE, count);

	    int year = cal.get(cal.YEAR);  //YEAR 는 모두 대문자로 써야한다.
	    int month = cal.get(cal.MONTH) + 1;
	    int date = cal.get(cal.DATE) ;
	    String month_st = month+"";
	    String date_st = date+"";
	    
	    if(month < 10) {
	    	month_st = "0" + month;
	    }
	    if(date < 10) {
	    	date_st = "0" + date;
	    }
	    
	    String show_date = "" + year + month_st + date_st;
	    List<ShowPresentAllVO> list = showPresentService.getShowPresentList(show_date, theater_code);

	    
		JSONArray json_list = new JSONArray();
		for(ShowPresentAllVO tmp : list) {
			JSONObject json_show = new JSONObject();
			json_show.put("show_date", tmp.getShow_date());
			json_show.put("show_time", tmp.getShow_time());
			json_show.put("show_minute", tmp.getShow_minute());
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
		
	    List<ShowPlaceVO> sp_list = ShowPlaceService.selectList(theater_code);
	    System.out.println("json : " + json.toJSONString());
	    
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("json", json.toJSONString());
	    modelAndView.addObject("sp_list", sp_list);
	    modelAndView.setViewName("/admin/showPresent/showPresentList.jsp");
	    
		
		return modelAndView;
	}
	

	@RequestMapping(value="/showPresentWriteForm.do")
	public String supershowPresentWriteForm(HttpServletRequest request, HttpServletResponse response) { 
		String forward = "/admin/showPresent/showPresentWriteForm.jsp";
		return forward;
	}
	

	@RequestMapping(value="/showPresentWrite.do")
	public ModelAndView supershowPresentWrite(HttpServletRequest request, HttpServletResponse response) { 
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		int hour = Integer.parseInt(request.getParameter("hour"));
		int minute = Integer.parseInt(request.getParameter("minute"));
		
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));

		System.out.println(year+"-"+month+"-"+day);
		
		ShowPresentVO showPresentVO = new ShowPresentVO();
		showPresentVO.setShow_place_code(show_place_code);
		showPresentVO.setMovie_code(movie_code);
		showPresentVO.setShow_date(year+"-"+month+"-"+day);
		showPresentVO.setShow_time(hour);
		showPresentVO.setShow_minute(minute);
		
		int su = showPresentService.insertShowPresent(showPresentVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("/admin/showPresent/showPresentWrite.jsp");
		
		return modelAndView;
	}

	
	@RequestMapping(value="/showPresentDelete.do")
	public ModelAndView supershowPresentDelete(HttpServletRequest request, HttpServletResponse response) { 
		
		int show_present_code = Integer.parseInt(request.getParameter("show_present_code"));
		
		
		int su = showPresentService.deleteShowPresent(show_present_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("/admin/showPresent/showPresentDelete.jsp");
		
		return modelAndView;
	}
	
	
	
	
}
