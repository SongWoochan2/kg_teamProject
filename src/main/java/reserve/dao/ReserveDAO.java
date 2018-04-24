package reserve.dao;



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

	public List<ReserveDTO> reserveList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.reserveMapper.reserveList", map);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.reserveMapper.getTotalA");
	}
	
	public ReserveDTO reserveView(int show_present_code) {
		return sqlSession.selectOne("mybatis.reserveMapper.reserveView", show_present_code);
	}
	
}
