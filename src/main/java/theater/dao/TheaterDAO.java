package theater.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import theater.bean.TheaterDTO;

@Repository
public class TheaterDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TheaterDTO> theaterList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.theaterMapper.theaterList", map);
	}


	public int theaterInsert(TheaterDTO theaterDTO) {
		return sqlSession.insert("mybatis.theaterMapper.theaterInsert", theaterDTO);
	}
	
	public TheaterDTO theaterView(int theater_code) {
		return sqlSession.selectOne("mybatis.theaterMapper.theaterView", theater_code);
	}
	
	public int theaterDelete(int theater_code) {
		return sqlSession.delete("mybatis.theaterMapper.theaterDelete", theater_code);
	}
	
	public int theaterModify(TheaterDTO theaterDTO) {
		return sqlSession.update("mybatis.theaterMapper.theaterModify", theaterDTO);
	}
	
	public int updateHit(int theater_code) {
		return sqlSession.update("mybatis.theaterMapper.theaterList", theater_code);
	}
	
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.theaterMapper.getTotalA");
	}
	

}
