package com.ebook.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.BookDtls;

public class BookDAOImpl implements IBookDAO {
	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean flag = false;
		try {

			String query = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setNString(1, b.getBookName());
			ps.setNString(2, b.getAuthor());
			ps.setNString(3, b.getPrice());
			ps.setNString(4, b.getBookCategory());
			ps.setNString(5, b.getStatus());
			ps.setNString(6, b.getPhotoName());
			ps.setNString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			System.out.println(id);
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public Boolean deleteBook(int id) {
		boolean flag = false;
		try {
			String query = "delete from book_dtls where bookId =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDtls> getNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setNString(1, "new");
			ps.setNString(2, "Active");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setNString(1, "Active");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setNString(1, "old");
			ps.setNString(2, "Active");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getUserOldBooks(String email, String category) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where email = ? and bookCategory=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setNString(2, category);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Boolean deleteUserOldBook(String email, Integer id) {
		boolean flag = false;
		try {
			String query = "delete from book_dtls where bookId = ? and email =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, email);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status = ? ";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,"%"+ch+"%" );
			ps.setString(2,"%"+ch+"%" );
			ps.setString(3,"%"+ch+"%" );
			
			ps.setNString(4, "active");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				b = new BookDtls();
				b.setBookId(resultSet.getInt(1));
				b.setBookName(resultSet.getString(2));
				b.setAuthor(resultSet.getNString(3));
				b.setPrice(resultSet.getNString(4));
				b.setBookCategory(resultSet.getNString(5));
				b.setStatus(resultSet.getNString(6));
				b.setPhotoName(resultSet.getNString(7));
				b.setEmail(resultSet.getNString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
