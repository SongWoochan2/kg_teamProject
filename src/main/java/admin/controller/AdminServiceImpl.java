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
}
