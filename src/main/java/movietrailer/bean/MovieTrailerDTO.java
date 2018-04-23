package movietrailer.bean;

public class MovieTrailerDTO {
	private int movie_trailer_code;
	private int movie_code;
	private String movie_trailer_name;
	private String movie_trailer_addr;
	private String upload_date;
	public int getMovie_trailer_code() {
		return movie_trailer_code;
	}
	public void setMovie_trailer_code(int movie_trailer_code) {
		this.movie_trailer_code = movie_trailer_code;
	}
	public int getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(int movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_trailer_name() {
		return movie_trailer_name;
	}
	public void setMovie_trailer_name(String movie_trailer_name) {
		this.movie_trailer_name = movie_trailer_name;
	}
	public String getMovie_trailer_addr() {
		return movie_trailer_addr;
	}
	public void setMovie_trailer_addr(String movie_trailer_addr) {
		this.movie_trailer_addr = movie_trailer_addr;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	
	
}
