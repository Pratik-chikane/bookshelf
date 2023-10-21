package com.ebook.db;

import java.sql.DriverManager;
import java.sql.Connection;


public class DbConnect {

	private static Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
