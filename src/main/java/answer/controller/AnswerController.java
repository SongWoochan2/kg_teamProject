package answer.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import answer.bean.AnswerDTO;

@Controller
public class AnswerController {
	/*@Autowired
	private AnswerService answerService;

	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value="/member/answer/answerList.do")
	public ModelAndView answerList(HttpServletRequest request) {

		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*5;
		int startNum = endNum-4;
		List<AnswerDTO> list = answerService.answerList(startNum, endNum);
		
		int totalA = answerService.getTotalA();
		int totalP = (totalA + 4)/5;
		
		int startPage = (pg - 1)/3*3 +1;
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("list", list);
		
		modelAndView.setViewName("answerList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/member/answer/answerView.do")
	public ModelAndView answerView(HttpServletRequest request) {
		int answer_code = Integer.parseInt(request.getParameter("answer_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		AnswerDTO answerDTO = answerService.answerView(answer_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("answerDTO", answerDTO);
		
		modelAndView.setViewName("answerView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/answer/answer.do")
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
		
		AnswerDTO answerDTO = new AnswerDTO();
		answerDTO.setAdmin_id(admin_id);
		answerDTO.setMember_id(member_id);
		answerDTO.setAnswer_title(answer_title);
		answerDTO.setAnswer_content(answer_content);
		int su = answerService.answerWrite(inquiryDTO);
		
		
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





















