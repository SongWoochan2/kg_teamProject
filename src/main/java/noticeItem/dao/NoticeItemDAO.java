package noticeItem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import noticeItem.bean.NoticeItemDTO;

@Repository
public class NoticeItemDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int noticeItemWrite(NoticeItemDTO noticeItemDTO) {
		return sqlSession.insert("mybatis.noticeItem.noticeItemWrite", noticeItemDTO);
	}
	
	public int noticeItemModify(NoticeItemDTO noticeItemDTO) {
		return sqlSession.update("mybatis.noticeItem.noticeItemModify", noticeItemDTO);
	}
	
	public List<NoticeItemDTO> noticeItemList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.noticeItem.noticeItemList", map);
	}
	
	public NoticeItemDTO noticeItemView(int notice_item_code) {
		return sqlSession.selectOne("mybatis.noticeItem.noticeItemView", notice_item_code);
	}
	
	public int updateHit(int notice_item_code) {
		return sqlSession.update("mybatis.noticeItem.noticeItemList", notice_item_code);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.noticeItem.totalA");
	}
	
	public int noticeItemDelete(int notice_item_code) {
		return sqlSession.delete("mybatis.noticeItem.noticeItemDelete", notice_item_code);
	}
}
