package qna.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import qna.bean.QnaDTO;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="/admin/qna/qnaWriteForm.do")
	public String superqnaWriteForm(HttpServletResponse response, HttpServletRequest request) { 
		
		return "qnaWriteForm.jsp";
	}
	
	@RequestMapping(value="/admin/qna/qnaWrite.do")
	public ModelAndView superqnaWrite(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException { 
		
		// 데이터
		request.setCharacterEncoding("utf-8");
		String qna_type = request.getParameter("qna_type");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		
		// 데이터 지정
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setQna_type(qna_type);
		qnaDTO.setQna_title(qna_title);
		qnaDTO.setQna_content(qna_content);
		
		//DB
		qnaService.qnaWrite(qnaDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("qnaWrite.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/qna/qnaList.do")
	public ModelAndView superqnaList(HttpServletRequest request, HttpServletResponse response) {

		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*5;
		int startNum = endNum-4;
		List<QnaDTO> list = qnaService.qnaList(startNum, endNum);
		int totalA = qnaService.getTotalA();
		int totalP = (totalA + 4)/5;
		int startPage = (pg - 1)/3*3 +1;
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("qnaList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/admin/qna/qnaView.do")
	public ModelAndView superqnaView(HttpServletRequest request, HttpServletResponse response) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		
		QnaDTO qnaDTO = qnaService.qnaView(qna_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qnaDTO", qnaDTO);
		
		modelAndView.setViewName("qnaView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/qna/qnaModifyForm.do")
	public ModelAndView superqnaModifyForm(HttpServletRequest request, HttpServletResponse response) {
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		
		QnaDTO qnaDTO = qnaService.qnaView(qna_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qnaDTO", qnaDTO);
		
		modelAndView.setViewName("qnaModifyForm.jsp");
		
		return modelAndView;
	}
	

	@RequestMapping(value="/admin/qna/qnaModify.do")
	public ModelAndView superqnaModify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		// 데이터
		request.setCharacterEncoding("utf-8");
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		String qna_type = request.getParameter("qna_type");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
	
		// 데이터 지정
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setQna_code(qna_code);
		qnaDTO.setQna_type(qna_type);
		qnaDTO.setQna_title(qna_title);
		qnaDTO.setQna_content(qna_content);
		//DB
		int su = qnaService.qnaModify(qnaDTO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("qnaModify.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/admin/qna/qnaDelete.do")
	public ModelAndView superqnaDelete(HttpServletRequest request, HttpServletResponse response) { 
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		int su = qnaService.qnaDelete(qna_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("qnaDelete.jsp");
		return modelAndView;
	}
}
