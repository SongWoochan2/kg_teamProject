package admin.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminDTO;
import admin.bean.AdminRequestDTO;
import movie.bean.MoviePage;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin/adminMain/adminLoginForm.do")
	public ModelAndView adminLoginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adminLogin.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminLogout.do")
	public ModelAndView adminLogout(HttpSession session) {
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adminIndex.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminLogin.do")
	public ModelAndView adminLogin(HttpServletRequest request,HttpSession session) {
		AdminDTO adminDTO = new AdminDTO();
		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		adminDTO.setAdmin_id(admin_id);
		adminDTO.setAdmin_pwd(admin_pwd);
		
		AdminDTO result = adminService.adminLogin(adminDTO);
		ModelAndView modelAndView = new ModelAndView();
		if(result !=null) {
			System.out.println("로그인 성공");
				System.out.println("result : " + result.getAdmin_id()+"/"+result.getAdmin_pwd());
				session.setAttribute("admin_id", result.getAdmin_id());
				session.setAttribute("admin_pwd", result.getAdmin_pwd());	
				modelAndView.setViewName("adminIndex.jsp");
			
		}else if(result == null){
			System.out.println("로그인 실패");
			modelAndView.setViewName("adminLoginForm.do");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value="/admin/adminMain/adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request) {
		MoviePage moviePage = (MoviePage)request.getAttribute("moviePage");
		String pg = request.getParameter("pg");
		System.out.println("pg : " + pg);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.setViewName("adminIndex.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminEnrollForm.do")
	public ModelAndView adminEnrollForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adminEnroll.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminEnrollRequest.do")
	public ModelAndView adminEnrollRequest(HttpServletRequest request) {
		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String admin_pwd = request.getParameter("admin_pwd");
		AdminRequestDTO adminRequestDTO = new AdminRequestDTO();
		adminRequestDTO.setAdmin_id(admin_id);
		adminRequestDTO.setAdmin_name(admin_name);
		adminRequestDTO.setAdmin_pwd(admin_pwd);
		
		int result = adminService.adminRequest(adminRequestDTO);
		if(result == 0) {
			System.out.println("신청 실패");
			
		}else if(result == 1) {
			System.out.println("신청 성공");
		}
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("adminIndex.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/admin/adminMain/adminRequestList.do")
	public ModelAndView adminRequestList(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = page*20;
		int startNum = endNum-19;
		
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<AdminRequestDTO> list = adminService.adminRequestList(startNum, endNum);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("adminRequestList.jsp");
		return modelAndView;
	}
}
