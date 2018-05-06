package productpay.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productpay.bean.ProductPayDTO;
import productpay.bean.ProductPayListDTO;
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

	@Override
	public List<ProductPayListDTO> getPayList(String pay_id) {
		return productpayDAO.getPayList(pay_id);
	}

	@Override
	public int getTotalUsable(String pay_id) {
		return productpayDAO.getTotalUsable(pay_id);
	}

	@Override
	public int getTotalVal(String pay_id) {
		return productpayDAO.getTotalVal(pay_id);
	}

	@Override
	public List<ProductPayListDTO> getAllPayList(String pay_id, int startNum, int endNum) {
		return productpayDAO.getAllPayList(pay_id, startNum, endNum);
	}

	@Override
	public int productPayCancle(int product_pay_code) {
		return productpayDAO.productPayCancle(product_pay_code);
	}
	
}
