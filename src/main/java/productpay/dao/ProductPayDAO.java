package productpay.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productboard.bean.ProductBoardDTO;
import productpay.bean.ProductPayDTO;

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
}













