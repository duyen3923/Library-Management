package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Authors;
import Model.Entity.AuthorsMapper;
import Model.Entity.Pagination;

@Repository
public class AuthorDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Authors> GetDataAuthor() {
		List<Authors> list = new ArrayList<Authors>();
		String sql = "SELECT * FROM author";
		list = _jdbcTemplate.query(sql, new AuthorsMapper());
		return list;
	}

	public int InsertAuthor(Authors authors) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `author`(`name`, `image`, `description`)" + "VALUES('" + authors.getName() + "','"
				+ authors.getImage() + "','" + authors.getDescription() + "')");
		int author = _jdbcTemplate.update(sql.toString());
		return author;
	}

	public Authors GetAuFromId(int id) {
		String sql = "SELECT * FROM author WHERE id = ?";
		Authors author = _jdbcTemplate.queryForObject(sql, new AuthorsMapper(), id);
		return author;
	}

	public int UpdateAuthor(int id, Authors authors) {
		String sql = "UPDATE author SET name = ?, image = ?,description = ? WHERE id = ?";
		int rs = 0;
		rs = _jdbcTemplate.update(sql, authors.getName(), authors.getImage(), authors.getDescription(), id);
		return rs;
	}

	public int DeleteAuthor(int id) {
		int rs = 0;
	    String sql = "DELETE FROM author WHERE id = ?";
	    try {
	        int affectedRows = _jdbcTemplate.update(sql, new Object[]{id});
	        return affectedRows;
	    } catch (DataIntegrityViolationException e) {
	        return 0; 
	    }
	}
	
	public Pagination<Authors> searchAuthor(String name, int pageNo, int pageSize) {
	    int offset = (pageNo - 1) * pageSize;
	    String sql = "SELECT * FROM author WHERE name LIKE ? LIMIT ?, ?";
	    String searchPattern = "%" + name + "%";
	    List<Authors> authors = _jdbcTemplate.query(sql, new Object[]{searchPattern, offset, pageSize}, new AuthorsMapper());
	    
	    // Count total matching authors
	    int totalAuthors = _jdbcTemplate.queryForObject("SELECT COUNT(*) FROM author WHERE name LIKE ?", Integer.class, searchPattern);

	    return new Pagination<Authors>(authors, pageNo, totalAuthors, pageSize);
	}

	public Pagination<Authors> getAllByPage(int pageNo, int pageSize) {
		int offset = (pageNo - 1) * pageSize;
        String sql = "SELECT * FROM author LIMIT ?, ?";
        List<Authors> authors = _jdbcTemplate.query(sql, new Object[]{offset, pageSize}, new AuthorsMapper());
        int totalAuthors = _jdbcTemplate.queryForObject("SELECT COUNT(*) FROM author", Integer.class);

        return new Pagination<Authors>(authors, pageNo, totalAuthors, pageSize);
    }
}
