package reserve.dao;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import reserve.bean.ReserveDTO;
import theater.bean.TheaterDTO;

@Repository
public class ReserveDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ReserveDTO> reserveList(String show_date, int theater_code) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(show_date != null) {
			map.put("show_date", show_date);	
		}
		if(theater_code != 0) {
			map.put("theater_code", theater_code);			
		}
		return sqlSession.selectList("mybatis.reserveMapper.reserveList", map);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.reserveMapper.getTotalA");
	}
	
	public ReserveDTO reserveView(int show_present_code) {
		return sqlSession.selectOne("mybatis.reserveMapper.reserveView", show_present_code);
	}
	
}
