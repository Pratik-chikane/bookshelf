package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDAOImpl;
import com.ebook.dao.CartDAOImpl;
import com.ebook.db.DbConnect;
import com.ebook.entity.BookDtls;
import com.ebook.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
			BookDtls b = dao.getBookById(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			CartDAOImpl dao1 = new CartDAOImpl(DbConnect.getConn());
			boolean b1 = dao1.addToCart(c);
			HttpSession session = req.getSession();
			if (b1) {
				session.setAttribute("cart", "Book Added to Cart");
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failed", "Something went wrong");
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
