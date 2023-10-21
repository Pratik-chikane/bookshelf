package com.ebook.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDAOImpl;
import com.ebook.db.DbConnect;

@WebServlet("/delete")
public class BookDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
			Boolean book = dao.deleteBook(id);

			HttpSession session = req.getSession();
			if (book) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("admin/admin.jsp");
			} else {
				session.setAttribute("failMsg", "Something went wrong");
				resp.sendRedirect("admin/admin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
