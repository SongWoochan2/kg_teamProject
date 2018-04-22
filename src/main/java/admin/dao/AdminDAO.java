package admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.bean.AdminDTO;
import admin.bean.AdminRequestDTO;

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
	public int adminRequest(AdminRequestDTO adminRequestDTO) {
		return sqlSession.insert("adminMapper.adminRequest",adminRequestDTO);
	}
	public List<AdminRequestDTO> adminRequestList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("adminMapper.adminRequestList", map);
	}
	public int getTotal() {
		return sqlSession.selectOne("adminMapper.getTotal");
	}
	public AdminRequestDTO adminRequestInfo(int admin_request_code) {
		return sqlSession.selectOne("adminMapper.adminRequestInfo", admin_request_code);
	}
	public int adminRequestDelete(int admin_request_code) {
		return sqlSession.delete("adminMapper.adminRequestDelete",admin_request_code);
	}
	public AdminDTO adminIdCheck(String admin_id) {
		return sqlSession.selectOne("adminMapper.adminCheck", admin_id);
	}
}
