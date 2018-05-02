package productpay.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

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
		
		String pay_type=null;
		if(buy_phone.equals(gift_phone1)) {
			pay_type = "pay";
		}else{
			pay_type="gift";
		}
		
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
	
	
	
	//-----------------------------------------------------------------------------------------------
	
	/*
	// 결제 취소--------미완
	@RequestMapping(value="")
	public ModelAndView handleRequest7(HttpServletRequest request) {
		System.out.println("결제 취소 처리");
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ProductPayDTO productpayDTO = new ProductPayDTO();
		
		HttpSession session = request.getSession();
		String pay_id = (String)session.getAttribute("memId");
		int product_pay_code = Integer.parseInt(request.getParameter("product_pay_code"));
		
		productpayDTO.setPay_id(pay_id);
		
		int su = productpayService.productpayCancle(productpayDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("");
		return modelAndView;
	}
	*/
	
	// MyPage 결제 목록
	@RequestMapping(value="")
	public ModelAndView handleRequest_payList(HttpServletRequest request) {
		System.out.println("결제 목록 처리");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;		
		int startNum = endNum-4;
		
		ArrayList<ProductPayDTO> list = productpayService.productpayList(startNum, endNum);
		
		// 페이징 처리
		int totalA = productpayService.getTotal_A();	
		int totalP = (totalA+4) / 5;					
		
		int startPage = (pg-1)/3*3+1;			
		int endPage = startPage + 2;			
		if(totalP < endPage) endPage = totalP;	
		
		// 3. 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("");
		return modelAndView;
	}
}
