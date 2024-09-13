package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.AddBookDao;
import Model.Dao.AuthorDao;
import Model.Dao.BooksDtoDao;
import Model.Dao.CategoryDao;
import Model.Dao.HomeDao;
import Model.Dto.BooksDto;
import Model.Dto.BooksDtoMapper;
import Model.Entity.Authors;
import Model.Entity.Books;
import Model.Entity.Categories;
import Model.Entity.Pagination;

@Service
public class BookServiceImpl {
	@Autowired
	private AddBookDao addbookDao;

	@Autowired
	private HomeDao booksDao;

	@Autowired
	private AuthorDao authorDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private BooksDtoDao bookDtoDao;

	public List<Books> GetDataBooks() {
		return booksDao.GetDataBooks();
	}

	public List<Authors> getDataAuthor() {
		return authorDao.GetDataAuthor();
	}

	public List<Categories> getDataCategories() {
		return categoryDao.GetDataCategories();
	}

	public int insertBook(BooksDto books) {
		return addbookDao.insertBook(books);
	}

	// Delete book
	public int deleteBook(int bookId) {
		return addbookDao.deleteBook(bookId);
	}

	// Update book
	public int updateBook(int id, BooksDto booksDto) {
		return addbookDao.updateBook(id, booksDto);
	}

	// Method to get a book by its ID
	public BooksDto getBookById(int bookId) {
		return addbookDao.getBooksDtoById(bookId);
	}

	public List<BooksDto> GetDataBooksDto() {
		return bookDtoDao.GetDataBooksDto();
	}

	public Pagination<BooksDto> getDataSearchBookDto(String name, int pageNo, int pageSize) {
		return bookDtoDao.getDataSearchBookDto(name, pageNo, pageSize);
	}

//	public List<BooksDto> getDataFilterBookDto(int id) {
//		return bookDtoDao.getDataFilterBookDto(id);
//	}
	public Pagination<BooksDto> getPaginationBooks(int pageNo, int pageSize) {
		return bookDtoDao.getPaginationBooks(pageNo, pageSize);
	}

	public Pagination<BooksDto> getBooksByCategory(int pageNo, int pageSize, int id) {
		return bookDtoDao.getBooksByCategory(pageNo, pageSize, id);
	}

	public Pagination<BooksDto> getBookByPage(int pageNo, int pageSize) {
		return addbookDao.getBookByPage(pageNo, pageSize);
	}
	//Admin: SearchBook
	public Pagination<BooksDto> searchBook(int pageNo, int pageSize, String name) {
		return addbookDao.searchBook(pageNo, pageSize, name);
	}
}
