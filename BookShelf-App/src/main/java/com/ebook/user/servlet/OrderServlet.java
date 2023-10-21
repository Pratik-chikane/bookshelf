package com.ebook.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.function.Consumer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookOrderDAOImpl;
import com.ebook.dao.CartDAOImpl;
import com.ebook.db.DbConnect;
import com.ebook.entity.BookOrder;
import com.ebook.entity.Cart;


@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landMark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String payment = req.getParameter("payment");
			String pincode = req.getParameter("pincode");
			
			String fullAddress = address+" "+landMark+" "+city+" "+state+" "+pincode;
			
			CartDAOImpl daoImpl = new CartDAOImpl(DbConnect.getConn());
			List<Cart> bookList = daoImpl.getBookByUser(id);
			
			if(!bookList.isEmpty()) {
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DbConnect.getConn());
				
				BookOrder o = null;
				Random r = new Random();
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
				for(Cart c: bookList) {
					o = new BookOrder();
					o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFullAddress(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					String price = Double.toString(c.getPrice());
					o.setPrice(price);
					o.setPaymentType(payment);
					orderList.add(o);
				
				}
				boolean order = dao2.saveOrder(orderList);
				if(order) {
					session.setAttribute("msg", "Order Placed Successfully");
					resp.sendRedirect("checkout.jsp");
				}else {
					session.setAttribute("msg", "Something went wrong");
					resp.sendRedirect("checkout.jsp");
				}
			}else {
				session.setAttribute("msg", "Please Add Book To Place Order");
				resp.sendRedirect("checkout.jsp");
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
