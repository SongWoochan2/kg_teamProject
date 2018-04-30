package savingList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import savingList.bean.SavingListDTO;
import savingList.dao.SavingListDAO;

@Service
public class SavingListService {
	@Autowired
	SavingListDAO savingListDAO;

	public List<SavingListDTO> savingList(int startNum, int endNum, String saving_id) {
		return savingListDAO.savingList(startNum, endNum, saving_id);
	}
	
	public int getTotalA(String saving_id) {
		return savingListDAO.getTotalA(saving_id);
	}
}
