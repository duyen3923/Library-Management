package Model.Dao;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import Model.Entity.Books;
import Model.Entity.BooksMapper;

@Repository
public class HomeDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<Books> GetDataBooks(){
		List<Books> list = new ArrayList<Books>();
		String sql = "SELECT * FROM book";
		list = _jdbcTemplate.query(sql, new BooksMapper());
		return list;

	} 
}