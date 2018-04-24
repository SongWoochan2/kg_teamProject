package showPresent.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<ShowPresentVO> getShowPresentList(String date, int theater_code) {
		return showPresentDAO.getShowPresentList(date, theater_code);
	}
	
	public ShowPresentVO getShowPresentOne(int show_present_code) {
		return showPresentDAO.getShowPresentOne(show_present_code);
	}
	
	

}
