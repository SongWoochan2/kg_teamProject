package admin.controller;

import java.util.ArrayList;

import admin.bean.AdminDTO;

public interface AdminService {
	//로그인
	AdminDTO adminLogin(AdminDTO adminDTO);
	int adminEnroll(AdminDTO adminDTO);
}
