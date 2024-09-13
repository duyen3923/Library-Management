package Model.Service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dto.BooksDto;
import Model.Entity.Authors;
import Model.Entity.Books;
import Model.Entity.Categories;
import Model.Entity.Notification;



@Service
public interface IHomeService {
	@Autowired
	public List<Books> GetDataBooks();
	
	@Autowired
	public List<Authors> GetDataAuthor();
	
	@Autowired
	public List<Categories> GetDataCategory();
	
	@Autowired
	public List<BooksDto> GetDataBooksDto();
	
	@Autowired
	public List<Notification> GetDataNotification();
}
