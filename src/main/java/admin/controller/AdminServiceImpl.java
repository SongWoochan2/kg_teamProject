package admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.bean.AdminRequestDTO;
import admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		return adminDAO.adminLogin(adminDTO);
	}

	@Override
	public int adminEnroll(AdminDTO adminDTO) {
		return adminDAO.adminEnroll(adminDTO);
	}

	@Override
	public int adminRequest(AdminRequestDTO adminRequestDTO) {
		return adminDAO.adminRequest(adminRequestDTO);
	}

	@Override
	public ArrayList<AdminRequestDTO> adminRequestList(int startNum, int endNum) {
		return (ArrayList<AdminRequestDTO>) adminDAO.adminRequestList(startNum, endNum);
	}

	@Override
	public int getTotal() {
		return adminDAO.getTotal();
	}
	
	@Override
	public int adminRequestDelete(int admin_request_code) {
		return adminDAO.adminRequestDelete(admin_request_code);
	}

	@Override
	public AdminRequestDTO adminRequestInfo(int admin_request_code) {
		return adminDAO.adminRequestInfo(admin_request_code);
	}

	@Override
	public AdminDTO adminIdCheck(String admin_id) {
		return adminDAO.adminIdCheck(admin_id);
	}

	@Override
	public int adminPwdModify(String admin_id, String new_admin_pwd) {
		return adminDAO.adminPwdModify(admin_id, new_admin_pwd);
	}
}
