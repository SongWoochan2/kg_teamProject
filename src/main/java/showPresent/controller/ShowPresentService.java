package showPresent.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import showPresent.bean.ShowPresentAllVO;
import showPresent.bean.ShowPresentSuperVO;
import showPresent.bean.ShowPresentVO;
import showPresent.dao.ShowPresentDAO;

@Service
public class ShowPresentService {
	
	@Autowired
	public ShowPresentDAO showPresentDAO;

	
	public int insertShowPresent(ShowPresentVO showPresentVO) {
		return showPresentDAO.insertShowPresent(showPresentVO);	
	}
	
	public int deleteShowPresent(int show_present_code) {
		return showPresentDAO.deleteShowPresent(show_present_code);
	}
	
	public List<ShowPresentAllVO> getShowPresentList(String show_date, int theater_code) {
		return showPresentDAO.getShowPresentList(show_date, theater_code);
	}
	
	public ShowPresentSuperVO getShowPresentOneFully(int show_present_code) {
		return showPresentDAO.getShowPresentOneFully(show_present_code);
	}
	
	public ShowPresentAllVO getShowPresentOne(int show_present_code) {
		return showPresentDAO.getShowPresentOne(show_present_code);
	}
	
	public Integer getUniqueMovieCodeCount(){
		return showPresentDAO.getUniqueMovieCodeCount();
	}
	
}
