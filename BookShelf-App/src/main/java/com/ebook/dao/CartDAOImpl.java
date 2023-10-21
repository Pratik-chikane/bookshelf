package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.BookDtls;
import com.ebook.entity.Cart;

public class CartDAOImpl implements ICartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addToCart(Cart c) {
		boolean flag = false;
		try {
			String sql = "insert into cart(bid,uid,bookName,author,price,totalprice)values(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setNString(3, c.getBookName());
			ps.setNString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalprice());

			int i = ps.executeUpdate();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "Select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet r = ps.executeQuery();
			while (r.next()) {
				c = new Cart();
				c.setCid(r.getInt(1));
				c.setBid(r.getInt(2));
				c.setUid(r.getInt(3));
				c.setBookName(r.getNString(4));
				c.setAuthor(r.getNString(5));
				c.setPrice(r.getDouble(6));
				totalPrice = totalPrice + r.getDouble(7);
				c.setTotalprice(totalPrice);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		boolean flag = false;
		try {
			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
