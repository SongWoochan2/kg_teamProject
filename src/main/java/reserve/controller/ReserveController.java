package reserve.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
import reserve.bean.ReserveDTO;
import resource.provider.ResourceProvider;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/reserve.do")
	public String reserve(HttpServletRequest request, HttpServletResponse response) {
		return "/main/reserve/reserve.jsp";
	}
	
	@RequestMapping(value="/movieList_forReserve.do")
	public void movieList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		
		int theater_code = 0;
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}
		String show_date = request.getParameter("show_date");
		if(show_date.equals("")) {
			show_date = null;
		}

	    List<MovieDTO> list = reserveService.getMovieList(show_date, theater_code);

		JSONArray movie_list = new JSONArray();
		for(MovieDTO tmp : list) {
			JSONObject movie = new JSONObject();
			movie.put("movie_code", tmp.getMovie_code());
			movie.put("movie_name", tmp.getMovie_name());
			movie.put("movie_show_grade_name", tmp.getMovie_show_grade_name());
			movie_list.add(movie);
		}
		
		JSONObject json = new JSONObject();
		json.put("movies", movie_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value="/theaterList_forReserve.do")
	public void theaterList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		String show_date = request.getParameter("show_date");
		if(show_date.equals("")) {
			show_date = null;
		}

	    List<TheaterDTO> list = reserveService.getTheaterList(show_date, movie_code);

		JSONArray theater_list = new JSONArray();
		for(TheaterDTO tmp : list) {
			JSONObject theater = new JSONObject();
			theater.put("theater_code", tmp.getTheater_code());
			theater.put("theater_name", tmp.getTheater_name());
			theater_list.add(theater);
		}
		
		JSONObject json = new JSONObject();
		json.put("theaters", theater_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value="/dateList_forReserve.do")
	public void dateList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		int theater_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}
	    List<ShowPresentAllVO> list = reserveService.getDateList(movie_code, theater_code);

		JSONArray show_list = new JSONArray();
		for(ShowPresentAllVO tmp : list) {
			JSONObject show = new JSONObject();
			show.put("show_date", tmp.getShow_date());
			show.put("show_time", tmp.getShow_time());
			show.put("show_minute", tmp.getShow_minute());
			show.put("movie_name", tmp.getMovie_name());
			show.put("movie_recycle_time", tmp.getMovie_recycle_time());
			show.put("movie_director", tmp.getMovie_director());
			show.put("show_present_code", tmp.getShow_present_code());
			show.put("show_place_code", tmp.getShow_place_code());
			show.put("show_place_name", tmp.getShow_place_name());
			show_list.add(show);
		}
		
		JSONObject json = new JSONObject();
		json.put("shows", show_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	@RequestMapping(value="/showList_forReserve.do")
	public void showList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		int theater_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}
		String show_date = request.getParameter("show_date");
		if(show_date.equals("")) {
			show_date = null;
		}
	    List<ShowPresentAllVO> list = reserveService.getShowList(movie_code, theater_code, show_date);

		JSONArray show_list = new JSONArray();
		for(ShowPresentAllVO tmp : list) {
			JSONObject show = new JSONObject();
			show.put("show_date", tmp.getShow_date());
			show.put("show_time", tmp.getShow_time());
			show.put("show_minute", tmp.getShow_minute());
			show.put("movie_name", tmp.getMovie_name());
			show.put("movie_recycle_time", tmp.getMovie_recycle_time());
			show.put("movie_director", tmp.getMovie_director());
			show.put("show_present_code", tmp.getShow_present_code());
			show.put("show_place_code", tmp.getShow_place_code());
			show.put("show_place_name", tmp.getShow_place_name());
			show_list.add(show);
		}
		
		
		JSONObject json = new JSONObject();
		json.put("shows", show_list);
		
		try {
			response.getWriter().println(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
	
}
