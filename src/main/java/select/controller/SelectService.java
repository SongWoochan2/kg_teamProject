package select.controller;

import java.util.ArrayList;
import java.util.Map;

import select.bean.SelectDTO;

public interface SelectService {
	int addSelect(String member_id, int movie_code);
	int deleteSelect(String member_id, int movie_code);
	int selectMovieList(String member_id, int movie_code);
	int movieGoodCount(int movie_code);
	ArrayList<SelectDTO> selectMemberList(String member_id);
	

	public Map<Integer, SelectDTO> getSelectOfMember(String member_id);
}
