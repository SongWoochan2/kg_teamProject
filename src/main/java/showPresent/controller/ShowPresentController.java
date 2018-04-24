package showPresent.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShowPresentController {
	
	@Autowired
	public ShowPresentService showPresentService;

	
	@RequestMapping(value="/showPresentList.do")
	public ModelAndView supertheaterList(HttpServletRequest request, HttpServletResponse response) {
		int count = Integer.parseInt(request.getParameter("count"));

		Calendar cal = Calendar.getInstance();
	    cal.add(cal.DATE, count);

	    int year = cal.get(cal.YEAR);  //YEAR 는 모두 대문자로 써야한다.
	    int month = cal.get(cal.MONTH);
	    int date = cal.get(cal.DATE) ;

	    
	    System.out.println( year +"/"+month+"/"+date );

		
		
		return null;
	}
	
	

	
	
	
	
}
