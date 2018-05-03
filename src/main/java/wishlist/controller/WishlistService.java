package wishlist.controller;

import java.util.ArrayList;

import wishlist.bean.WishListDTO;

public interface WishlistService {
	/*// 위시리스트 코드꺼내오기
	ArrayList<WishListDTO> wishlistSelecte(int select_code);*/
	// 위시리스트 삭제
	public int wishlistDelete(int select_code);
}
