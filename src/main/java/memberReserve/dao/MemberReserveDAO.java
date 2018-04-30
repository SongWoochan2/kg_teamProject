package memberReserve.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import memberReserve.bean.MemberReserveListDTO;

@Repository
public class MemberReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Integer> getReserveCodes(String reserve_id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("reserve_id", reserve_id);
		return (ArrayList)sqlSession.selectList("memberReserve.getReserveCodes", map);
	}

	public int getTotalVal(String reserve_id) {
		return sqlSession.selectOne("memberReserve.getTotalVal", reserve_id);
	}
	
	public MemberReserveListDTO getAllReserveList(int reserve_code) {
		return sqlSession.selectOne("memberReserve.getAllReserveList", reserve_code);
	}
	
	public ArrayList<Integer> getCancleCodes(String reserve_id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("reserve_id", reserve_id);
		return (ArrayList)sqlSession.selectList("memberReserve.getCancleCodes", map);
	}
	
	public int getTotalCancle(String reserve_id) {
		return sqlSession.selectOne("memberReserve.getTotalCancle", reserve_id);
	}
}
