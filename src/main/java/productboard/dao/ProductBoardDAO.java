package productboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productboard.bean.ProductBoardDTO;

@Repository
public class ProductBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ProductBoardDTO> productboardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.boardMapper.productboardList", map);
	}
	
	// 상품 전체 갯수 조회
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.boardMapper.getTotalA");
	}
	
	// 상품 상세보기
	public ProductBoardDTO productboardView(int product_code) {
		return sqlSession.selectOne("mybatis.boardMapper.productboardView",product_code);
	}	
	
	// 상품 등록
	public int productboardWrite(ProductBoardDTO productboardDTO) {
		return sqlSession.insert("mybatis.boardMapper.productboardWrite",productboardDTO);
	}
	
	// 상품 삭제
	public int productboardDelete(int product_code) {
		return sqlSession.delete("mybatis.boardMapper.productboardDelete",product_code);
	}
	
	// 상품 수정
	public int productboardModify(ProductBoardDTO productboardDTO) {
		return sqlSession.update("mybatis.boardMapper.productboardModify", productboardDTO);
	}
}













