package admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.bean.AdminDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		return sqlSession.selectOne("adminMapper.adminLogin", adminDTO);
	}
	public int adminEnroll(AdminDTO adminDTO) {
		return sqlSession.insert("adminMapper.adminEnroll", adminDTO);
	}
}
