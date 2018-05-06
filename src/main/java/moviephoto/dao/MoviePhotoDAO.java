package moviephoto.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.bean.MovieDTO;
import moviephoto.bean.MoviePhotoDTO;
import moviephoto.bean.MoviePosterDTO;

@Repository
public class MoviePhotoDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MoviePhotoDTO> moviePhotoList(int startNum, int endNum,int movie_code){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("movie_code", movie_code);
		return sqlSession.selectList("moviephotoMapper.moviePhotoList", map);
	}
	
	public int getTotal(int movie_code) {
		return sqlSession.selectOne("moviephotoMapper.getTotal", movie_code);
	}
	
	public int moviePhotoInsert(MoviePhotoDTO moviePhotoDTO) {
		return sqlSession.insert("moviephotoMapper.moviePhotoInsert",moviePhotoDTO);
	}
	
	public int moviePhotoDelete(int movie_photo_code) {
		return sqlSession.delete("moviephotoMapper.moviePhotoDelete", movie_photo_code);
	}
	
	public int moviePhotoModify(MoviePhotoDTO moviePhotoDTO) {
		return sqlSession.update("moviephotoMapper.moviePhotoModify", moviePhotoDTO);
	}
	public MoviePhotoDTO moviePosterView(int movie_code) {
		return sqlSession.selectOne("moviephotoMapper.moviePosterView",movie_code);
	}
	public List<MoviePosterDTO> moviePosterList(ArrayList<String> code_list, int m_startNum, int m_endNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("code_list", code_list);
		map.put("m_startNum", m_startNum);
		map.put("m_endNum", m_endNum);
		return sqlSession.selectList("moviephotoMapper.moviePosterList", map);
	}
	
	
}
