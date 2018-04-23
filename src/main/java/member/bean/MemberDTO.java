package member.bean;

import java.util.Date;

public class MemberDTO {
	private String member_id;
	private String member_name;
	private String nick_name;
	private String member_pwd;
	private String member_birth; // 자료형 Date -> String
	private String member_email;
	private String member_agency;
	private String member_phone;
	private int saving_point;
	private Date join_date;
	private char member_grade;
	private String member_gender;
	private String profile_img_addr;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_agency() {
		return member_agency;
	}
	public void setMember_agency(String member_agency) {
		this.member_agency = member_agency;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getSaving_point() {
		return saving_point;
	}
	public void setSaving_point(int saving_point) {
		this.saving_point = saving_point;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public char getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(char member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getProfile_img_addr() {
		return profile_img_addr;
	}
	public void setProfile_img_addr(String profile_img_addr) {
		this.profile_img_addr = profile_img_addr;
	}
}
