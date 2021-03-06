package memberReserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import memberReserve.bean.MemberReserveDTO;
import memberReserve.bean.MemberReserveListDTO;
import memberReserve.dao.MemberReserveDAO;

@Service
public class MemberReserveService {
	@Autowired
	MemberReserveDAO memberReserveDAO;
	
	public ArrayList<Integer> getReserveCodes(String reserve_id, int startNum, int endNum) {
		return (ArrayList<Integer>)memberReserveDAO.getReserveCodes(reserve_id, startNum, endNum);
	}

	public int getTotalVal(String reserve_id) {
		return memberReserveDAO.getTotalVal(reserve_id);
	}
	
	public MemberReserveListDTO getAllReserveList(int reserve_code) {
		return memberReserveDAO.getAllReserveList(reserve_code);
	}
	
	public int countSeats(int reserve_code) {
		return memberReserveDAO.countSeats(reserve_code);
	}
	
	public MemberReserveDTO getSeats(int reserve_code) {
		return memberReserveDAO.getSeats(reserve_code);
	}
	
	public int memReserveCancel(int reserve_code) {
		return memberReserveDAO.memReserveCancel(reserve_code);
	}
	
	public ArrayList<Integer> getCancelCodes(String reserve_id, int startNum, int endNum) {
		return (ArrayList<Integer>)memberReserveDAO.getCancelCodes(reserve_id, startNum, endNum);
	}
	
	public int getTotalCancel(String reserve_id) {
		return memberReserveDAO.getTotalCancel(reserve_id);
	}
	
	
	// 내가 본 영화
	public int getTotalWatched(String reserve_id) {
		return memberReserveDAO.getTotalWatched(reserve_id);
	}
	
	public ArrayList<Integer> getWatchedCodes(String reserve_id, int startNum, int endNum) {
		return (ArrayList<Integer>)memberReserveDAO.getWatchedCodes(reserve_id, startNum, endNum);
	}

}
