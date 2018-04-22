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
		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String id_check = request.getParameter("id_check");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("admin_id", admin_id);
		modelAndView.addObject("admin_name", admin_name);
		modelAndView.setViewName("adminEnroll.jsp");
		modelAndView.addObject("id_check", id_check);
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
		int totalA = adminService.getTotal();
		ArrayList<AdminRequestDTO> list = adminService.adminRequestList(startNum, endNum);
		int totalPage = (totalA + 8) / 9;
		int startPage = (page-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(totalPage < endPage) endPage = totalPage;
		MoviePage moviePage = new MoviePage();
		moviePage.setPg(page);
		moviePage.setEndPage(endPage);
		moviePage.setStartPage(startPage);
		moviePage.setTotalPage(totalPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageInfo", moviePage);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("adminRequestList.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminAllowable.do")
	public ModelAndView adminAllowable(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int admin_request_code = Integer.parseInt(request.getParameter("admin_request_code"));
		int allowable = Integer.parseInt(request.getParameter("allowable"));
		ModelAndView modelAndView = new ModelAndView();
		if(allowable==0) {
			System.out.println("승인 거부");
		}else if(allowable == 1) {
			System.out.println("승인 허가");
			AdminRequestDTO adminRequestDTO = adminService.adminRequestInfo(admin_request_code);
			if(adminRequestDTO == null) {
				System.out.println("DB 오류");
			}else if(adminRequestDTO != null){
				AdminDTO adminDTO = new AdminDTO();
				adminDTO.setAdmin_id(adminRequestDTO.getAdmin_id());
				adminDTO.setAdmin_name(adminRequestDTO.getAdmin_name());
				adminDTO.setAdmin_pwd(adminRequestDTO.getAdmin_pwd());				
				int result_allow = adminService.adminEnroll(adminDTO);
				if(result_allow == 0) {
					System.out.println("등록 실패");
				}else if(result_allow == 1) {
					System.out.println("등록 완료");					
				}
			}
		}
		
		int result_delete = adminService.adminRequestDelete(admin_request_code);
		
		if(result_delete == 0) {
			System.out.println("신청 삭제 실패");
		}else if(result_delete == 1) {
			System.out.println("신청 삭제 성공");
		}
		
		modelAndView.addObject("pg", page);
		modelAndView.setViewName("adminRequestList.do");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/adminMain/adminIdCheck.do")
	public ModelAndView adminIdCheck(HttpServletRequest request) {
		String admin_id = request.getParameter("admin_id");
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setAdmin_id(admin_id);
		adminDTO.setAdmin_name(request.getParameter("admin_name"));
		System.out.println("admin_name : "+request.getParameter("admin_name"));
		AdminDTO check_result = adminService.adminIdCheck(admin_id);
		int result = 0;
		if(check_result == null) {
			if(admin_id.equals("")) {
				result = 2;
			}else {
				result = 0;				
			}
		}else if(check_result != null) {
			result = 1;
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("requestData", adminDTO);
		modelAndView.setViewName("adminIdCheck.jsp");
		return modelAndView;
	}
}
