package savingList.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import savingList.bean.SavingListDTO;

@Repository
public class SavingListDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<SavingListDTO> savingList(int startNum, int endNum, String saving_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("saving_id", saving_id);
		return sqlSession.selectList("savingList.getList", map);
	}

	public int getTotalA(String saving_id) {
		return sqlSession.selectOne("savingList.getTotalA", saving_id);
	}
}
