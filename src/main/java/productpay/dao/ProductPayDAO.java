package productpay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productpay.bean.ProductPayDTO;

@Repository
public class ProductPayDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 결제 등록
	public int productpayComplete(ProductPayDTO productpayDTO) {
		return sqlSession.insert("mybatis.boardMapper.productpayComplete",productpayDTO);
	}
	
}













