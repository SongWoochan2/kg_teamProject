package showPresent.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import showPresent.bean.ShowPresentAllVO;
import showPresent.bean.ShowPresentVO;

@Repository
public class ShowPresentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertShowPresent(ShowPresentVO showPresentVO) {
		return sqlSession.insert("showPresent.insert", showPresentVO);	
	}
	
	public int deleteShowPresent(int show_present_code) {
		return sqlSession.delete("showPresent.delete", show_present_code);
	}
	
	public List<ShowPresentAllVO> getShowPresentList(String show_date, int theater_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("show_date", show_date);
		map.put("theater_code", theater_code);
		
		return sqlSession.selectList("showPresent.getList", map);
	}
	
	public ShowPresentAllVO getShowPresentOne(int show_present_code) {
		return sqlSession.selectOne("showPresent.getOne", show_present_code);
	}
	
	public List<String> getUniqueMovieCode(){
		return sqlSession.selectList("showPresent.getUniqueMovieCode");
	}
}
