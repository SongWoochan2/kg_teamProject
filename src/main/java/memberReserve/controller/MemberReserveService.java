package memberReserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public ArrayList<Integer> getCancleCodes(String reserve_id, int startNum, int endNum) {
		return (ArrayList<Integer>)memberReserveDAO.getCancleCodes(reserve_id, startNum, endNum);
	}
	
	public int getTotalCancle(String reserve_id) {
		return memberReserveDAO.getTotalCancle(reserve_id);
	}
}
