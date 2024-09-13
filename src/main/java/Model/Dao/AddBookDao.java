package Model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.BooksDto;
import Model.Dto.BooksDtoMapper;
import Model.Entity.Pagination;


@Repository
public class AddBookDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	// Admin: Insert book
	public int insertBook(BooksDto books) {
		String sqlCheck = "SELECT COUNT(*) FROM book WHERE LOWER(name) = LOWER(?) AND authorId = ? AND dayCreated = ?";
		int count = _jdbcTemplate.queryForObject(sqlCheck, Integer.class, books.getBookName(), books.getAuthorId(), books.getBookDayCreated());
		if( count > 0 ) {
			return -1;
		}
		
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `book`(`name`,`amount`,`dayCreated`,`categoryId`,`image`,`description`,`authorId`,`pdf`) "
				+ "VALUES('" + books.getBookName() + "','" + books.getBookAmount() + "','" + books.getBookDayCreated()
				+ "','" + books.getCategoryId() + "','" + books.getBookImage() + "','" + books.getBookDescription()
				+ "','" + books.getAuthorId() + "','" + books.getPdf() + "')");
		int book = _jdbcTemplate.update(sql.toString());
		return book;
	}

	// Admin: Update book
	public int updateBook(int id, BooksDto booksDto) {
		String sql = "UPDATE book SET name = ?, amount = ?, dayCreated = ?, categoryId = ?, image = ?, description = ?, authorId = ?, pdf = ? WHERE id = ?";
		int book = _jdbcTemplate.update(sql, booksDto.getBookName(), booksDto.getBookAmount()
				,booksDto.getBookDayCreated(),
				booksDto.getCategoryId(), booksDto.getBookImage(),
				booksDto.getBookDescription(), booksDto.getAuthorId(), booksDto.getPdf(), id);
		return book;
	}

	// Admin: Delete book
	public int deleteBook(int bookId) {
		String sql = "DELETE FROM book WHERE id = ?";
		try {
	        int affectedRows = _jdbcTemplate.update(sql, new Object[]{bookId});
	        return affectedRows;
	    } catch (DataIntegrityViolationException e) {
	        return 0; 
	    }
	}

	// Method to get a book by its ID
	public BooksDto getBooksDtoById(int bookId) {
		String sql = "SELECT  book.id as bookId, book.name as bookName, book.image as bookImage, book.amount as bookAmount, "
				+ "book.dayCreated as bookDayCreated, book.description as bookDescription,"
				+ "author.id as authorId, author.name as authorName, author.image as authorImage, author.description as authorDescription,"
				+ "category.id as categoryId, category.name as categoryName, book.pdf as pdf FROM book,author,category WHERE book.authorId=author.id "
				+ "AND book.categoryId = category.id AND book.id = ?";
		BooksDto booksDto = _jdbcTemplate.queryForObject(sql, new BooksDtoMapper(), bookId);
		return booksDto;
	}

	public Pagination<BooksDto> getBookByPage(int pageNo, int pageSize) {
		int offset = (pageNo - 1) * pageSize;
		String sql = "SELECT  book.id as bookId, book.name as bookName, book.image as bookImage, book.amount as bookAmount, "
				+ "book.dayCreated as bookDayCreated, book.description as bookDescription,"
				+ "author.id as authorId, author.name as authorName, author.image as authorImage, author.description as authorDescription,"
				+ "category.id as categoryId, category.name as categoryName, book.pdf as pdf FROM book,author,category WHERE book.authorId=author.id "
				+ "and book.categoryId = category.id LIMIT ? OFFSET ?";
		List<BooksDto> books = _jdbcTemplate.query(sql, new BooksDtoMapper(), pageSize, offset);
		String countSql = "SELECT COUNT(*) FROM book";
		int totalItems = _jdbcTemplate.queryForObject(countSql, Integer.class);

		return new Pagination<BooksDto>(books, pageNo, totalItems, pageSize);
	}

	public Pagination<BooksDto> searchBook(int pageNo, int pageSize, String name) {
		int offset = (pageNo - 1) * pageSize;
		String sql = "SELECT book.id as bookId,book.name AS bookName, book.image AS bookImage, book.amount AS bookAmount, "
				+ "book.dayCreated AS bookDayCreated, book.description AS bookDescription, "
				+ "author.id as authorId, author.name AS authorName, author.image AS authorImage, author.description AS authorDescription, "
				+ "category.id as categoryId,category.name AS categoryName, book.pdf as pdf " + "FROM book "
				+ "JOIN author ON book.authorId = author.id " + "JOIN category ON book.categoryId = category.id "
				+ "WHERE book.name LIKE ? OR author.name LIKE ?" + "LIMIT ? OFFSET ?";
		List<BooksDto> list = _jdbcTemplate.query(sql, new BooksDtoMapper(), "%" + name + "%", "%" + name + "%",
				pageSize, offset);
		// Truy vấn để lấy tổng số sách
		int totalBooks = _jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book JOIN author ON book.authorId = author.id JOIN category ON book.categoryId = category.id WHERE book.name LIKE ? OR author.name LIKE ?",
				Integer.class, "%" + name + "%", "%" + name + "%");
		return new Pagination<BooksDto>(list, pageNo, totalBooks, pageSize);
	}
}
