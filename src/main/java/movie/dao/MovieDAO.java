package movie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.bean.MovieDTO;

@Repository
public class MovieDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int movieInsert(MovieDTO movieDTO) {
		return sqlSession.insert("movieMapper.movieInsert", movieDTO);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("movieMapper.getTotalA");
	}
	
	public List<MovieDTO> movieList(int startNum, int endNum){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("movieMapper.movieList", map);
	}
	public MovieDTO movieView(int movie_code) {
		return (MovieDTO) sqlSession.selectOne("movieMapper.movieView", movie_code);
	}
	
	public int movieDelete(int movie_code) {
		return sqlSession.delete("movieMapper.movieDelete", movie_code);
	}
	public int movieModify(MovieDTO movieDTO) {
		return sqlSession.update("movieMapper.movieModify", movieDTO);
	}
	
	public List<MovieDTO> movieSearchByName(String movie_name) {
		return sqlSession.selectList("movieMapper.searchByName", movie_name);
	}
	
	public List<MovieDTO> movieFinder(Map<String, Object> map){
		return sqlSession.selectList("movieMapper.movieFinder", map);
	}
	
	public int FinderTotalA(Map<String, Object> map) {
		return sqlSession.selectOne("movieMapper.FinderTotalA", map);
	}
	
	public int goodUpdate(int movie_code, int good) {
		Map<String, Integer> map = new HashMap<>();
		map.put("movie_code", movie_code);
		map.put("good", good);
		return sqlSession.update("movieMapper.goodUpdate", map);
	}
	public List<MovieDTO> presentMovieList(ArrayList<String> code_list, int m_startNum, int m_endNum){
		Map<String, Object> map = new HashMap<>();
		map.put("code_list", code_list);
		map.put("m_startNum", m_startNum);
		map.put("m_endNum", m_endNum);
		return sqlSession.selectList("movieMapper.presentMovieList", map);
	}
}
