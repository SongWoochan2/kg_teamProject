package theater.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import theater.dao.TheaterDAO;
import theater.bean.TheaterDTO;

@Service
public class TheaterServiceImpl implements TheaterService{

	@Autowired
	TheaterDAO theaterDAO;

	@Override
	public int theaterInsert(TheaterDTO theaterDTO) {
		return theaterDAO.theaterInsert(theaterDTO);
	}

	@Override
	public int theaterModify(TheaterDTO theaterDTO) {
		return theaterDAO.theaterModify(theaterDTO);
	}

	@Override
	public int theaterDelete(int theater_code) {
		return theaterDAO.theaterDelete(theater_code);
	}

	@Override
	public TheaterDTO theaterView(int theater_code) {
		return theaterDAO.theaterView(theater_code);
	}

	@Override
	public ArrayList<TheaterDTO> theaterList(int startNum, int endNum) {
		return (ArrayList<TheaterDTO>)theaterDAO.theaterList(startNum, endNum);
	}

	@Override
	public void updateHit(int theater_code) {
		return;
		
	}

	@Override
	public int getTotalA() {
		return theaterDAO.getTotalA();
	}
	
	
	
}
