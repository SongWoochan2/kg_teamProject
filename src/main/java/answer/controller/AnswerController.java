package answer.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import answer.bean.AnswerDTO;
import inquiry.bean.InquiryDTO;
import inquiry.controller.InquiryService;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value="/admin/answer/inquiryAnswer.do")
	public ModelAndView inquiryAnswer(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException { 
		ModelAndView modelAndView = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		
		String from_mail = "cgvproject7@gmail.com";		
		int pg = Integer.parseInt(request.getParameter("pg"));
		String to_mail = request.getParameter("member_email");
		
		int inquiry_code = Integer.parseInt(request.getParameter("inquiry_code"));
		String admin_id = (String) session.getAttribute("admin_id");
		String member_id = request.getParameter("member_id");
		String answer_title = request.getParameter("answer_title");
		String answer_content = request.getParameter("answer_content");
		
		AnswerDTO answerDTO = new AnswerDTO();
		answerDTO.setInquiry_code(inquiry_code);
		answerDTO.setAdmin_id(admin_id);
		answerDTO.setMember_id(member_id);
		answerDTO.setAnswer_title(answer_title);
		answerDTO.setAnswer_content(answer_content);
		
		int su = answerService.answerInsert(answerDTO);
		
		
		 try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		      = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(from_mail);  								// 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(to_mail);   									// 받는사람 이메일
		      messageHelper.setSubject(answer_title); 							// 메일제목은 생략이 가능하다
		      messageHelper.setText(answer_content);  							// 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		 
			modelAndView.addObject("su", su);
			modelAndView.addObject("pg", pg);
		 
		
		modelAndView.setViewName("inquiryanswer.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/answer/inquiryListAdmin.do")
	public ModelAndView inquiryListAdmin(HttpServletRequest request, HttpSession session) {
		int pg = Integer.parseInt( request.getParameter("pg") );
		String admin_id = (String) session.getAttribute("admin_id");
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(!admin_id.equals(null)) {
			int endNum = pg*5;
			int startNum = endNum-4;
			List<InquiryDTO> list = inquiryService.inquiryListAdmin(startNum, endNum);
			
			int totalA = inquiryService.getTotalA();
			int totalP = (totalA + 4)/5;
			int startPage = (pg - 1)/3*3 +1;
			int endPage = startPage + 3 - 1;
			if(totalP < endPage) endPage = totalP;
			
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("list", list);
			
			modelAndView.setViewName("inquiryListAdmin.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/answer/answerDelete.do")
	public ModelAndView answerDelete(HttpServletRequest request) { 
		int answer_code = Integer.parseInt(request.getParameter("answer_code"));
	
		int su = answerService.answerDelete(answer_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("answerDelete.jsp");
		
		return modelAndView;
	}
}





















