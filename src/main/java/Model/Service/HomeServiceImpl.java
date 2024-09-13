package Model.Service;

import java.io.Reader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Model.Dao.AuthorDao;
import Model.Dao.BaseDao;
import Model.Dao.BooksDtoDao;
import Model.Dao.CategoryDao;
import Model.Dao.ChiTietMuonTraDao;
import Model.Dao.HomeDao;
import Model.Dao.NotificationDao;
import Model.Dao.ReaderDao;
import Model.Dto.BooksDto;
import Model.Entity.Authors;
import Model.Entity.Books;
import Model.Entity.Categories;
import Model.Entity.ChiTietMuonTra;
import Model.Entity.Notification;
import Model.Entity.Users;


@Service
public class HomeServiceImpl implements IHomeService{
	@Autowired
	private HomeDao booksDao;
	
	@Autowired
	private ReaderDao readerDao;
	
	@Autowired
	private ChiTietMuonTraDao ctmtDao;
	
	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private BooksDtoDao booksDtoDao;
	
	@Autowired
	private NotificationDao notificationDao;
	
	
	public List<Books> GetDataBooks() {
		return booksDao.GetDataBooks();
	}
	
	public List<Users> GetDataReader() {
		return readerDao.GetDataReader();
	}
	
	public List<ChiTietMuonTra> getDataChiTietMuonTras() {
		return ctmtDao.GetDataChiTietMuonTra();
	}
	public List<Authors> getDataAuthor() {
		return authorDao.GetDataAuthor();
	}
	public List<Categories> getDataCategories() {
		return categoryDao.GetDataCategories();
	}
	
	public List<BooksDto> GetDataBooksDto() {
		return booksDtoDao.GetDataBooksDto();
	}
	
	public BooksDto GetAllFromId(int id) {
		return booksDtoDao.GetAllFromId(id);
	}
	
	public List<Notification> GetDataNotification() {
		return notificationDao.GetDataNotification();
	}
	public List<Notification> GetDataIdNotification() {
		return notificationDao.GetDataIdNotification();
	}

	public List<Authors> GetDataAuthor() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Categories> GetDataCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<ChiTietMuonTra> getDataChiTietMuonTra() {
		return ctmtDao.GetDataChiTietMuonTra();
	}
}
