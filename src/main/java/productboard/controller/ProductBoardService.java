package productboard.controller;

import java.util.ArrayList;

import productboard.bean.ProductBoardDTO;

public interface ProductBoardService {
	
	// 상품 등록
	int productboardWrite(ProductBoardDTO productboardDTO);
	
	// 상품 수정
	int productboardModify(ProductBoardDTO productboardDTO);
	
	// 상품 삭제
	int productboardDelete(int product_code);
	
	// 상품 상세 조회
	ProductBoardDTO productboardView(int product_code);
	
	// 상품 목록 조회
	ArrayList<ProductBoardDTO> productboardList(int startNum, int endNum);
	
	// 상품 게시판 상품 갯수 조회
	int getTotalA();
	
}
