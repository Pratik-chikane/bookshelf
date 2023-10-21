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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");

			User user1 = new User();
			user1.setName(name);
			user1.setEmail(email);
			user1.setPhno(phno);
			user1.setPassword(password);

			UserDAOImpl daoImpl = new UserDAOImpl(DbConnect.getConn());
			boolean uniqueUser = daoImpl.uniqueUser(email);
			if (uniqueUser) {
				boolean register = daoImpl.userRegister(user1);

				if (register) {
					session.setAttribute("regMsg", "Registration Successfull");
					resp.sendRedirect("register.jsp");
				} else {
					session.setAttribute("regMsg", "Registration Failed");
					resp.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("regMsg", "User Already Exists");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
