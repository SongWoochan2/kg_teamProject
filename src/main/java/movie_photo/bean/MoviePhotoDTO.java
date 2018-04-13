package movie_photo.bean;

public class MoviePhotoDTO {
	private int movie_photo_code;
	private int movie_code;
	private String movie_photo_name;
	private String movie_photo_addr;
	private String upload_date;
	
	
	public int getMovie_photo_code() {
		return movie_photo_code;
	}
	public void setMovie_photo_code(int movie_photo_code) {
		this.movie_photo_code = movie_photo_code;
	}
	public int getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(int movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_photo_name() {
		return movie_photo_name;
	}
	public void setMovie_photo_name(String movie_photo_name) {
		this.movie_photo_name = movie_photo_name;
	}
	public String getMovie_photo_addr() {
		return movie_photo_addr;
	}
	public void setMovie_photo_addr(String movie_photo_addr) {
		this.movie_photo_addr = movie_photo_addr;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	
	
}
