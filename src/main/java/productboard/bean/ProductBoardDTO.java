package productboard.bean;

public class ProductBoardDTO {
	private int product_code;
	private String product_name;
	private int product_cost;
	private String product_type;
	private String product_photo_addr;
	
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_cost() {
		return product_cost;
	}
	public void setProduct_cost(int product_cost) {
		this.product_cost = product_cost;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_photo_addr() {
		return product_photo_addr;
	}
	public void setProduct_photo_addr(String product_photo_addr) {
		this.product_photo_addr = product_photo_addr;
	}
	@Override
	public String toString() {
		return "ProductBoardDTO [product_code=" + product_code + ", product_name=" + product_name + ", product_cost="
				+ product_cost + ", product_type=" + product_type + ", product_photo_addr=" + product_photo_addr + "]";
	}
	
	
}
