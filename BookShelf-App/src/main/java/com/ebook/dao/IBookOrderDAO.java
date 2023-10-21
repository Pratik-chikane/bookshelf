package com.ebook.dao;

import java.util.List;

import com.ebook.entity.BookOrder;

public interface IBookOrderDAO {

	public boolean saveOrder(List<BookOrder> order);
	
	public List<BookOrder> userOrders(String email);

	public List<BookOrder> allOrdersAdmin();

}
