package productboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import productboard.bean.ProductBoardDTO;
import productpay.bean.ProductPayDTO;
import resource.provider.ResourceProvider;

@Controller
public class ProductBoardController {
	@Autowired
	private ProductBoardService productboardService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value="/admin/productboard/productboardModifyForm.do")
	public ModelAndView handleRequest8(HttpServletRequest request) {

		int product_code = Integer.parseInt(request.getParameter("product_code"));
		
		ProductBoardDTO productBoardDTO = productboardService.productboardView(product_code);
		System.out.println(productBoardDTO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("productboardDTO", productBoardDTO);
		modelAndView.setViewName("productboardModifyForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/productboard/productboardDelete.do")
	public ModelAndView handleRequest(HttpServletRequest request) {
		System.out.println("상품 삭제 처리");
		
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		
		String filePath = resourceProvider.getPath("image/productStorage");
		String filename = request.getParameter("product_type_addr");
		
		int su = productboardService.productboardDelete(product_code);
		
		File file = new File(filePath+filename);
		
		if(file.exists() == true){
			
			file.delete();
			
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("productboardDelete.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/productboard/productboardList.do")
	public ModelAndView handleRequest1(HttpServletRequest request) {
		System.out.println("상품 목록 처리");
		// 1. 사용자 입력 정보 추출
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 2. DB 연동 처리	
		int endNum = pg*5;				// 1 * 5 = 5
		int startNum = endNum-4;		// 5 - 4 = 1
		
		ArrayList<ProductBoardDTO> list = productboardService.productboardList(startNum, endNum);
		
		// 페이징 처리
		int totalA = productboardService.getTotalA();	// 총글수 (Total Article number)
		int totalP = (totalA+4) / 5;					// 총페이지수
		
		int startPage = (pg-1)/3*3+1;			// (2-1)/3*3+1 = 1
		int endPage = startPage + 2;			// 1 + 2 = 3
		if(totalP < endPage) endPage = totalP;	
		
		// 3. 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("productboardList.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/productboard/productboardView.do")
	public ModelAndView handleRequest3(HttpServletRequest request) {
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		ProductBoardDTO productboardDTO = productboardService.productboardView(product_code);
		
		// 3. 검색 결과를 request에 저장하고 상세 화면으로 이동한다.	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("productboardDTO", productboardDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("productboardView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/productboard/productboardWrite.do", method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	public ModelAndView handleRequest4(HttpServletRequest request, MultipartFile img) {
		System.out.println("상품 등록 처리");
		
		String filePath = resourceProvider.getPath("image/productStorage");
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ProductBoardDTO productboardDTO = new ProductBoardDTO();
		
		String product_name = request.getParameter("product_name");
		int product_cost = Integer.parseInt(request.getParameter("product_cost"));			
		String product_type = request.getParameter("product_type");
		
		productboardDTO.setProduct_name(product_name);
		productboardDTO.setProduct_cost(product_cost);
		productboardDTO.setProduct_type(product_type);
		productboardDTO.setProduct_photo_addr(fileName);
		
		int su = productboardService.productboardWrite(productboardDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("su", su);
		
		modelAndView.setViewName("productboardWrite.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/admin/productboard/productboardModify.do", method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	public ModelAndView handleRequest7(HttpServletRequest request, MultipartFile img) {
		System.out.println("상품 수정 처리");
		
		String filePath = resourceProvider.getPath("image/productStorage");
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String product_name = request.getParameter("product_name");
		int product_cost = Integer.parseInt(request.getParameter("product_cost"));			
		String product_type = request.getParameter("product_type");
		
		ProductBoardDTO productboardDTO = new ProductBoardDTO();
		productboardDTO.setProduct_code(product_code);
		productboardDTO.setProduct_name(product_name);
		productboardDTO.setProduct_cost(product_cost);
		productboardDTO.setProduct_type(product_type);
		productboardDTO.setProduct_photo_addr(fileName);
		
		int su = productboardService.productboardModify(productboardDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("productboardModify.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/productboard/productboardWriteForm.do")
	public ModelAndView handleRequest5(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productboardWriteForm.jsp");
		return modelAndView;
	}
	
	
	
	//store part-------------------------------------------------------------------
	
	@RequestMapping(value="/main/store/store.do")
	public ModelAndView handleRequest_1(HttpServletRequest request) {
		System.out.println("스토어 목록 처리");
		// 1. 사용자 입력 정보 추출
		String type = request.getParameter("type");
		System.out.println(type);
		ArrayList<ProductBoardDTO> typeList = productboardService.typeList(type);
		
		// 2. 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("typeList",typeList);
		modelAndView.addObject("type", type);
		modelAndView.setViewName("store.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/store/productView.do")
	public ModelAndView handleRequest_2(HttpServletRequest request) {
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		
		ProductBoardDTO productboardDTO = productboardService.productboardView(product_code);
		
		// 3. 검색 결과를 request에 저장하고 상세 화면으로 이동한다.	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("productboardDTO", productboardDTO);
		modelAndView.setViewName("productView.jsp");
		return modelAndView;
	}
	
	//pay part-----------------------------------------------------------------------------수정중;;
	
	@RequestMapping(value="/main/store/productPay.do")
	public ModelAndView handleRequest_product_pay1(HttpServletRequest request) {
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		String member_id = "홍길동";
		
		ProductBoardDTO productboardDTO = productboardService.productboardView(product_code);
		/*HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");*/
	
		
		// 3. 검색 결과를 request에 저장하고 상세 화면으로 이동한다.	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("productboardDTO", productboardDTO);
		modelAndView.addObject("member_id", member_id);
		modelAndView.setViewName("productPay.jsp");
		return modelAndView;
	}
}
