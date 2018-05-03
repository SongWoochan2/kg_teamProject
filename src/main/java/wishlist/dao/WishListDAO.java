package wishlist.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishListDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int wishlistDelete(int select_code) {
		return sqlSession.delete("mybatis.wishlistMapper.wishlistDelete", select_code);
	}
	
	public int wishlistSelecte(int select_code) {
		return sqlSession.delete("mybatis.wishlistMapper.wishlistSelecte", select_code);
	}
	  
}
