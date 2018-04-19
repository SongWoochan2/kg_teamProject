package productboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productboard.bean.ProductBoardDTO;
import productboard.dao.ProductBoardDAO;

@Service //controller어노테이션
public class ProductBoardServiceImpl implements ProductBoardService{
	@Autowired
	ProductBoardDAO productboardDAO;

	@Override
	public int productboardWrite(ProductBoardDTO productboardDTO) {
		return productboardDAO.productboardWrite(productboardDTO);
	}

	@Override
	public int productboardModify(ProductBoardDTO productboardDTO) {
		return productboardDAO.productboardModify(productboardDTO);
	}

	@Override
	public int productboardDelete(int product_code) {
		return productboardDAO.productboardDelete(product_code);
	}

	@Override
	public ProductBoardDTO productboardView(int product_code) {
		return productboardDAO.productboardView(product_code);
	}

	@Override
	public ArrayList<ProductBoardDTO> productboardList(int startNum, int endNum) {
		return (ArrayList<ProductBoardDTO>) productboardDAO.productboardList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return productboardDAO.getTotalA();
	}

}
