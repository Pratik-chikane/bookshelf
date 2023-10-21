package com.ebook.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ebook.dao.BookDAOImpl;
import com.ebook.dao.UserDAOImpl;
import com.ebook.db.DbConnect;
import com.ebook.entity.BookDtls;
import com.ebook.entity.User;

@WebServlet("/add_old_book")
@MultipartConfig
public class OldBookAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("name");
			String author = req.getParameter("author");

			String price = req.getParameter("price");
			String userEmail = req.getParameter("email");
			String categories ="old";
			String status ="active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			System.out.println(bookName);
			BookDtls bookDtls = new BookDtls(bookName, author, price, categories, status, fileName, userEmail);
			
			System.out.println(bookDtls);
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
			boolean b = dao.addBooks(bookDtls);
			
			HttpSession session = req.getSession();
			if (b) {
				
				String path = getServletContext().getRealPath("")+"img";
				System.out.println(path);
				File f = new File(path);
				part.write(path+File.separator+fileName);
		
				session.setAttribute("msg", "Book Added Successfully");
				resp.sendRedirect("SellBook.jsp");
			} else {
				session.setAttribute("msg", "Something went wrong");
				resp.sendRedirect("SellBook.jsp");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}