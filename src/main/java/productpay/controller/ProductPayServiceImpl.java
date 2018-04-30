package productpay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productpay.bean.ProductPayDTO;
import productpay.dao.ProductPayDAO;

@Service //controller어노테이션
public class ProductPayServiceImpl implements ProductPayService{
	@Autowired
	ProductPayDAO productpayDAO;

	@Override
	public int productPayComplete(ProductPayDTO productpayDTO) {
		return productpayDAO.productpayComplete(productpayDTO);
	}

}
