package admin.bean;

public class AdminRequestDTO {
	private int admin_request_code;
	private String admin_name;
	private String admin_id;
	private String admin_pwd;
	private String request_date;
	
	public int getAdmin_request_code() {
		return admin_request_code;
	}
	public void setAdmin_request_code(int admin_request_code) {
		this.admin_request_code = admin_request_code;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	
	
}
