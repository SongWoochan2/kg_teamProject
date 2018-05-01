package productpay.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import productpay.bean.ProductPayDTO;

@Controller
public class ProductPayController {
	@Autowired
	private ProductPayService productpayService;
	
	@RequestMapping(value="/main/store/productPayComplete.do")
	public ModelAndView memberModify(HttpServletRequest request) {
		System.out.println("FGHJF");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ProductPayDTO productpayDTO = new ProductPayDTO();
		
		HttpSession session = request.getSession();
		String pay_id = (String)session.getAttribute("memId");
		
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		
		String buy_phone = request.getParameter("ctl00$bodyPlaceHolder$sender_phone1")
							+request.getParameter("ctl00$bodyPlaceHolder$sender_phone2")
							+request.getParameter("ctl00$bodyPlaceHolder$sender_phone3");
		
		String gift_phone1 = request.getParameter("ctl00$bodyPlaceHolder$receiver1_phone1")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver1_phone2")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver1_phone3");
		
		String gift_phone2 = request.getParameter("ctl00$bodyPlaceHolder$receiver2_phone1")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver2_phone2")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver2_phone3");
		
		String gift_phone3 = request.getParameter("ctl00$bodyPlaceHolder$receiver3_phone1")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver3_phone2")
							+request.getParameter("ctl00$bodyPlaceHolder$receiver3_phone3");
		
		String pay_type = "pay";
		
		String pay_cancle_able = "N";

		String order_num1_st = request.getParameter("ctl00$bodyPlaceHolder$qty1");
		String order_num2_st = request.getParameter("ctl00$bodyPlaceHolder$qty2");
		String order_num3_st = request.getParameter("ctl00$bodyPlaceHolder$qty3");
		
		int order_num1 = 0;
		int order_num2 = 0;
		int order_num3 = 0;
		
		if(order_num1_st != null && !order_num1_st.equals("")) {
			order_num1 = Integer.parseInt(order_num1_st);
		}
		if(order_num2_st != null  && !order_num2_st.equals("")) {
			order_num2 = Integer.parseInt(order_num2_st);
		}
		if(order_num3_st != null && !order_num3_st.equals("")) {
			order_num3 = Integer.parseInt(order_num3_st);
		}
		System.out.println(pay_id);
		System.out.println(product_code);
		System.out.println(buy_phone);
		System.out.println(gift_phone1);
		System.out.println(gift_phone2);
		System.out.println(gift_phone3);
		System.out.println(pay_type);
		System.out.println(pay_cancle_able);
		System.out.println(order_num1);
		System.out.println(order_num2);
		System.out.println(order_num3);
		
		productpayDTO.setPay_id(pay_id);
		productpayDTO.setProduct_code(product_code);
		productpayDTO.setBuy_phone(buy_phone);
		productpayDTO.setGift_phone1(gift_phone1);
		productpayDTO.setGift_phone2(gift_phone2);
		productpayDTO.setGift_phone3(gift_phone3);
		productpayDTO.setPay_type(pay_type); 
		productpayDTO.setPay_cancle_able(pay_cancle_able);
		productpayDTO.setOrder_num1(order_num1);
		productpayDTO.setOrder_num2(order_num2);
		productpayDTO.setOrder_num3(order_num3);

		
		int su = productpayService.productPayComplete(productpayDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("productPayComplete.jsp");
		return modelAndView;
	}
}
