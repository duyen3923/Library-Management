package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.BooksDto;
import Model.Dto.BooksDtoMapper;
import Model.Entity.Notification;
import Model.Entity.NotificationMapper;
import Model.Entity.Pagination;

@Repository
public class BooksDtoDao extends BaseDao {

	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<BooksDto> GetDataBooksDto() {
		List<BooksDto> list = new ArrayList<BooksDto>();
		String sql = "SELECT " + "book.id AS bookId, " + "book.name AS bookName, " + "book.image AS bookImage, " + "book.amount AS bookAmount, " +
	             "book.dayCreated AS bookDayCreated, " + "book.description AS bookDescription, " + "author.id AS authorId, " + "author.name AS authorName, " +
	             "author.image AS authorImage, " + "author.description AS authorDescription, " + "category.id AS categoryId, " +
	             "category.name AS categoryName, " + "book.pdf AS pdf " + "FROM book " + "JOIN author ON book.authorId = author.id " +
	             "JOIN category ON book.categoryId = category.id";
		list = _jdbcTemplate.query(sql, new BooksDtoMapper());
		return list;
	}

	public Pagination<BooksDto> getDataSearchBookDto(String name, int pageNo, int pageSize) {
		int offset = (pageNo - 1) * pageSize;
		String sql = "SELECT " + "book.id AS bookId, " + "book.name AS bookName, " + "book.image AS bookImage, " + "book.amount AS bookAmount, " +
	             "book.dayCreated AS bookDayCreated, " + "book.description AS bookDescription, " + "author.id AS authorId, " + "author.name AS authorName, " +
	             "author.image AS authorImage, " + "author.description AS authorDescription, " + "category.id AS categoryId, " + "category.name AS categoryName, " +
	             "book.pdf AS pdf " + "FROM book " + "JOIN author ON book.authorId = author.id " + "JOIN category ON book.categoryId = category.id " +
	             "WHERE book.name LIKE ? OR author.name LIKE ? " + "LIMIT ? OFFSET ?";
		List<BooksDto> list = _jdbcTemplate.query(sql, new BooksDtoMapper(), "%" + name + "%", "%" + name + "%",
				pageSize, offset);
		// Truy vấn để lấy tổng số sách
		int totalBooks = _jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book JOIN author ON book.authorId = author.id JOIN category ON book.categoryId = category.id WHERE book.name LIKE ? OR author.name LIKE ?",
				Integer.class, "%" + name + "%", "%" + name + "%");
		return new Pagination<BooksDto>(list, pageNo, totalBooks, pageSize);
	}

	public BooksDto GetAllFromId(int id) {
		String sql = "SELECT " + "book.id AS bookId, " + "book.name AS bookName, " + "book.image AS bookImage, " + "book.amount AS bookAmount, " +
	             "book.dayCreated AS bookDayCreated, " + "book.description AS bookDescription, " + "author.id AS authorId, " + "author.name AS authorName, " +
	             "author.image AS authorImage, " + "author.description AS authorDescription, " + "category.id AS categoryId, " + 
	             "category.name AS categoryName, " + "book.pdf AS pdf " + "FROM book " + "JOIN author ON book.authorId = author.id " +
	             "JOIN category ON book.categoryId = category.id " + "WHERE book.id = ?";
		BooksDto booksDto = _jdbcTemplate.queryForObject(sql, new BooksDtoMapper(), id);
		return booksDto;
	}

	public Pagination<BooksDto> getPaginationBooks(int pageNo, int pageSize) {
		int offset = (pageNo - 1) * pageSize;
		String sql = "SELECT book.id as bookId, book.name as bookName, book.image as bookImage, book.amount as bookAmount, "
				+ "book.dayCreated as bookDayCreated, book.description as bookDescription, "
				+ "author.id as authorId, author.name as authorName, author.image as authorImage, author.description as authorDescription, "
				+ "category.id as categoryId, category.name as categoryName, book.pdf as pdf " + "FROM book "
				+ "JOIN author ON book.authorId = author.id " + "JOIN category ON book.categoryId = category.id "
				+ "LIMIT ? OFFSET ?";
		List<BooksDto> books = _jdbcTemplate.query(sql, new BooksDtoMapper(), pageSize, offset);
		int totalBooks = _jdbcTemplate.queryForObject("SELECT COUNT(id) FROM book", Integer.class);

		return new Pagination<BooksDto>(books, pageNo, totalBooks, pageSize);
	}

	public Pagination<BooksDto> getBooksByCategory(int categoryId, int pageNo, int pageSize) {
		int offset = (pageNo - 1) * pageSize;
		String sql = "SELECT book.id as bookId, book.name as bookName, book.image as bookImage, book.amount as bookAmount, "
				+ "book.dayCreated as bookDayCreated, book.description as bookDescription, "
				+ "author.id as authorId, author.name as authorName, author.image as authorImage, author.description as authorDescription, "
				+ "category.id as categoryId, category.name as categoryName, book.pdf as pdf " + "FROM book "
				+ "JOIN author ON book.authorId = author.id " + "JOIN category ON book.categoryId = category.id "
				+ "WHERE category.id = ? " + "LIMIT ? OFFSET ?";
		List<BooksDto> books = _jdbcTemplate.query(sql, new BooksDtoMapper(), categoryId, pageSize, offset);
		int totalBooks = _jdbcTemplate.queryForObject("SELECT COUNT(id) FROM book WHERE categoryId = ?", Integer.class,
				categoryId);

		return new Pagination<BooksDto>(books, pageNo, totalBooks, pageSize);
	}
	public int DeleteBook(int bookId) {
		String sql = "SELECT 1 FROM chitietmuontra WHERE bookId = ?";
		return bookId;
	}
}
