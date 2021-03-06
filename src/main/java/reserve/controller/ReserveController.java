package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MovieDTO;
import movie.controller.MovieService;
import moviephoto.controller.MoviePhotoService;
import reserve.bean.MemberReserveVO;
import reserve.bean.ReservedSeatVO;
import reserve.bean.SeatNumVO;
import reserve.bean.SeatTypeVO;
import reserve.bean.TimeTypeVO;
import savingList.bean.SavingListDTO;
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
	private MovieService movieService;
	

	@RequestMapping(value="/reserveComplete.do")
	public ModelAndView hyperreserveComplete(HttpServletRequest request, HttpServletResponse response) {
		int acc_audience_num = 0;
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("memId");
		int reserve_code = (Integer) session.getAttribute("reserve_code");
		
		MemberReserveVO memberReserveVO = new MemberReserveVO();
		memberReserveVO.setReserve_id(member_id);
		memberReserveVO.setReserve_code(reserve_code);
		
		int result =  reserveService.updateMemberReserve(memberReserveVO);
		memberReserveVO = reserveService.selectMemberReserve(memberReserveVO);
		if(memberReserveVO.getMember_seat8() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat7() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat6() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat5() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat4() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat3() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat2() != null) {acc_audience_num++;}
		if(memberReserveVO.getMember_seat1() != null) {acc_audience_num++;}
		System.out.println("acc_audience_num : " + acc_audience_num);
		System.out.println("memberReserveVO.getShow_present_code() : " + memberReserveVO.getShow_present_code());
		int update_audience = movieService.updateAudienceNum(memberReserveVO.getShow_present_code(),acc_audience_num);
		if(update_audience == 1) {
			System.out.println("관객 추가 성공");
		}else {
			System.out.println("관객 추가 실패");
		}
		SavingListDTO savingListDTO = new SavingListDTO();
		String saving_name = "영화 예매 ";
		
		//	적립명 길게 하려면...
//		ShowPresentSuperVO showPresentSuperVO = showPresentService.getShowPresentOneFully(memberReserveVO.getShow_present_code());
//
//		String saving_name = "영화 예매  [" + showPresentSuperVO.getMovie_name() + "]" + " - " + showPresentSuperVO.getTheater_name()
//							+ " > " + showPresentSuperVO.getShow_place_name() + " : ";
//		if(memberReserveVO.getMember_seat1() != null)	saving_name += memberReserveVO.getMember_seat1();
//		if(memberReserveVO.getMember_seat2() != null)	saving_name += ", " + memberReserveVO.getMember_seat2();
//		if(memberReserveVO.getMember_seat3() != null)	saving_name += ", " + memberReserveVO.getMember_seat3();
//		if(memberReserveVO.getMember_seat4() != null)	saving_name += ", " + memberReserveVO.getMember_seat4();
//		if(memberReserveVO.getMember_seat5() != null)	saving_name += ", " + memberReserveVO.getMember_seat5();
//		if(memberReserveVO.getMember_seat6() != null)	saving_name += ", " + memberReserveVO.getMember_seat6();
//		if(memberReserveVO.getMember_seat7() != null)	saving_name += ", " + memberReserveVO.getMember_seat7();
//		if(memberReserveVO.getMember_seat8() != null)	saving_name += ", " + memberReserveVO.getMember_seat8();
		
		savingListDTO.setSaving_id(member_id);
		savingListDTO.setSaving_name(saving_name);
		savingListDTO.setPay_cost(memberReserveVO.getReserve_cost());
		savingListDTO.setSaving_cost(memberReserveVO.getReserve_cost()/100);

		reserveService.insertSavingList(savingListDTO);
		///    포인트 적립하기 추가

		session.removeAttribute("reserve_code");
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("result", result);
//		modelAndView.setViewName("/main/reserve/reserveComplete.jsp");
//		
//		return modelAndView;
		
		try {
			response.getWriter().println("{\"result\":" + result+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	

	@RequestMapping(value="/reserveCancel.do")
	public ModelAndView hyperreserveCancel(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("memId");
		int reserve_code = (Integer) session.getAttribute("reserve_code");
		
		MemberReserveVO memberReserveVO = new MemberReserveVO();
		memberReserveVO.setReserve_id(member_id);
		memberReserveVO.setReserve_code(reserve_code);
		
		int result =  reserveService.deleteMemberReserve(memberReserveVO);
		
		session.removeAttribute("reserve_code");
				
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("result", result);
//		modelAndView.setViewName("/main/reserve/reserveCancel.jsp");
//		
//		return modelAndView;
		

		try {
			response.getWriter().println("{\"result\":" + result+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value="/reserve.do")
	public String hyperreserve(HttpServletRequest request, HttpServletResponse response) {
		return "/main/reserve/reserve.jsp";
	}
	
	@RequestMapping(value="/reserving.do")
	synchronized public void hyperreserving(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memId");
		
		int show_present_code = Integer.parseInt(request.getParameter("show_present_code"));
		ShowPresentSuperVO showPresentSuperVO = showPresentService.getShowPresentOneFully(show_present_code);

		List<SeatVO> seatVOs = new ArrayList<>();
		for(int i = 1; i <= 8; i++) {
			SeatVO seatVO = new SeatVO();
			String seat = request.getParameter("seat" + i);
			if(seat != null && !seat.equals("")) {
				String[] index = seat.split("-");
				seatVO.setY_index(index[0]);
				seatVO.setX_index(Integer.parseInt(index[1]));
				seatVO.setShow_place_code(showPresentSuperVO.getShow_place_code());
				
				seatVOs.add(seatVO);
			}
		}
		
		List<ReservedSeatVO> reservedSeatVOs = reserveService.getreservedSeats(show_present_code);
		
		
		if(isAlreadyReseved(reservedSeatVOs, seatVOs)) {
			try {
				response.getWriter().println("{ \"result\" : \"-1\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		} 

		// 요금 계산에 필요한 시간분류, 좌석분류 테이블 가져와서 MAP에 저장
		Map<Integer, SeatTypeVO> seatTypeMap = reserveService.getSeatType();
		Map<Integer, TimeTypeVO> timeTypeMap = reserveService.getTimeType();
		
		
		int timeAddCost = timeTypeMap.get(showPresentSuperVO.getShow_time()).getAdd_cost();
		int defaultCost = showPresentSuperVO.getDefault_cost();
		int totalCost = 0;
		
		List<SeatVO> totalSeatVOs = showPlaceService.seatList(showPresentSuperVO.getShow_place_code());
		for(SeatVO tmp1 : seatVOs ) {
			// 좌석이 존재하는 지 체크
			boolean checkSeat = false;
			
			System.out.println("전체 --------------------------------");
			for(SeatVO tmp2 : totalSeatVOs) {
				System.out.print(tmp2.getY_index() + "-" + tmp2.getX_index() + "/");
				if(tmp1.getX_index() == tmp2.getX_index() && tmp1.getY_index().equals(tmp2.getY_index())) {
					checkSeat = true;
					totalCost += defaultCost + timeAddCost + seatTypeMap.get(tmp2.getSeat_type_code()).getAdd_cost();
					break;
				}
			}
			
			System.out.println("예매 ---------------------------------");
			System.out.println(tmp1.getY_index() + "-" + tmp1.getX_index());
			if(!checkSeat) {
				try {
					response.getWriter().println("{ \"result\" : \"-2\"}");
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
		}
		
		MemberReserveVO memberReserveVO = new MemberReserveVO();
		
		memberReserveVO.setReserve_id(member_id);
		memberReserveVO.setShow_present_code(show_present_code);
		memberReserveVO.setMember_seat1(request.getParameter("seat1"));
		memberReserveVO.setMember_seat2(request.getParameter("seat2"));
		memberReserveVO.setMember_seat3(request.getParameter("seat3"));
		memberReserveVO.setMember_seat4(request.getParameter("seat4"));
		memberReserveVO.setMember_seat5(request.getParameter("seat5"));
		memberReserveVO.setMember_seat6(request.getParameter("seat6"));
		memberReserveVO.setMember_seat7(request.getParameter("seat7"));
		memberReserveVO.setMember_seat8(request.getParameter("seat8"));
		
		
		memberReserveVO.setReserve_cost(totalCost);
		
		
		int result = reserveService.insertMemberReserve(memberReserveVO);

		try {
			response.getWriter().println("{ \"result\" : \""+ result + "\", \"totalCost\" : \""+ totalCost + "\" }");
		} catch (IOException e) {
			e.printStackTrace();
		}
		session.setAttribute("reserve_code", memberReserveVO.getReserve_code());
		
		// result
		// 1 : 성공
		// 0 : 실패
		// -1 : 이미 예약된 좌석
		// -2 : 잘못된 좌석
		
		
		return;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/SeatView_ForReserve.do")
	public ModelAndView hyperSeatView_ForReserve(HttpServletRequest request, HttpServletResponse response) {
		int show_present_code = Integer.parseInt(request.getParameter("show_present_code"));
		
		ShowPresentSuperVO showPresentSuperVO = showPresentService.getShowPresentOneFully(show_present_code);
		
		// 상영날짜 의 시간 string 없애기
		String show_date = showPresentSuperVO.getShow_date();
		showPresentSuperVO.setShow_date(show_date.substring(0, 11));
		
		// 요금 계산에 필요한 시간분류, 좌석분류 테이블 가져와서 MAP에 저장
		Map<Integer, SeatTypeVO> seatTypeMap = reserveService.getSeatType();
		Map<Integer, TimeTypeVO> timeTypeMap = reserveService.getTimeType();
		
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
			seat_json.put("add_cost", seatTypeMap.get(seat_type_code).getAdd_cost());
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
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("time_add_cost", timeTypeMap.get(showPresentSuperVO.getShow_time()).getAdd_cost());
		modelAndView.addObject("showInfo", showPresentSuperVO);
		modelAndView.addObject("json", json.toJSONString());
		
		modelAndView.setViewName("/main/reserve/selectSeat.jsp");
		
		
		return modelAndView;
	}
	
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/movieList_forReserve.do")
	public void hypermovieList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		
		int theater_code = 0;
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}
		String show_date = request.getParameter("show_date");
		if(show_date.equals("")) {
			show_date = null;
		}

		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour < 5) {
			hour += 24;
		}
		int minute = cal.get(Calendar.MINUTE);
		int show_time = hour*100 + minute;		

	    List<MovieDTO> list = reserveService.getMovieList(show_date, theater_code, show_time);

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

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/theaterList_forReserve.do")
	public void hypertheaterList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		String show_date = request.getParameter("show_date");
		if(show_date.equals("")) {
			show_date = null;
		}
		

//		System.out.println("1. : " + show_date.substring(4, 6).equals( (cal.get(Calendar.MONDAY)+1)+"") );
//		System.out.println("2. : " + show_date.substring(6, 8).equals(cal.get(Calendar.DATE)+"") );
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour < 5) {
			hour += 24;
		}
		int minute = cal.get(Calendar.MINUTE);
		int show_time = hour*100 + minute;				
		
	    List<TheaterDTO> list = reserveService.getTheaterList(show_date, movie_code, show_time);
	   
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

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/dateList_forReserve.do")
	public void hyperdateList_forReserve(HttpServletRequest request, HttpServletResponse response) {
		int movie_code = 0;
		int theater_code = 0;
		if(request.getParameter("movie_code") != null) {
			movie_code = Integer.parseInt(request.getParameter("movie_code"));
		}
		if(request.getParameter("theater_code") != null) {
			theater_code = Integer.parseInt(request.getParameter("theater_code"));
		}

		
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour < 5) {
			hour += 24;
		}
		int minute = cal.get(Calendar.MINUTE);
		int show_time = hour*100 + minute;			
		
	    List<ShowPresentAllVO> list = reserveService.getDateList(movie_code, theater_code, show_time);
//	    showPresentService.

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

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/showList_forReserve.do")
	public void hypershowList_forReserve(HttpServletRequest request, HttpServletResponse response) {
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

		int show_time = -1;
		if(show_date != null) {
			Calendar cal = Calendar.getInstance();
			if(	show_date.substring(4, 6).equals( (cal.get(Calendar.MONDAY)+1)+"") 
					&& show_date.substring(6, 8).equals(cal.get(Calendar.DATE)+"")	) {
				int hour = cal.get(Calendar.HOUR_OF_DAY);
				if(hour < 5) {
					hour += 24;
				}
				int minute = cal.get(Calendar.MINUTE);
				show_time = hour*100 + minute;				
			}
		}
		System.out.println(movie_code  + " / " + theater_code + " / " + show_date);
	    List<ShowPresentAllVO> list = reserveService.getShowList(movie_code, theater_code, show_date, show_time);
	    List<SeatNumVO> reservedSeatNumlist = reserveService.getReservedSeatOfShow(movie_code, theater_code, show_date);
	    List<SeatNumVO> totalSeatNumlist = reserveService.getTotalSeatOfShow(movie_code, theater_code, show_date);

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
			
			int totalSeat = 0;
			System.out.println("#### total seat #####");
			for(SeatNumVO tmpVO : totalSeatNumlist) {
				System.out.println(tmpVO.getShow_present_code() + "-" + tmpVO.getSeatNum());
				if(tmpVO.getShow_present_code() == tmp.getShow_present_code()) {
					totalSeat = tmpVO.getSeatNum();
				}
			}

			int remainSeat = totalSeat;
			System.out.println("#### reserved seat #####");
			for(SeatNumVO tmpVO : reservedSeatNumlist) {
				System.out.println(tmpVO.getShow_present_code() + "-" + tmpVO.getSeatNum());
				if(tmpVO.getShow_present_code() == tmp.getShow_present_code()) {
					remainSeat -= tmpVO.getSeatNum();
				}
			}
			show.put("totalSeat", totalSeat);
			show.put("remainSeat", remainSeat);
			
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
	
	private boolean isAlreadyReseved(List<ReservedSeatVO> reservedSeatVOs, List<SeatVO> seatVOs) {
		for(ReservedSeatVO tmp : reservedSeatVOs) {
			if(tmp.getSeat1() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat1())) {
						return true;
					}
				}
			}
			if(tmp.getSeat2() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat2())) {
						return true;
					}
				}
			}
			if(tmp.getSeat3() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat3())) {
						return true;
					}
				}
			}
			if(tmp.getSeat4() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat4())) {
						return true;
					}
				}
			}
			if(tmp.getSeat5() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat5())) {
						return true;
					}
				}
			}
			if(tmp.getSeat6() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat6())) {
						return true;
					}
				}
			}
			if(tmp.getSeat7() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat7())) {
						return true;
					}
				}
			}
			if(tmp.getSeat8() != null ) {
				for(SeatVO seatVO : seatVOs) {
					String seat_str = seatVO.getY_index() + "-" + seatVO.getX_index();
					if(seat_str.equals(tmp.getSeat8())) {
						return true;
					}
				}
			}
		}
		return false;
	}


	@SuppressWarnings("unchecked")
	private JSONObject resolveToIndex(String seat) {
		JSONObject reservedSeat = new JSONObject();
		String[] seat_str = seat.split("-");
		reservedSeat.put("y_index", seat_str[0]);
		reservedSeat.put("x_index", seat_str[1]);
		return reservedSeat;
	}
}
