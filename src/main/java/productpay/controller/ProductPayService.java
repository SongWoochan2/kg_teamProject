package productpay.controller;

import java.util.ArrayList;
import java.util.List;

import productpay.bean.ProductPayDTO;
import productpay.bean.ProductPayListDTO;

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
		
	public List<ProductPayListDTO> getPayList(String pay_id);
	public int getTotalVal(String pay_id);
	public List<ProductPayListDTO> getAllPayList(String pay_id, int startNum, int endNum);
	public int productPayCancle(int product_pay_code);
	public int getTotalUsable(String pay_id) ;
}
