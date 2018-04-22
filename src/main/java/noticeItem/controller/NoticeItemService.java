package noticeItem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import noticeItem.bean.NoticeItemDTO;
import noticeItem.dao.NoticeItemDAO;

@Service
public class NoticeItemService {
	@Autowired
	private NoticeItemDAO noticeItemDAO;
	
	public int noticeItemWrite(NoticeItemDTO noticeItemDTO) {
		return noticeItemDAO.noticeItemWrite(noticeItemDTO);
	}
	
	public int noticeItemModify(NoticeItemDTO noticeItemDTO) {
		return noticeItemDAO.noticeItemModify(noticeItemDTO);
	}
	
	public List<NoticeItemDTO> noticeItemList(int startNum, int endNum){
		return noticeItemDAO.noticeItemList(startNum, endNum);
	}
	
	public NoticeItemDTO noticeItemView(int notice_item_code) {
		return noticeItemDAO.noticeItemView(notice_item_code);
	}
	
	
	public int getTotalA() {
		return noticeItemDAO.getTotalA();
	}
	
	public int noticeItemDelete(int notice_item_code) {
		return noticeItemDAO.noticeItemDelete(notice_item_code);
	}

}
