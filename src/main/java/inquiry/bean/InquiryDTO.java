package inquiry.bean;

public class InquiryDTO {
	private int inquiry_code;
	private String inquiry_id;
	private String inquiry_type;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_file;
	private int inquiry_status;
	private String inquiry_date;
	
	
	
	
	public int getInquiry_code() {
		return inquiry_code;
	}


	


	public void setInquiry_code(int inquiry_code) {
		this.inquiry_code = inquiry_code;
	}




	public String getInquiry_id() {
		return inquiry_id;
	}




	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}




	public String getInquiry_type() {
		return inquiry_type;
	}




	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}




	public String getInquiry_title() {
		return inquiry_title;
	}




	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}




	public String getInquiry_content() {
		return inquiry_content;
	}




	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}




	public String getInquiry_file() {
		return inquiry_file;
	}




	public void setInquiry_file(String inquiry_file) {
		this.inquiry_file = inquiry_file;
	}




	public int getInquiry_status() {
		return inquiry_status;
	}




	public void setInquiry_status(int inquiry_status) {
		this.inquiry_status = inquiry_status;
	}




	public String getInquiry_date() {
		return inquiry_date;
	}




	public void setInquiry_date(String inquiry_date) {
		this.inquiry_date = inquiry_date;
	}




	@Override
	public String toString() {
		return "InquiryDTO [inquiry_code=" + inquiry_code + ", inquiry_id=" + inquiry_id + ", inquiry_type="
				+ inquiry_type + ", inquiry_title=" + inquiry_title + ", inquiry_content=" + inquiry_content
				+ ", inquiry_file=" + inquiry_file + ", inquiry_status=" + inquiry_status + ", inquiry_date="
				+ inquiry_date + "]";
	}
}
