package qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.bean.QnaDTO;
import qna.dao.QnaDAO;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	
	public int qnaWrite(QnaDTO qnaDTO) {
		return qnaDAO.qnaWrite(qnaDTO);
	}
	
	public int qnaModify(QnaDTO qnaDTO) {
		return qnaDAO.qnaModify(qnaDTO);
	}
	
	public List<QnaDTO> qnaList(int startNum, int endNum){
		return qnaDAO.qnaList(startNum, endNum);
	}
	
	public QnaDTO qnaView(int qna_code) {
		return qnaDAO.qnaView(qna_code);
	}
	
	
	public int getTotalA() {
		return qnaDAO.getTotalA();
	}
	
	public int qnaDelete(int qna_code) {
		return qnaDAO.qnaDelete(qna_code);
	}

}
