package answer.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import answer.bean.AnswerDTO;
import inquiry.bean.InquiryDTO;
import inquiry.controller.InquiryService;
import resource.provider.ResourceProvider;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private InquiryService inquiryService;

	@Autowired
	private ResourceProvider resourceProvider;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value="/member/inquiry/answer.do")
	public ModelAndView answerInsert(HttpServletRequest request,MultipartFile answer_file) throws UnsupportedEncodingException { 
		
		request.setCharacterEncoding("utf-8");
		String from_mail = "cgvproject7@gmail.com";						//보낼 메일
		String to_mail = request.getParameter("member_email");
		String admin_id = request.getParameter("admin_id");
		String member_id = request.getParameter("member_id");
		String answer_title = request.getParameter("answer_title");
		String answer_content = request.getParameter("answer_content");
		ModelAndView modelAndView = new ModelAndView();
		
		AnswerDTO answerDTO = new AnswerDTO();
		InquiryDTO inquiryDTO = new InquiryDTO();
		answerDTO.setAdmin_id(admin_id);
		answerDTO.setMember_id(member_id);
		answerDTO.setAnswer_title(answer_title);
		answerDTO.setAnswer_content(answer_content);
		
		 try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		      = new MimeMessageHelper(message, true, "UTF-8");
		      messageHelper.setFrom(from_mail);  						// 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(to_mail);   							// 받는사람 이메일
		      messageHelper.setSubject(answer_title); 					// 메일제목은 생략이 가능하다
		      messageHelper.setText(answer_content);  					// 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		 int inquiry_code = inquiryDTO.getInquiry_code();
		 int answer_result = answerService.answerInsert(answerDTO);
		 inquiryService.updateStatus(inquiry_code);
		 if(answer_result!=0) {
			 modelAndView.addObject("answerDTO", answerDTO);
			 modelAndView.addObject("inquiryDTO", inquiryDTO);
			 modelAndView.setViewName("/inquiry/inqruityAnswerView.jsp");
		 }
		return modelAndView;
	}
	
	/*@RequestMapping(value="/member/answer/answerDelete.do")
	public ModelAndView answerDelete(HttpServletRequest request) { 
		int answer_code = Integer.parseInt(request.getParameter("answer_code"));
	
		int su = answerService.answerDelete(answer_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("answerDelete.jsp");
		
		return modelAndView;
	}*/
}





















