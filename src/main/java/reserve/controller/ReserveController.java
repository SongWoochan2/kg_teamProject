package reserve.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
import moviephoto.controller.MoviePhotoService;
import reserve.bean.ReservedSeatVO;
import resource.provider.ResourceProvider;
import showPlace.bean.SeatVO;
import showPlace.controller.ShowPlaceService;
import showPresent.bean.ShowPresentAllVO;
import showPresent.bean.ShowPresentSuperVO;
import showPresent.controller.ShowPresentService;
import theater.bean.TheaterDTO;
import theater.controller.TheaterService;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ShowPresentService showPresentService;
	@Autowired
	private ShowPlaceService showPlaceService;
	@Autowired
	private MoviePhotoService moviePhotoService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/reserve.do")
	public String reserve(HttpServletRequest request, HttpServletResponse response) {
		return "/main/reserve/reserve.jsp";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/SeatView_ForReserve.do")
	public ModelAndView SeatView_ForReserve(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("show_present_code"));
		int show_present_code = Integer.parseInt(request.getParameter("show_present_code"));
		
		
		ShowPresentSuperVO showPresentSuperVO = showPresentService.getShowPresentOneFully(show_present_code);
		
		
		int show_place_code = showPresentSuperVO.getShow_place_code();
		
		List<SeatVO> seatList = showPlaceService.seatList(show_place_code);
		JSONObject json = new JSONObject();
		JSONArray list = new JSONArray();
		
		Set<Integer> x_set = new HashSet<>();
		Set<String> y_set = new HashSet<>();
		int seat_num = 0;
		for(SeatVO seatVO : seatList) {
			JSONObject seat_json = new JSONObject();
			int x_index = seatVO.getX_index();
			String y_index = seatVO.getY_index();
			int seat_type_code =  seatVO.getSeat_type_code();
			
			x_set.add(x_index);
			y_set.add(y_index);
			if(seat_type_code != 0) {
				seat_num++;
			}
			
			seat_json.put("x_index", x_index);
			seat_json.put("y_index", y_index);
			seat_json.put("seat_type_code", seat_type_code);
			list.add(seat_json);
		}
		if(y_set.contains("!")) y_set.remove("!");
		json.put("seat", list);
		json.put("x_size", x_set.size());
		json.put("y_size", y_set.size());
		json.put("seat_num", seat_num);
		
		
////////////// 예약된 좌석 json 으로 만들기
		List<ReservedSeatVO> reservedSeatVOs =  reserveService.getreservedSeats(show_present_code);
		
		JSONArray reserved_seats = new JSONArray();
		for(ReservedSeatVO vo : reservedSeatVOs) {
			if(vo.getSeat1() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat1()));
			}
			if(vo.getSeat2() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat2()));
			}
			if(vo.getSeat3() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat3()));
			}
			if(vo.getSeat4() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat4()));
			}
			if(vo.getSeat5() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat5()));
			}
			if(vo.getSeat6() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat6()));
			}
			if(vo.getSeat7() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat7()));
			}
			if(vo.getSeat8() != null) {
				reserved_seats.add(resolveToIndex(vo.getSeat8()));
			}
		}

		json.put("reserved", reserved_seats);
		
		
		//SeatSize size = showPlaceService.seatSize(show_place_code);
		//int seat_num = showPlaceService.getTotal(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("showInfo", showPresentSuperVO);
		//modelAndView.addObject("theater_name", theater_name);
		//modelAndView.addObject("photo_addr", photo_addr.getMovie_photo_addr());
		modelAndView.addObject("json", json.toJSONString());
		/*modelAndView.addObject("seat_num", seat_num);
		modelAndView.addObject("x_size", size.getX_size());
		modelAndView.addObject("y_size", size.getY_size());*/
		
		modelAndView.setViewName("/main/reserve/selectSeat.jsp");
		
		
		return modelAndView;
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


	private JSONObject resolveToIndex(String seat) {
		JSONObject reservedSeat = new JSONObject();
		String[] seat_str = seat.split("-");
		reservedSeat.put("y_index", seat_str[0]);
		reservedSeat.put("x_index", seat_str[1]);
		return reservedSeat;
	}
}
