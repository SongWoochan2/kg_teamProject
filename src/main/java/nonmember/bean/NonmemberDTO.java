package nonmember.bean;

import java.util.Date;

public class NonmemberDTO {
	private int nonmember_code;
	private String nonmember_name;
	private Date nonmember_birth;
	private String nonmember_pwd;
	private String nonmember_phone;
	private Date nonmember_enroll_date;
	
	public NonmemberDTO() {
	}

	public int getNonmember_code() {
		return nonmember_code;
	}

	public void setNonmember_code(int nonmember_code) {
		this.nonmember_code = nonmember_code;
	}

	public String getNonmember_name() {
		return nonmember_name;
	}

	public void setNonmember_name(String nonmember_name) {
		this.nonmember_name = nonmember_name;
	}

	public Date getNonmember_birth() {
		return nonmember_birth;
	}

	public void setNonmember_birth(Date nonmember_birth) {
		this.nonmember_birth = nonmember_birth;
	}

	public String getNonmember_pwd() {
		return nonmember_pwd;
	}

	public void setNonmember_pwd(String nonmember_pwd) {
		this.nonmember_pwd = nonmember_pwd;
	}

	public String getNonmember_phone() {
		return nonmember_phone;
	}

	public void setNonmember_phone(String nonmember_phone) {
		this.nonmember_phone = nonmember_phone;
	}

	public Date getNonmember_enroll_date() {
		return nonmember_enroll_date;
	}

	public void setNonmember_enroll_date(Date nonmember_enroll_date) {
		this.nonmember_enroll_date = nonmember_enroll_date;
	}
}
