package noticeItem.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import noticeItem.bean.NoticeItemDTO;

@Controller
public class NoticeItemController {
	@Autowired
	private NoticeItemService noticeItemService;
	
	@RequestMapping(value="/admin/noticeItem/noticeItemWriteForm.do")
	public String noticeItemWriteForm() { 
		return "noticeItemWriteForm.jsp";
	}
	
	@RequestMapping(value="/admin/noticeItem/noticeItemWrite.do")
	public ModelAndView noticeItemWrite(HttpServletRequest request) throws UnsupportedEncodingException { 
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String notice_item_type = request.getParameter("notice_item_type");
		String notice_item_title = request.getParameter("notice_item_title");
		String notice_item_content = request.getParameter("notice_item_content");
		
		
		String admin_id="jin";														//임시 로그인
		session.setAttribute("admin_id", admin_id);
		admin_id = (String) session.getAttribute("admin_id");						//여기까지 삭제 할것
		
		
		/*String admin_id = (String) session.getAttribute("admin_id");*/			//주석 풀기
		
		
		
		// 데이터 지정
		NoticeItemDTO noticeItemDTO = new NoticeItemDTO();
		noticeItemDTO.setAdmin_id(admin_id);
		noticeItemDTO.setNotice_item_type(notice_item_type);
		noticeItemDTO.setNotice_item_title(notice_item_title);
		noticeItemDTO.setNotice_item_content(notice_item_content);
		
		//DB
		int su = noticeItemService.noticeItemWrite(noticeItemDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("noticeItemWrite.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/noticeItem/noticeItemList.do")
	public ModelAndView noticeItemList(HttpServletRequest request) {

		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*5;
		int startNum = endNum-4;
		List<NoticeItemDTO> list = noticeItemService.noticeItemList(startNum, endNum);
		int totalA = noticeItemService.getTotalA();
		int totalP = (totalA + 4)/5;
		int startPage = (pg - 1)/3*3 +1;
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("noticeItemList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/admin/noticeItem/noticeItemView.do")
	public ModelAndView noticeItemView(HttpServletRequest request) {
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NoticeItemDTO noticeItemDTO = noticeItemService.noticeItemView(notice_item_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("noticeItemDTO", noticeItemDTO);
		
		modelAndView.setViewName("noticeItemView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/noticeItem/noticeItemModifyForm.do")
	public ModelAndView noticeItemModifyForm(HttpServletRequest request) {
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		
		NoticeItemDTO noticeItemDTO = noticeItemService.noticeItemView(notice_item_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("noticeItemDTO", noticeItemDTO);
		
		modelAndView.setViewName("noticeItemModifyForm.jsp");
		
		return modelAndView;
	}
	

	@RequestMapping(value="/admin/noticeItem/noticeItemModify.do")
	public ModelAndView noticeItemModify(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		// 데이터
		request.setCharacterEncoding("utf-8");
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		String notice_item_type = request.getParameter("notice_item_type");
		String notice_item_title = request.getParameter("notice_item_title");
		String notice_item_content = request.getParameter("notice_item_content");
		
		String admin_id="jin";														//임시 로그인
		session.setAttribute("admin_id", admin_id);
		admin_id = (String) session.getAttribute("admin_id");						//여기까지 삭제 할것
		
		/*String admin_id = (String) session.getAttribute("admin_Id");*/					//4-19잠시 주석
		// 데이터 지정
		NoticeItemDTO noticeItemDTO = new NoticeItemDTO();
		noticeItemDTO.setAdmin_id(admin_id);
		noticeItemDTO.setNotice_item_code(notice_item_code);
		noticeItemDTO.setNotice_item_type(notice_item_type);
		noticeItemDTO.setNotice_item_title(notice_item_title);
		noticeItemDTO.setNotice_item_content(notice_item_content);
		System.out.println(1);
		//DB
		int su = noticeItemService.noticeItemModify(noticeItemDTO);
		System.out.println(2);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("noticeItemModify.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/noticeItem/noticeItemDelete.do")
	public ModelAndView noticeItemDelete(HttpServletRequest request) { 
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		int su = noticeItemService.noticeItemDelete(notice_item_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("noticeItemDelete.jsp");
		return modelAndView;
	}
}
