package movietrailer.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.bean.MovieDTO;
import movietrailer.bean.MovieTrailerDTO;

@Repository
public class MovieTrailerDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MovieTrailerDTO> movieTrailerList(int startNum, int endNum, int movie_code){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("movie_code", movie_code);
		return sqlSession.selectList("movietrailerMapper.movieTrailerList", map);
	}
	
	public int movieTrailerDelete(int movie_trailer_code) {
		
		return sqlSession.delete("movietrailerMapper.movieTrailerDelete", movie_trailer_code);
	}
	
	public int movieTrailerInsert(MovieTrailerDTO movieTrailerDTO) {
		return sqlSession.insert("movietrailerMapper.movieTrailerInsert", movieTrailerDTO);
	}
	
	public int getTotalA(int movie_code) {
		return sqlSession.selectOne("movietrailerMapper.getTotal", movie_code);
	}
}
