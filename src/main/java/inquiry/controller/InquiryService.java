package inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inquiry.bean.InquiryDTO;
import inquiry.dao.InquiryDAO;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryDAO inquiryDAO;
	
	public int inquiryWrite(InquiryDTO inquiryDTO) {
		System.out.println("inquiry_type :"+inquiryDTO.getInquiry_type());
		return inquiryDAO.inquiryWrite(inquiryDTO);
	}
	
	/*public int inquiryModify(InquiryDTO inquiryDTO) {
		return inquiryDAO.inquiryModify(inquiryDTO);
	}
	
	public List<InquiryDTO> inquiryList(int startNum, int endNum){
		return inquiryDAO.inquiryList(startNum, endNum);
	}
	
	public InquiryDTO inquiryView(int seq) {
		return inquiryDAO.inquiryView(seq);
	}
	
	public int updateHit(int seq) {
		return inquiryDAO.updateHit(seq);
	}
	
	public int getTotalA() {
		return inquiryDAO.getTotalA();
	}
	
	public int inquiryDelete(int seq) {
		return inquiryDAO.inquiryDelete(seq);
	}*/

}
