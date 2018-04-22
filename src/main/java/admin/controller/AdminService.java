package admin.controller;

import java.util.ArrayList;

import admin.bean.AdminDTO;
import admin.bean.AdminRequestDTO;

public interface AdminService {
	//로그인
	AdminDTO adminLogin(AdminDTO adminDTO);
	int adminRequest(AdminRequestDTO adminRequestDTO);
	ArrayList<AdminRequestDTO> adminRequestList(int startNum, int endNum);
	int adminEnroll(AdminDTO adminDTO);
	int getTotal();
	int adminRequestDelete(int admin_request_code);
	AdminRequestDTO adminRequestInfo(int admin_request_code);
	AdminDTO adminIdCheck(String admin_id);
}
