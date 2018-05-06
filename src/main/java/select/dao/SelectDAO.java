package select.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import select.bean.SelectDTO;

@Repository
public class SelectDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int addSelect(String member_id, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_id",member_id );
		map.put("movie_code",movie_code );
		return sqlSession.insert("selectMapper.addSelect",map);
	}
	
	public int deleteSelect(String member_id, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_id",member_id );
		map.put("movie_code",movie_code );
		return sqlSession.insert("selectMapper.deleteSelect",map);
	}
	
	public int selectMovieList(String member_id, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_id",member_id );
		map.put("movie_code",movie_code );
		return sqlSession.selectOne("selectMapper.selectMovieList",map);
	}
	
	public List<SelectDTO> selectMemberList(String member_id) {
		return sqlSession.selectList("selectMapper.selectMemberList",member_id);
	}
	
	public int movieGoodCount(int movie_code) {
		return sqlSession.selectOne("selectMapper.movieGoodCount", movie_code);
	}
	

	// woochan
	public Map<Integer, SelectDTO> getSelectOfMember(String member_id) {
		return sqlSession.selectMap("selectMapper.getSelectOfMember",member_id, "movie_code");
	}
	
}
