package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.UserDAOImpl;
import com.ebook.db.DbConnect;
import com.ebook.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DbConnect.getConn());
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			System.out.println(email + " " + password);
			if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
				User user1 = new User();
				session.setAttribute("obj", user1);
				resp.sendRedirect("admin/admin.jsp");
			} else {
				User user = dao.login(email, password);
		
				if (user != null) {
					session.setAttribute("obj", user);
					resp.sendRedirect("home.jsp");
				} else {
					session.setAttribute("logMsg", "Email or password is invalid");
					resp.sendRedirect("login.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
