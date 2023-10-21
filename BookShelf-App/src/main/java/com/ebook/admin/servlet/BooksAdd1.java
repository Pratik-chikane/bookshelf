package com.ebook.admin.servlet;

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

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd1 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("name");
			String author = req.getParameter("aname");

			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			System.out.println(bookName);
			BookDtls bookDtls = new BookDtls(bookName, author, price, categories, status, fileName, "admin");
			
			System.out.println(bookDtls);
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
			boolean b = dao.addBooks(bookDtls);
			
			HttpSession session = req.getSession();
			if (b) {
				
				String path = getServletContext().getRealPath("")+"img";
				System.out.println(path);
				File f = new File(path);
				part.write(path+File.separator+fileName);
				System.out.println("success");
				session.setAttribute("succMsg", "Book Added Successfully");
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