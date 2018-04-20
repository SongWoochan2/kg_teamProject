package showPlace.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import showPlace.bean.SeatSize;
import showPlace.bean.SeatVO;
import showPlace.bean.ShowPlaceVO;

@Controller
public class ShowPlaceController {

	@Autowired
	private ShowPlaceService showPlaceService;
	
	
	@RequestMapping("/showPlaceList.do")
	public ModelAndView showPlaceList(HttpServletRequest request) {

		List<ShowPlaceVO> show_place_list = showPlaceService.selectList();
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("show_place_list", show_place_list);
		
		modelAndView.setViewName("/admin/showPlace/showPlaceList.jsp");
		
		return modelAndView;
	}

	@RequestMapping("/showPlaceView.do")
	public ModelAndView showPlaceView(HttpServletRequest request) {
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
		
		ShowPlaceVO showPlaceVO = showPlaceService.selectOne(show_place_code);
		List<SeatVO> seatList = showPlaceService.seatList(show_place_code);
		JSONObject json = new JSONObject();
		JSONArray list = new JSONArray();
		for(SeatVO seatVO : seatList) {
			JSONObject seat_json = new JSONObject();
			seat_json.put("x_index", seatVO.getX_index());
			seat_json.put("y_index", seatVO.getY_index());
			seat_json.put("seat_type_code", seatVO.getSeat_type_code());
			list.add(seat_json);
		}
		json.put("seat", list);
		
		SeatSize size = showPlaceService.seatSize(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("showPlaceVO", showPlaceVO);
		modelAndView.addObject("json", json.toJSONString());
		modelAndView.addObject("x_size", size.getX_size());
		modelAndView.addObject("y_size", size.getY_size());
		
		modelAndView.setViewName("/admin/showPlace/showPlaceView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/showPlaceDelete.do")
	public ModelAndView showPlaceDelete(HttpServletRequest request) { 
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
	
		int su = showPlaceService.deleteShowPlace(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("/admin/showPlace/showPlaceDelete.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/showPlaceWriteForm.do")
	public String showPlaceWriteForm(HttpServletRequest request) { 
		String forward = "/admin/showPlace/showPlaceWriteForm.jsp";
		
		return forward;
	}
	

	@RequestMapping(value="/showPlaceWrite.do", method=RequestMethod.POST)
	synchronized public ModelAndView showPlaceWrite(HttpServletRequest request, MultipartFile img) { 
		
		String filePath = "D:/Spring/cgv/MyCGV/src/main/webapp/image/showPlace";
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);
		
		// 파일 storage 폴더에 저장
		try {
			// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStrean을 구한다.
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		String show_place_name = request.getParameter("show_place_name");
		int default_cost = Integer.parseInt(request.getParameter("default_cost"));
		
		ShowPlaceVO showPlaceVO = new ShowPlaceVO();
		showPlaceVO.setTheater_code(theater_code);
		showPlaceVO.setShow_place_name(show_place_name);
		showPlaceVO.setDefault_cost(default_cost);
		showPlaceVO.setShow_place_photo_addr(fileName);
		
		int su = showPlaceService.insertShowPlace(showPlaceVO);
		
		String seat_code = request.getParameter("seat_code");
		
		JSONParser parser = new JSONParser();
		try {
			JSONObject json = (JSONObject) parser.parse(seat_code);
			
			JSONArray list = (JSONArray) json.get("seat");
			
			for(Object tmp : list) {
				JSONObject seat = (JSONObject) tmp;
				SeatVO seatVO = new SeatVO();
				seatVO.setY_index((String)seat.get("y_index"));
				seatVO.setX_index(Integer.parseInt((String)seat.get("x_index")));
				seatVO.setSeat_type_code(Integer.parseInt((String)seat.get("seat_type_code")));
				
				showPlaceService.insertSeat(seatVO);
			}
			/*
			String[] seats = seat_code.split("/");
			for(String seat : seats) {
				String[] detail = seat.split("-");
				SeatVO seatVO = new SeatVO();
				seatVO.setY_index(detail[0]);
				seatVO.setX_index(Integer.parseInt(detail[1]));
				seatVO.setSeat_type_code(Integer.parseInt(detail[2]));
				showPlaceService.insertSeat(seatVO);
			}
			*/
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/admin/showPlace/showPlaceWrite.jsp");
		
		return modelAndView;
	}

	
	@RequestMapping(value="/showPlaceModifyForm.do")
	public String showPlaceModifyForm(HttpServletRequest request) { 
		String forward = "/admin/showPlace/showPlaceModifyForm.jsp";
		
		return forward;
	}
	

	@RequestMapping(value="/showPlaceModify.do", method=RequestMethod.POST)
	synchronized public ModelAndView showPlaceModify(HttpServletRequest request, MultipartFile img) { 
		
		int show_place_code = Integer.parseInt( request.getParameter("sp_code") );
		int theater_code = Integer.parseInt(request.getParameter("theater_code"));
		String show_place_name = request.getParameter("show_place_name");
		int default_cost = Integer.parseInt(request.getParameter("default_cost"));
		
		String img_change = request.getParameter("img_change");
		String seat_change = request.getParameter("seat_change");
		
		ShowPlaceVO showPlaceVO = new ShowPlaceVO();
		showPlaceVO.setShow_place_code(show_place_code);
		showPlaceVO.setTheater_code(theater_code);
		showPlaceVO.setShow_place_name(show_place_name);
		showPlaceVO.setDefault_cost(default_cost);
		
		////////          이미지 변경 확인후 이미지 저장및 setter입력
		if(img_change != null && img_change.equals("y")) {
			String filePath = "D:/Spring/cgv/MyCGV/src/main/webapp/image/showPlace";
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
			// 파일 storage 폴더에 저장
			try {
				// getInputStream() : 업로드한 파일 데이터를 읽어오는 InputStrean을 구한다.
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			showPlaceVO.setShow_place_photo_addr(fileName);
		}
		int su = showPlaceService.insertShowPlace(showPlaceVO);

		////////          좌석 변경 확인후 좌석 저장
		if(seat_change != null && seat_change.equals("y")) {
			showPlaceService.deleteSeat(show_place_code);
			
			String seat_code = request.getParameter("seat_code");
			
			JSONParser parser = new JSONParser();
			try {
				JSONObject json = (JSONObject) parser.parse(seat_code);
				
				JSONArray list = (JSONArray) json.get("seat");
				
				for(Object tmp : list) {
					JSONObject seat = (JSONObject) tmp;
					SeatVO seatVO = new SeatVO();
					seatVO.setY_index((String)seat.get("y_index"));
					seatVO.setX_index(Integer.parseInt((String)seat.get("x_index")));
					seatVO.setSeat_type_code(Integer.parseInt((String)seat.get("seat_type_code")));
					
					showPlaceService.insertSeat(seatVO);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/admin/showPlace/showPlaceModify.jsp");
		
		return modelAndView;
	}
	
	
	
	
	
	

}
