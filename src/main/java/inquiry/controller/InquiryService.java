package inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inquiry.bean.InquiryDTO;
import inquiry.dao.InquiryDAO;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryDAO inquiryDAO;
	
	public int inquiryWrite(InquiryDTO inquiryDTO) {
		return inquiryDAO.inquiryWrite(inquiryDTO);
	}
	
	public List<InquiryDTO> inquiryList(int startNum, int endNum){
		return inquiryDAO.inquiryList(startNum, endNum);
	}
	
	public InquiryDTO inquiryView(int seq) {
		return inquiryDAO.inquiryView(seq);
	}
	
	public int getTotalA() {
		return inquiryDAO.getTotalA();
	}
	
	public int inquiryDelete(int seq) {
		return inquiryDAO.inquiryDelete(seq);
	}

}
