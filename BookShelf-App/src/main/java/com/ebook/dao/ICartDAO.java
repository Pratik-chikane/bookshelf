package com.ebook.dao;

import java.util.List;

import com.ebook.entity.Cart;

public interface ICartDAO {
	public boolean addToCart(Cart c);

	public List<Cart> getBookByUser(int userId);

	public boolean deleteBook(int bid, int uid, int cid);
}
