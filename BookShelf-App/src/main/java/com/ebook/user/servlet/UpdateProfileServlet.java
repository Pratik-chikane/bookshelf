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

@WebServlet("/update")
public class UpdateProfileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));

			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			System.out.println(user);
			
			HttpSession session = req.getSession();
			
			UserDAOImpl daoImpl = new UserDAOImpl(DbConnect.getConn());
			boolean flag = daoImpl.checkPassword(id, password);
			System.out.println(flag);
			if (flag) {
				boolean b = daoImpl.updateProfile(user);
				if (b) {
					session.setAttribute("msg", "Profile Updated Successfully");
					resp.sendRedirect("editProfile.jsp");
				} else {
					session.setAttribute("msg", "Profile Updation Failed");
					resp.sendRedirect("editProfile.jsp");
				}

			} else {
				session.setAttribute("msg", "Password is Wrong");
				resp.sendRedirect("editProfile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
