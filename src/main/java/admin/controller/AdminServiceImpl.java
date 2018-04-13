package admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		System.out.println(adminDTO.getAdmin_id());
		System.out.println(adminDTO.getAdmin_pwd());
		return adminDAO.adminLogin(adminDTO);
	}

	@Override
	public int adminEnroll(AdminDTO adminDTO) {
		return adminDAO.adminEnroll(adminDTO);
	}
}
