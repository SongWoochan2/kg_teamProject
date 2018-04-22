package inquiry.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import inquiry.bean.InquiryDTO;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value="/inquiry/inquiryWriteForm.do")
	public String inquiryWriteForm() { 
		return "inquiryWriteForm.jsp";
	}
	
	@RequestMapping(value="/inquiry/inquiryWrite.do")
	public ModelAndView inquiryWrite(HttpServletRequest request,MultipartFile inquiry_file) throws UnsupportedEncodingException { 
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_theater = request.getParameter("inquiry_theater");
		System.out.println("inquiry_type :"+inquiry_type);
		String inquiry_title = request.getParameter("inquiry_title");
		System.out.println("inquiry_title :"+inquiry_title);
		String inquiry_content = request.getParameter("inquiry_content");
		
		System.out.println("inquiry_content :"+inquiry_content);
		/*String inquiry_id = (String) session.getAttribute("inquiry_id");*/						/*주석 풀어야함*/
		String inquiry_id= "jin"; 													/*임시 아이디*/
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_id(inquiry_id);
		inquiryDTO.setInquiry_type(inquiry_type);
		inquiryDTO.setInquiry_theater(inquiry_theater);
		inquiryDTO.setInquiry_title(inquiry_title);
		inquiryDTO.setInquiry_content(inquiry_content);
		String realforder = "/image";
		String filename = inquiry_file.getOriginalFilename();
		File file = new File(realforder,filename);
			try {
				FileCopyUtils.copy(inquiry_file.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		inquiryDTO.setInquiry_file(filename);
		//DB
		int su = inquiryService.inquiryWrite(inquiryDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("inquiryWrite.jsp");
		
		return modelAndView;
	}
	
	/*@RequestMapping(value="/inquiry/inquiryList.do")
	public ModelAndView inquiryList(HttpServletRequest request) {

		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*5;
		int startNum = endNum-4;
		List<InquiryDTO> list = inquiryService.inquiryList(startNum, endNum);
		
		int totalA = inquiryService.getTotalA();
		int totalP = (totalA + 4)/5;
		
		int startPage = (pg - 1)/3*3 +1;
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("list", list);
		
		modelAndView.setViewName("inquiryList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/inquiry/inquiryView.do")
	public ModelAndView inquiryView(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		inquiryService.updateHit(seq);	// 조회수 증가
		InquiryDTO inquiryDTO = inquiryService.inquiryView(seq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		modelAndView.setViewName("inquiryView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/inquiry/inquiryModifyForm.do")
	public ModelAndView inquiryModifyForm(HttpServletRequest request) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		InquiryDTO inquiryDTO = inquiryService.inquiryView(seq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		modelAndView.setViewName("inquiryModifyForm.jsp");
		
		return modelAndView;
	}
	

	@RequestMapping(value="/inquiry/inquiryModify.do")
	public ModelAndView inquiryModify(HttpServletRequest request) throws UnsupportedEncodingException {
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		int code = Integer.parseInt(request.getParameter("code"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String) session.getAttribute("memId");
		String type = (String) session.getAttribute("type");
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setCode(code);
		inquiryDTO.setTitle(title);
		inquiryDTO.setContent(content);
		inquiryDTO.setId(id);
		inquiryDTO.setType(type);
		
		//DB
		int su = inquiryService.inquiryModify(inquiryDTO);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("inquiryModify.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/inquiry/inquiryDelete.do")
	public ModelAndView inquiryDelete(HttpServletRequest request) { 
		int code = Integer.parseInt(request.getParameter("code"));
	
		int su = inquiryService.inquiryDelete(code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("inquiryDelete.jsp");
		
		return modelAndView;
	}*/
	
	
}
