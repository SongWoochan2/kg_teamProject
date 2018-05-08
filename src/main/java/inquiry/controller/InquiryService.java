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
	
	public int inquiryAll(String inquiry_id) {
		return inquiryDAO.inquiryAll(inquiry_id);
	}
	public int inquiryModify(InquiryDTO inquiryDTO) {
		return inquiryDAO.inquiryModify(inquiryDTO);
	}
	
	public int inquiryStatus(int inquiry_code) {
		System.out.println(2);
		return inquiryDAO.inquiryStatus(inquiry_code);
	}
	
	public List<InquiryDTO> inquiryListAdmin(int startNum, int endNum){
		return inquiryDAO.inquiryListAdmin(startNum, endNum);
	}
	
	public List<InquiryDTO> inquiryListMember(int startNum, int endNum, String inquiry_id){
		return inquiryDAO.inquiryListMember(startNum, endNum, inquiry_id);
	}
	
	public InquiryDTO inquiryView(int inquiry_code) {
		return inquiryDAO.inquiryView(inquiry_code);
	}
	
	public int getTotalA(String inquiry_id) {
		return inquiryDAO.getTotalA(inquiry_id);
	}
	
	public int inquiryDelete(int inquiry_code) {
		return inquiryDAO.inquiryDelete(inquiry_code);
	}

}
