package productpay.bean;

public class ProductPayDTO {
	private int product_pay_code;
	private String pay_id;
	private int product_code;
	private String buy_time;
	private String but_cancle_able;
	
	public int getProduct_pay_code() {
		return product_pay_code;
	}
	public void setProduct_pay_code(int product_pay_code) {
		this.product_pay_code = product_pay_code;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getBuy_time() {
		return buy_time;
	}
	public void setBuy_time(String buy_time) {
		this.buy_time = buy_time;
	}
	public String getBut_cancle_able() {
		return but_cancle_able;
	}
	public void setBut_cancle_able(String but_cancle_able) {
		this.but_cancle_able = but_cancle_able;
	}
	
	@Override
	public String toString() {
		return "ProductBoardDTO [product_pay_code=" + product_pay_code + ", pay_id=" + pay_id + ", product_code="
				+ product_code + ", buy_time=" + buy_time + ", but_cancle_able=" + but_cancle_able + "]";
	}
}
