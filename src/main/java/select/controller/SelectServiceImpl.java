package select.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import select.bean.SelectDTO;
import select.dao.SelectDAO;

@Service
public class SelectServiceImpl implements SelectService{
	@Autowired
	private SelectDAO selectDAO;


	@Override
	public int addSelect(String member_id, int movie_code) {
		
		return selectDAO.addSelect(member_id,movie_code);
	}

	@Override
	public int deleteSelect(String member_id, int movie_code) {
		return selectDAO.deleteSelect(member_id,movie_code);
	}

	@Override
	public int selectMovieList(String member_id, int movie_code) {
		return selectDAO.selectMovieList(member_id, movie_code);
	}

	@Override
	public ArrayList<SelectDTO> selectMemberList(String member_id) {
		return (ArrayList<SelectDTO>) selectDAO.selectMemberList(member_id);
	}

	@Override
	public int movieGoodCount(int movie_code) {
		return selectDAO.movieGoodCount(movie_code);
	}
	
	
}
