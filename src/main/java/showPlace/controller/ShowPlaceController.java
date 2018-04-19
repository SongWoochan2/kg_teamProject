package showPlace.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import showPlace.bean.SeatVO;
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
	public ModelAndView showPlaceDelete(HttpServletRequest request) { 
		int show_place_code = Integer.parseInt(request.getParameter("sp_code"));
	
		int su = showPlaceService.deleteShowPlace(show_place_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("showPlaceDelete.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/showPlaceWriteForm.do")
	public String showPlaceWriteForm(HttpServletRequest request) { 
		String forward = "showPlaceWriteForm.jsp";
		
		return forward;
	}
	

	@RequestMapping(value="/admin/showPlaceWrite.do", method=RequestMethod.POST)
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
		String[] seats = seat_code.split("/");
		for(String seat : seats) {
			String[] detail = seat.split("-");
			SeatVO seatVO = new SeatVO();
			seatVO.setY_index(detail[0]);
			seatVO.setX_index(Integer.parseInt(detail[1]));
			seatVO.setSeat_type_code(Integer.parseInt(detail[2]));
			showPlaceService.insertSeat(seatVO);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("showPlaceWrite.jsp");
		
		return modelAndView;
	}

}
