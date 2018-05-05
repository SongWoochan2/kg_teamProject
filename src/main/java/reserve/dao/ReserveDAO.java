package reserve.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.bean.MovieDTO;
import reserve.bean.MemberReserveVO;
import reserve.bean.ReservedSeatVO;
import reserve.bean.SeatNumVO;
import reserve.bean.SeatTypeVO;
import reserve.bean.TimeTypeVO;
import showPresent.bean.ShowPresentAllVO;
import theater.bean.TheaterDTO;

@Repository
public class ReserveDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	///////////// 우찬

	public List<MovieDTO> getMovieList(String show_date, int theater_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("show_date", show_date);
		if(theater_code != 0) {
			map.put("theater_code", theater_code);			
		}
		return sqlSession.selectList("mybatis.reserveMapper.movieList", map);
	}

	public List<TheaterDTO> getTheaterList(String show_date, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("show_date", show_date);
		if(movie_code != 0) {
			map.put("movie_code", movie_code);
		}
		return sqlSession.selectList("mybatis.reserveMapper.theaterList", map);
	}

	public List<ShowPresentAllVO> getDateList(int movie_code, int theater_code) {
		Map<String, Integer> map = new HashMap<>();
		if(movie_code != 0) {
			map.put("movie_code", movie_code);
		}
		if(theater_code != 0) {
			map.put("theater_code", theater_code);
		}
		return sqlSession.selectList("mybatis.reserveMapper.dateList", map);
	}
	

	public List<ShowPresentAllVO> getShowList(int movie_code, int theater_code, String show_date) {
		Map<String, Object> map = new HashMap<>();
		if(movie_code != 0) {
			map.put("movie_code", movie_code);
		}
		if(theater_code != 0) {
			map.put("theater_code", theater_code);
		}
		map.put("show_date", show_date);
		return sqlSession.selectList("mybatis.reserveMapper.showList", map);
	}
	

	public List<ReservedSeatVO> getreservedSeats_list() {
		return sqlSession.selectList("mybatis.reserveMapper.getreservedSeats_list");
	}


	public List<ReservedSeatVO> getreservedSeats(int show_present_code) {
		return sqlSession.selectList("mybatis.reserveMapper.getreservedSeats", show_present_code);
	}


	public List<SeatNumVO> getReservedSeatOfShow(int movie_code, int theater_code, String show_date) {
		Map<String, Object> map = new HashMap<>();
		if(movie_code != 0) {
			map.put("movie_code", movie_code);
		}
		if(theater_code != 0) {
			map.put("theater_code", theater_code);
		}
		map.put("show_date", show_date);
		return sqlSession.selectList("mybatis.reserveMapper.getReservedSeatOfShow", map);
	}


	public List<SeatNumVO> getTotalSeatOfShow(int movie_code, int theater_code, String show_date) {
		Map<String, Object> map = new HashMap<>();
		if(movie_code != 0) {
			map.put("movie_code", movie_code);
		}
		if(theater_code != 0) {
			map.put("theater_code", theater_code);
		}
		map.put("show_date", show_date);
		return sqlSession.selectList("mybatis.reserveMapper.getTotalSeatOfShow", map);
	}

	public int deleteMemberReserve(MemberReserveVO memberReserveVO) {
		return sqlSession.update("mybatis.reserveMapper.deleteMemberReserve", memberReserveVO);
	}
	

	public int updateMemberReserve(MemberReserveVO memberReserveVO) {
		return sqlSession.update("mybatis.reserveMapper.updateMemberReserve", memberReserveVO);
	}
	
	
	public int insertMemberReserve(MemberReserveVO memberReserveVO) {
		return sqlSession.insert("mybatis.reserveMapper.insertMemberReserve", memberReserveVO);
	}
	
	public Integer movieReserveCheck(String member_id, int movie_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("movie_code", movie_code);

		return sqlSession.selectOne("mybatis.reserveMapper.movieReserveCheck", map);
	}
	
	public Map<Integer, SeatTypeVO> getSeatType(){
		return sqlSession.selectMap("mybatis.reserveMapper.getSeatType", "seat_type_code");
	}
	
	public Map<Integer, TimeTypeVO> getTimeType(){
		return sqlSession.selectMap("mybatis.reserveMapper.getTimeType", "time_type_code");
	}
	
	
}
