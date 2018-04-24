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
import resource.provider.ResourceProvider;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/member/inquiry/inquiryWriteForm.do")
	public String inquiryWriteForm() { 
		return "inquiryWriteForm.jsp";
	}
	
	@RequestMapping(value="/member/inquiry/inquiryWrite.do")
	public ModelAndView inquiryWrite(HttpServletRequest request,MultipartFile inquiry_file) throws UnsupportedEncodingException { 
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		String inquiry_id = request.getParameter("inquiry_id");							//임시 아이디	
		session.setAttribute("inquiry_id", inquiry_id);									//임시 아이디
		
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_id(inquiry_id);
		inquiryDTO.setInquiry_type(inquiry_type);
		inquiryDTO.setInquiry_title(inquiry_title);
		inquiryDTO.setInquiry_content(inquiry_content);
		String realforder = resourceProvider.getPath("image/inquiry");
		String filename = inquiry_file.getOriginalFilename();
		System.out.println("realFolder : " + realforder + "/ filename : " + filename);
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
	
	@RequestMapping(value="/member/inquiry/inquiryList.do")
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
	
	
	@RequestMapping(value="/member/inquiry/inquiryView.do")
	public ModelAndView inquiryView(HttpServletRequest request) {
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		System.out.println("inquiry_code:"+ inquiry_code);
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		InquiryDTO inquiryDTO = inquiryService.inquiryView(inquiry_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		modelAndView.setViewName("inquiryView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/member/inquiry/inquiryModifyForm.do")
	public ModelAndView inquiryModifyForm(HttpServletRequest request) {
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		
		InquiryDTO inquiryDTO = inquiryService.inquiryView(inquiry_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		modelAndView.setViewName("inquiryModifyForm.jsp");
		
		return modelAndView;
	}
	

	@RequestMapping(value="/member/inquiry/inquiryModify.do")
	public ModelAndView inquiryModify(HttpServletRequest request) throws UnsupportedEncodingException {
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_id = (String) session.getAttribute("member_id");
		String member_pwd = (String) session.getAttribute("member_pwd");
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_code(inquiry_code);
		inquiryDTO.setInquiry_title(inquiry_title);
		inquiryDTO.setInquiry_content(inquiry_content);
		inquiryDTO.setInquiry_type(inquiry_type);
		//DB
		int su = inquiryService.inquiryModify(inquiryDTO);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("inquiryModify.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/member/inquiry/inquiryDelete.do")
	public ModelAndView inquiryDelete(HttpServletRequest request) { 
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
	
		int su = inquiryService.inquiryDelete(inquiry_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("inquiryDelete.jsp");
		
		return modelAndView;
	}

	
}
