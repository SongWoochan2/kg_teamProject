package reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import reserve.bean.ReserveDTO;
import reserve.dao.ReserveDAO;
import theater.dao.TheaterDAO;
import theater.bean.TheaterDTO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	ReserveDAO reserveDAO;

	@Override
	public ReserveDTO reserveView(int show_present_code) {
		return reserveDAO.reserveView(show_present_code);
	}

	@Override
	public ArrayList<ReserveDTO> reserveList(String show_date, int theater_code) {
		return (ArrayList<ReserveDTO>) reserveDAO.reserveList(show_date, theater_code);
	}

	@Override
	public void updateHit(int show_present_code) {
		return;
		
	}
	
	@Override
	public int getTotalA() {
		return reserveDAO.getTotalA();
	}

	
	
}
