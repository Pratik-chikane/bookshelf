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

@WebServlet("/deleteOld")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("em");
		Integer id = Integer.parseInt(req.getParameter("id"));
		BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
		boolean b = dao.deleteUserOldBook(email,id);

		HttpSession session = req.getSession();

		if (b) {	
			session.setAttribute("succMsg", "Book Removed Successfully");
			resp.sendRedirect("userOldBook.jsp");
		} else {
			session.setAttribute("failMsg", "Something went wrong");
			resp.sendRedirect("userOldBook.jsp");
		}
	}

}
