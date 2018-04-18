package showPlace.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import showPlace.bean.ShowPlaceVO;

@Repository
public class ShowPlaceDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int insertShowPlace(ShowPlaceVO showPlaceVO) {
		return sqlSession.insert("showPlace.insert", showPlaceVO);
	}
	
	public int updateShowPlace(ShowPlaceVO showPlaceVO) {
		return sqlSession.update("showPlace.update", showPlaceVO);
	}
	
	public int deleteShowPlace(int show_place_code) {
		return sqlSession.delete("showPlace.delete", show_place_code);
	}
	
	public ShowPlaceVO selectOne(int show_place_code) {
		return sqlSession.selectOne("showPlace.getOne", show_place_code);
	}

	public List<ShowPlaceVO> selectList() {
		return sqlSession.selectList("showPlace.getList");
	}
	
	
}
