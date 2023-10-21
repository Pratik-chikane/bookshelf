package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.BookDtls;
import com.ebook.entity.User;

public class UserDAOImpl implements IUserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User user) {
		boolean flag = false;
		try {
			String Query = "insert into user(name,email,phno,password) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhno());

			int update = ps.executeUpdate();
			if (update == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			String Query = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt(1));
				user.setName(resultSet.getNString(2));
				user.setEmail(resultSet.getNString(3));
				user.setPhno(resultSet.getNString(4));
				user.setPassword(resultSet.getNString(5));
				user.setAddress(resultSet.getNString(6));
				user.setLandmark(resultSet.getNString(7));
				user.setCity(resultSet.getNString(8));
				user.setState(resultSet.getNString(9));
				user.setPincode(resultSet.getNString(10));
				System.out.println(user.getAddress());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from user";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt(1));
				user.setName(resultSet.getString(2));
				user.setEmail(resultSet.getNString(3));
				user.setPhno(resultSet.getNString(4));
				user.setAddress(resultSet.getNString(6));

				list.add(user);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean flag = false;
		try {
			String sql = "select * from user where id=? and password = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, id);
			p.setNString(2, ps);
			ResultSet resultSet = p.executeQuery();
			System.out.println("$$$$$$$$$$$$$$" + resultSet);
			while (resultSet.next()) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateProfile(User user) {
		boolean flag = false;
		try {
			String query = "UPDATE user SET name = ?, email = ?, phno = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhno());
			ps.setInt(4, user.getId());

			int update = ps.executeUpdate();
			System.out.println("****************" + update);
			if (update == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean uniqueUser(String email) {
		boolean flag = true;
		try {
			String query = "select * from user where email = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
