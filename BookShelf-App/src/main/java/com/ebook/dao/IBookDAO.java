package com.ebook.dao;

import java.util.List;

import com.ebook.entity.BookDtls;

public interface IBookDAO {
	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBooks();

	public BookDtls getBookById(int id);

	public Boolean deleteBook(int id);

	public List<BookDtls> getNewBooks();

	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getUserOldBooks(String email, String category);
	
	public Boolean deleteUserOldBook(String email, Integer id);
	
	public List<BookDtls> getBookBySearch(String ch);
	
}
