package productpay.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productpay.bean.ProductPayDTO;
import productpay.bean.ProductPayListDTO;

@Repository
public class ProductPayDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 결제 등록
	public int productpayComplete(ProductPayDTO productpayDTO) {
		return sqlSession.insert("mybatis.boardMapper.productpayComplete",productpayDTO);
	}
	
	//-------------------------------------------------------------------
	// 결제 리스트
	public List<ProductPayDTO> productpayList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.boardMapper.productpayList", map);
	}
	
	// 결제 리스트 갯수
	public int getTotal_A() {
		return sqlSession.selectOne("mybatis.boardMapper.getTotal_A");
	}
	


	

	
	public List<ProductPayListDTO> getPayList(String pay_id) {
		return sqlSession.selectList("mybatis.boardMapper.getPayList", pay_id);
	}
	
	public int getTotalUsable(String pay_id) {
		return sqlSession.selectOne("mybatis.boardMapper.getTotalUsable", pay_id);
	}
	
	public int getTotalVal(String pay_id) {
		return sqlSession.selectOne("mybatis.boardMapper.getTotalVal", pay_id);
	}
	
	public List<ProductPayListDTO> getAllPayList(String pay_id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("pay_id", pay_id);
		return sqlSession.selectList("mybatis.boardMapper.getAllPayList", map);
	}
	
	public int productPayCancle(int product_pay_code) {
		return sqlSession.update("mybatis.boardMapper.productPayCancle", product_pay_code);
	}
}













