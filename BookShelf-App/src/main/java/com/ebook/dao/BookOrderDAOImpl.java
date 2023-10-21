package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.BookOrder;

public class BookOrderDAOImpl implements IBookOrderDAO {

	private Connection conn;

	public BookOrderDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<BookOrder> order) {
		boolean flag = false;
		try {
			String query = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment)values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(query);
			for (BookOrder b : order) {
				ps.setNString(1, b.getOrderId());
				ps.setNString(2, b.getUserName());
				ps.setNString(3, b.getEmail());
				ps.setNString(4, b.getFullAddress());
				ps.setNString(5, b.getPhno());
				ps.setNString(6, b.getBookName());
				ps.setNString(7, b.getAuthor());
				ps.setNString(8, b.getPrice());
				ps.setNString(9, b.getPaymentType());
				ps.addBatch();

			}
			int[] count = ps.executeBatch();
			conn.commit();
			flag = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookOrder> userOrders(String email) {
		List<BookOrder> orderList = new ArrayList<BookOrder>();
		BookOrder b = null;
		try {
			String query = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setNString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getNString(2));
				b.setUserName(rs.getNString(3));
				b.setEmail(rs.getNString(4));
				b.setFullAddress(rs.getNString(5));
				b.setPhno(rs.getNString(6));
				
				b.setBookName(rs.getNString(7));
				b.setAuthor(rs.getNString(8));
				b.setPrice(rs.getNString(9));
				b.setPaymentType(rs.getNString(10));
				orderList.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderList;
	}

	@Override
	public List<BookOrder> allOrdersAdmin() {
		List<BookOrder> orderList = new ArrayList<BookOrder>();
		BookOrder b = null;
		try {
			String query = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getNString(2));
				b.setUserName(rs.getNString(3));
				b.setEmail(rs.getNString(4));
				b.setFullAddress(rs.getNString(5));
				b.setPhno(rs.getNString(6));
				
				b.setBookName(rs.getNString(7));
				b.setAuthor(rs.getNString(8));
				b.setPrice(rs.getNString(9));
				b.setPaymentType(rs.getNString(10));
				orderList.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderList;
	}

	

}
