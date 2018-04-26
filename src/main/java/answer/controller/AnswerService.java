package answer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import answer.bean.AnswerDTO;
import answer.dao.AnswerDAO;
import inquiry.bean.InquiryDTO;


@Service
public class AnswerService {
	
	@Autowired
	private AnswerDAO answerDAO;
	
	public int answer(AnswerDTO answerDTO) {
		return answerDAO.answer(answerDTO);
	}
	
	public List<AnswerDTO> answerList(int startNum, int endNum){
		return answerDAO.answerList(startNum, endNum);
	}
	
	public AnswerDTO answerView(int answer_code) {
		return answerDAO.answerView(answer_code);
	}
	
	public int getTotalA() {
		return answerDAO.getTotalA();
	}
	
}
