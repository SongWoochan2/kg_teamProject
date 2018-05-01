package productpay.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productboard.bean.ProductBoardDTO;
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

	@Override
	public ArrayList<ProductPayDTO> productpayList(int startNum, int endNum) {
		return (ArrayList<ProductPayDTO>) productpayDAO.productpayList(startNum, endNum);
	}

	@Override
	public int getTotal_A() {
		return productpayDAO.getTotal_A();
	}

}
