package productpay.controller;

import productpay.bean.ProductPayDTO;

public interface ProductPayService {
	
	// 상품 등록
	int productPayComplete(ProductPayDTO productpayDTO);
	
	
}
