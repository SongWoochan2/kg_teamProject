package admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminDTO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/adminMain/adminLoginForm.do")
	public ModelAndView adminLoginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("target", "adminLoginForm");
		modelAndView.setViewName("adminIndex.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/adminMain/adminLogout.do")
	public ModelAndView adminLogout(HttpSession session) {
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adminMain.do");
		return modelAndView;
	}
	
	@RequestMapping(value="/adminMain/adminLogin.do")
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
				modelAndView.setViewName("adminMain.do");
			
		}else if(result == null){
			System.out.println("로그인 실패");
			modelAndView.setViewName("adminLoginForm.do");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value="/adminMain/adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request) {
		String target = request.getParameter("target");
		System.out.println("target : " + target);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("target", target);
		modelAndView.setViewName("adminIndex.jsp");
		return modelAndView;
	}
}
