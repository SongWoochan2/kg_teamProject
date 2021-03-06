package showPlace.bean;

public class SeatVO {
	
	private int show_place_code;
	private int seat_type_code;
	private int x_index;
	private String y_index;
	
	public int getShow_place_code() {
		return show_place_code;
	}
	public void setShow_place_code(int show_place_code) {
		this.show_place_code = show_place_code;
	}
	public int getSeat_type_code() {
		return seat_type_code;
	}
	public void setSeat_type_code(int seat_type_code) {
		this.seat_type_code = seat_type_code;
	}
	public int getX_index() {
		return x_index;
	}
	public void setX_index(int x_index) {
		this.x_index = x_index;
	}
	public String getY_index() {
		return y_index;
	}
	public void setY_index(String y_index) {
		this.y_index = y_index;
	}
	@Override
	public String toString() {
		return "SeatVO [show_place_code=" + show_place_code + ", seat_type_code=" + seat_type_code + ", x_index="
				+ x_index + ", y_index=" + y_index + "]";
	}


}
