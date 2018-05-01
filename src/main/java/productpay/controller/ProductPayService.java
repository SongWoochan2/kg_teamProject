package productpay.controller;

import java.util.ArrayList;

import productpay.bean.ProductPayDTO;

public interface ProductPayService {
	
	// 결제 완료
	int productPayComplete(ProductPayDTO productpayDTO);
	
	//-------------------------------------------------------------------
	
	// 결제 리스트
	ArrayList<ProductPayDTO> productpayList(int startNum, int endNum);
	// 결제 리스트 갯수
	int getTotal_A();
	// 결제 취소
	/*int productpayCancle(ProductPayDTO productpayDTO);*/
}
