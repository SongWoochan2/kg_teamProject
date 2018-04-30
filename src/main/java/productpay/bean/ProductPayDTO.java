package productpay.bean;

public class ProductPayDTO {
	private int product_pay_code;
	private String pay_id;
	private int product_code;
	private String buy_phone;
	private String gift_phone1;
	private String gift_phone2;
	private String gift_phone3;
	private String pay_type;
	private String pay_time;
	private String pay_cancle_able;
	private int order_num1;
	private int order_num2;
	private int order_num3;
	
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
	public String getBuy_phone() {
		return buy_phone;
	}
	public void setBuy_phone(String buy_phone) {
		this.buy_phone = buy_phone;
	}
	public String getGift_phone1() {
		return gift_phone1;
	}
	public void setGift_phone1(String gift_phone1) {
		this.gift_phone1 = gift_phone1;
	}
	public String getGift_phone2() {
		return gift_phone2;
	}
	public void setGift_phone2(String gift_phone2) {
		this.gift_phone2 = gift_phone2;
	}
	public String getGift_phone3() {
		return gift_phone3;
	}
	public void setGift_phone3(String gift_phone3) {
		this.gift_phone3 = gift_phone3;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_time() {
		return pay_time;
	}
	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}
	public String getPay_cancle_able() {
		return pay_cancle_able;
	}
	public void setPay_cancle_able(String pay_cancle_able) {
		this.pay_cancle_able = pay_cancle_able;
	}
	public int getOrder_num1() {
		return order_num1;
	}
	public void setOrder_num1(int order_num1) {
		this.order_num1 = order_num1;
	}
	public int getOrder_num2() {
		return order_num2;
	}
	public void setOrder_num2(int order_num2) {
		this.order_num2 = order_num2;
	}
	public int getOrder_num3() {
		return order_num3;
	}
	public void setOrder_num3(int order_num3) {
		this.order_num3 = order_num3;
	}
	@Override
	public String toString() {
		return "ProductPayDTO [product_pay_code=" + product_pay_code + ", pay_id=" + pay_id + ", product_code="
				+ product_code + ", buy_phone=" + buy_phone + ", gift_phone1=" + gift_phone1 + ", gift_phone2="
				+ gift_phone2 + ", gift_phone3=" + gift_phone3 + ", pay_type=" + pay_type + ", pay_time=" + pay_time
				+ ", pay_cancle_able=" + pay_cancle_able + ", order_num1=" + order_num1 + ", order_num2=" + order_num2
				+ ", order_num3=" + order_num3 + "]";
	}
}
