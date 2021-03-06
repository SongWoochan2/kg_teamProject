package inquiry.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import answer.bean.AnswerDTO;
import answer.controller.AnswerService;
import inquiry.bean.InquiryDTO;
import member.bean.MemberDTO;
import member.controller.MemberServiceImpl;
import resource.provider.ResourceProvider;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private ResourceProvider resourceProvider;
	
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="/main/inquiry/inquiryWriteForm.do")
	public ModelAndView hyperinquiryWriteForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String inquiry_id=(String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(inquiry_id);
		
		modelAndView.addObject("memberDTO", memberDTO);
		
		modelAndView.setViewName("inquiryWriteForm.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value="/main/inquiry/inquiryWrite.do")
	public ModelAndView inquiryWrite(HttpServletRequest request, HttpServletResponse response, MultipartFile inquiry_file, HttpSession session) throws UnsupportedEncodingException { 
		// 데이터
		request.setCharacterEncoding("utf-8");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");	
		String inquiry_id = (String)session.getAttribute("memId");
	
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_id(inquiry_id);
		inquiryDTO.setInquiry_type(inquiry_type);
		inquiryDTO.setInquiry_title(inquiry_title);
		inquiryDTO.setInquiry_content(inquiry_content);
		String realforder = resourceProvider.getPath("image/inquiry");
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
		
		System.out.println(inquiryDTO.toString());
		
		inquiryService.inquiryWrite(inquiryDTO);

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("inquiryWrite.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/main/inquiry/inquiryListMember.do")
	public ModelAndView hyperinquiryListMember(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String inquiry_id=(String) session.getAttribute("memId");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.memberView(inquiry_id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(!inquiry_id.equals(null)) {
			int pg = Integer.parseInt( request.getParameter("pg") );
			int endNum = pg*10;
			int startNum = endNum-9;
			
			List<InquiryDTO> list = inquiryService.inquiryListMember(startNum, endNum, inquiry_id);
	
			int totalA = inquiryService.getTotalA(inquiry_id);
			int totalP = (totalA + 9)/10;
			int startPage = (pg - 1)/3*3 +1;
			int endPage = startPage + 3 - 1;
			if(totalP < endPage) endPage = totalP;
			
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("list", list);
			modelAndView.addObject("totalA", totalA);
			modelAndView.addObject("memberDTO", memberDTO);
			modelAndView.setViewName("inquiryListMember.jsp");
		
		}
	
		return modelAndView;
	}
	
	
	@RequestMapping(value="/main/inquiry/inquiryView.do")
	public ModelAndView inquiryView(HttpServletRequest request, HttpServletResponse response) {
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		InquiryDTO inquiryDTO = inquiryService.inquiryView(inquiry_code);
		MemberDTO memberDTO = memberService.memberView(inquiryDTO.getInquiry_id());
		AnswerDTO answerDTO = answerService.answerView(inquiry_code);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("answerDTO", answerDTO);
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("inquiryView.jsp");
		return modelAndView;
	}
	



	@RequestMapping(value="/main/inquiry/inquiryDelete.do")
	public ModelAndView hyperinquiryDelete(HttpServletRequest request, HttpServletResponse response) { 
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		System.out.println(inquiry_code);
		int su = inquiryService.inquiryDelete(inquiry_code);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("su", su);
		System.out.println(su);
		modelAndView.setViewName("inquiryDelete.jsp");
		
		return modelAndView;
	}
	
	
	
}





















