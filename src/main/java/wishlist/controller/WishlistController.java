package wishlist.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import resource.provider.ResourceProvider;
import theater.bean.TheaterDTO;

@Controller
public class WishlistController {
	@Autowired
	private WishlistService wishlistService;

	
	@RequestMapping(value="/mypage/wishlistDelete.do")
	public ModelAndView wishlistDelete(HttpServletRequest request) {
		System.out.println("삭제진입");
		
		/*int selecte = wishlistService.wishlistSelecte(select_code);*/

		
		int select_code = Integer.parseInt(request.getParameter("select_code"));
		System.out.println(select_code);
		// 2. DB 연동처리
	
		int result = wishlistService.wishlistDelete(select_code);

		// 3. 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("wishlistDelete.jsp");
		return modelAndView;
	}
}
