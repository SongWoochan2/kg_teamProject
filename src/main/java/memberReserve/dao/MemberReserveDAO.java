package memberReserve.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import memberReserve.bean.MemberReserveDTO;
import memberReserve.bean.MemberReserveListDTO;

@Repository
public class MemberReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 예매내역
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
	
	public int countSeats(int reserve_code) {
		return sqlSession.selectOne("memberReserve.countSeats", reserve_code);
	}
	
	public MemberReserveDTO getSeats(int reserve_code) {
		return sqlSession.selectOne("memberReserve.getSeats", reserve_code);
	}
	
	// 예매취소
	public int memReserveCancel(int reserve_code) {
		return sqlSession.update("memberReserve.memReserveCancel", reserve_code);
	}
	
	// 취소내역
	public ArrayList<Integer> getCancelCodes(String reserve_id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("reserve_id", reserve_id);
		return (ArrayList)sqlSession.selectList("memberReserve.getCancelCodes", map);
	}
	
	public int getTotalCancel(String reserve_id) {
		return sqlSession.selectOne("memberReserve.getTotalCancel", reserve_id);
	}
	
	
	
	// 내가 본 영화
	public ArrayList<Integer> getWatchedCodes(String reserve_id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("reserve_id", reserve_id);
		return (ArrayList)sqlSession.selectList("memberReserve.getWatchedCodes", map);
	}
	
	public int getTotalWatched(String reserve_id) {
		return sqlSession.selectOne("memberReserve.getTotalWatched", reserve_id);
	}

}
