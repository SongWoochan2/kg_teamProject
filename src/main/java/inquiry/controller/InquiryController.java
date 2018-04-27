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

import answer.bean.AnswerDTO;
import answer.controller.AnswerService;
import inquiry.bean.InquiryDTO;
import member.bean.MemberDTO;
import member.controller.MemberServiceImpl;
import resource.provider.ResourceProvider;

@Controller
public class InquiryController {
	@Autowired
	private AnswerService answerService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private ResourceProvider resourceProvider;
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/member/inquiry/inquiryWriteForm.do")
	public ModelAndView inquiryWriteForm(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException { 
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();
		String member_id = (String) session.getAttribute("member_id");         
		session.setAttribute("inquiry_id", member_id);
		
		MemberDTO memberDTO = memberService.memberInfo(member_id);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("inquiryWriteForm.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value="/member/inquiry/inquiryWrite.do")
	public ModelAndView inquiryWrite(HttpServletRequest request,MultipartFile inquiry_file,HttpSession session) throws UnsupportedEncodingException { 
		// 데이터
		System.out.println("HELLO!!!");
		request.setCharacterEncoding("utf-8");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		String inquiry_id = request.getParameter("inquiry_id");								//수정후 삭제할 라인				
		session.setAttribute("inquiry_id", inquiry_id);
		/*String inquiry_id = (String) session.getAttribute("inquiry_id");	*/				// 수정 후 주석 풀것
		/*String admin_id = request.getParameter("admin_id");*/		
		
		// 데이터 지정
		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setInquiry_id("hello");
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
		System.out.println(inquiryDTO);
		inquiryService.inquiryWrite(inquiryDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("inquiryWrite.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/inquiry/inquiryListAdmin.do")
	public ModelAndView inquiryListAdmin(HttpServletRequest request) {
		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*5;
		int startNum = endNum-4;
		List<InquiryDTO> list = inquiryService.inquiryListAdmin(startNum, endNum);
		
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
		
		modelAndView.setViewName("inquiryListAdmin.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/inquiry/inquiryListMember.do")
	public ModelAndView inquiryListMember(HttpServletRequest request, HttpSession session) {
		String inquiry_id=(String) session.getAttribute("inquiry_id");
		ModelAndView modelAndView = new ModelAndView();
		
		if(!inquiry_id.equals(null)) {
			int pg = Integer.parseInt( request.getParameter("pg") );
			
			int endNum = pg*5;
			int startNum = endNum-4;
			List<InquiryDTO> list = inquiryService.inquiryListMember(startNum, endNum);
			
			int totalA = inquiryService.getTotalA();
			int totalP = (totalA + 4)/5;
			int startPage = (pg - 1)/3*3 +1;
			int endPage = startPage + 3 - 1;
			if(totalP < endPage) endPage = totalP;
			
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("list", list);
			
			modelAndView.setViewName("inquiryListMember.jsp");
		
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value="/member/inquiry/inquiryView.do")
	public ModelAndView inquiryView(HttpServletRequest request) {
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		InquiryDTO inquiryDTO = inquiryService.inquiryView(inquiry_code);
		AnswerDTO answerDTO = answerService.answerView(inquiry_code);
		MemberDTO memberDTO = memberService.memberInfo(inquiryDTO.getInquiry_id());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		modelAndView.addObject("answerDTO", answerDTO);
		
		modelAndView.setViewName("inquiryView.jsp");
		
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
	
	/*@RequestMapping(value="/admin/adminInquiry/inquiryAnswerForm.do")
	public ModelAndView inquiryAnswerForm(HttpServletRequest request) { 
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		InquiryDTO inquiryDTO = inquiryService.inquiryView(inquiry_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		modelAndView.setViewName("redirect:../admin/inquiryAnswerForm.jsp");
		
		return modelAndView;
	}*/
	
	/*@RequestMapping(value="/admin/adminInquiry/inquiryAnswer.do")
	public ModelAndView inquiryAnswer(HttpServletRequest request,MultipartFile inquiry_file) throws UnsupportedEncodingException { 
		
		
		request.setCharacterEncoding("utf-8");
		String inquiry_type = request.getParameter("inquiry_type");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		String inquiry_id = request.getParameter("inquiry_id");							
		
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
		
		
		String from_mail = "cgvproject7@gmail.com";						//보낼 메일
		String answer_email = request.getParameter("answer_email");
		String answer_title = request.getParameter("answer_title");
		String answer_content = request.getParameter("answer_content");
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		 try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		      = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(from_mail);  						// 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(answer_email);   						// 받는사람 이메일
		      messageHelper.setSubject(answer_title); 					// 메일제목은 생략이 가능하다
		      messageHelper.setText(answer_content);  					// 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		
		modelAndView.setViewName("inquiryList.jsp");
		
		return modelAndView;
	}*/

	
}





















