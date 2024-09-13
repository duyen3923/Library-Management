package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Model.Dao.AuthorDao;
import Model.Entity.Authors;
import Model.Entity.Pagination;

@Service
public class AuthorServiceImpl {
	@Autowired
	private AuthorDao authorDao;
	
	public List<Authors> getDataAuthor() {
		return authorDao.GetDataAuthor();
	}
	public int insertAuthor(Authors authors) {
		return authorDao.InsertAuthor(authors);
	}
	public Authors getAuFromId(int id) {
		return authorDao.GetAuFromId(id);
	}
	public int updateAuthor(int id , Authors authors) {
		return authorDao.UpdateAuthor(id, authors);
	}
	public int deleteAuthor(int id) {
		return authorDao.DeleteAuthor(id);
	}
	public Pagination<Authors> searchAuthor(String name, int pageNo, int pageSize) {
		return authorDao.searchAuthor(name, pageNo, pageSize);
	}
	public Pagination<Authors> getAllByPage(int pageNo, int pageSize) {
		return authorDao.getAllByPage(pageNo, pageSize);
	}
}
