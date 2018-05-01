package answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import answer.bean.AnswerDTO;
import answer.dao.AnswerDAO;


@Service
public class AnswerService {
	
	@Autowired
	private AnswerDAO answerDAO;
	
	public int answerInsert(AnswerDTO answerDTO) {
		return answerDAO.answerInsert(answerDTO);
	}
	public AnswerDTO answerView(int inquiry_code) {
		return answerDAO.answerView(inquiry_code);
	}
	
}
