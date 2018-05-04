package noticeItem.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String supernoticeItemWriteForm( HttpServletResponse response, HttpServletRequest request) { 
		return "noticeItemWriteForm.jsp";
	}
	
	@RequestMapping(value="/admin/noticeItem/noticeItemWrite.do")
	public ModelAndView supernoticeItemWrite(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException { 
		// 데이터
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String notice_item_type = request.getParameter("notice_item_type");
		String notice_item_title = request.getParameter("notice_item_title");
		String notice_item_content = request.getParameter("notice_item_content");
		String admin_id = (String) session.getAttribute("admin_id");			
		
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
	public ModelAndView noticeItemList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String admin_id = (String)session.getAttribute("admin_id");
		String member_id = (String)session.getAttribute("memId");
		int pg = Integer.parseInt( request.getParameter("pg") );
		
		int endNum = pg*10;
		int startNum = endNum-9;
		List<NoticeItemDTO> list = noticeItemService.noticeItemList(startNum, endNum);
		int totalA = noticeItemService.getTotalA();
		int totalP = (totalA + 9)/10;
		int startPage = (pg - 1)/3*3 +1;
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("list", list);
		
		if(admin_id!=null) {
			modelAndView.setViewName("noticeItemListAdmin.jsp");
		}else if(member_id!=null) {
			modelAndView.setViewName("noticeItemListMember.jsp");
		}
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/admin/noticeItem/noticeItemView.do")
	public ModelAndView noticeItemView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String admin_id = (String)session.getAttribute("admin_id");
		String member_id = (String)session.getAttribute("memId");
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		NoticeItemDTO noticeItemDTO = noticeItemService.noticeItemView(notice_item_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("noticeItemDTO", noticeItemDTO);
		if(admin_id!=null) {
			modelAndView.setViewName("noticeItemViewAdmin.jsp");
		}else if(member_id!=null) {
			modelAndView.setViewName("noticeItemViewMember.jsp");
		}
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/noticeItem/noticeItemModifyForm.do")
	public ModelAndView supernoticeItemModifyForm(HttpServletRequest request, HttpServletResponse response) {
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		
		NoticeItemDTO noticeItemDTO = noticeItemService.noticeItemView(notice_item_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("noticeItemDTO", noticeItemDTO);
		
		modelAndView.setViewName("noticeItemModifyForm.jsp");
		
		return modelAndView;
	}
	

	@RequestMapping(value="/admin/noticeItem/noticeItemModify.do")
	public ModelAndView supernoticeItemModify(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		// 데이터
		request.setCharacterEncoding("utf-8");
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		String notice_item_type = request.getParameter("notice_item_type");
		String notice_item_title = request.getParameter("notice_item_title");
		String notice_item_content = request.getParameter("notice_item_content");
		String admin_id=(String) session.getAttribute("admin_id");
		
		// 데이터 지정
		NoticeItemDTO noticeItemDTO = new NoticeItemDTO();
		noticeItemDTO.setAdmin_id(admin_id);
		noticeItemDTO.setNotice_item_code(notice_item_code);
		noticeItemDTO.setNotice_item_type(notice_item_type);
		noticeItemDTO.setNotice_item_title(notice_item_title);
		noticeItemDTO.setNotice_item_content(notice_item_content);
		//DB
		noticeItemService.noticeItemModify(noticeItemDTO);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("noticeItemModify.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="/admin/noticeItem/noticeItemDelete.do")
	public ModelAndView supernoticeItemDelete(HttpServletRequest request, HttpServletResponse response) { 
		int notice_item_code = Integer.parseInt(request.getParameter("notice_item_code"));
		int su = noticeItemService.noticeItemDelete(notice_item_code);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("noticeItemDelete.jsp");
		return modelAndView;
	}
}
