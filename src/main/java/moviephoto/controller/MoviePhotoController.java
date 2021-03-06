package moviephoto.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import movie.bean.MoviePage;
import moviephoto.bean.MoviePhotoDTO;
import resource.provider.ResourceProvider;


@Controller
public class MoviePhotoController {
	@Autowired
	private MoviePhotoService moviePhotoService;
	@Autowired
	private ResourceProvider resourceProvider;
	
	@RequestMapping(value = "/admin/moviePhoto/moviePhoto.do")
	public ModelAndView moviePhotoList(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		System.out.println("photo pg : " + page);
		int endNum = page * 9;
		int startNum = endNum - 8;
		ArrayList<MoviePhotoDTO> list = moviePhotoService.moviePhotoList(startNum, endNum, movie_code);
		int totalA = moviePhotoService.getTotalA(movie_code);
		int totalPage = (totalA + 8) / 9;
		int startPage = (page-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(totalPage < endPage) endPage = totalPage;
		
		
		MoviePage moviePage = new MoviePage();
		moviePage.setEndPage(endPage);
		moviePage.setStartPage(startPage);
		moviePage.setTotalPage(totalPage);
		moviePage.setPg(page);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("moviePage", moviePage);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("moviePhoto.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/moviePhoto/moviePhotoInsertForm.do")
	public ModelAndView moviePhotoInsertForm(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("moviePhotoInsertForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/moviePhoto/moviePhotoInsert.do", method = RequestMethod.POST)
	public ModelAndView moviePhotoInsert(HttpServletRequest request, HttpServletResponse response, MultipartFile movie_photo_addr) {
		System.out.println("movie_code : " + request.getParameter("movie_code"));
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		MoviePhotoDTO moviePhotoDTO = new MoviePhotoDTO();
		moviePhotoDTO.setMovie_code(movie_code);
		moviePhotoDTO.setMovie_photo_name(request.getParameter("movie_photo_name"));
//		String realFolder = "C:/Users/woghk/Desktop/자료/학원/201712_JAVA취업반/Team Project/2/TEAM/src/main/webapp/image/storage/moviephoto/";
		String realFolder = resourceProvider.getPath("image/storage/moviephoto/");
		String originalFileName = movie_photo_addr.getOriginalFilename();
		// storage 폴더에 실제 저장되어지는 파일 이름
		File file = new File(realFolder, originalFileName);	
		
		try {
			FileCopyUtils.copy(movie_photo_addr.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		moviePhotoDTO.setMovie_photo_addr(originalFileName);
		int result = moviePhotoService.moviePhotoInsert(moviePhotoDTO);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("moviePhotoInsert.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/moviePhoto/moviePhotoDelete.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView moviePhotoDelete(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("pg"));
		int movie_photo_code = Integer.parseInt(request.getParameter("movie_photo_code"));
		int movie_code = Integer.parseInt(request.getParameter("movie_code"));
		int result = moviePhotoService.moviePhotoDelete(movie_photo_code);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", page);
		modelAndView.addObject("movie_code", movie_code);
		modelAndView.setViewName("moviePhotoDelete.jsp");
		return modelAndView;
	}
}
