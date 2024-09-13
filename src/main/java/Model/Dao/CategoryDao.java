package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Categories;
import Model.Entity.CategoriesMapper;

@Repository
public class CategoryDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<Categories> GetDataCategories() {
		List<Categories> list = new ArrayList<Categories>();
		String sql = "SELECT * FROM category";
		list = _jdbcTemplate.query(sql, new CategoriesMapper());
		return list;
	}
	
	public int addCategory(Categories c) {
		if (isCategoryExist(c.getName().trim())) {
			return -1;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO category(name) VALUES(N'"+c.getName()+"')");
		int a = _jdbcTemplate.update(sql.toString());
		return a;
	}
	
	public boolean isCategoryExist(String categoryName) {
		String sql = "SELECT name FROM category WHERE name = ?";
		List<String> categoies = _jdbcTemplate.queryForList(sql, new Object[] { categoryName }, String.class);
		return !categoies.isEmpty(); 
	}
	
	public int deleteCategory(int id) {
		String sql = "DELETE FROM category WHERE id =?";
		try {
	        int affectedRows = _jdbcTemplate.update(sql, new Object[]{id});
	        return affectedRows;
	    } catch (DataIntegrityViolationException e) {
	        return 0; 
	    }
	}
	
	public Categories getCateFromId(int id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		Categories c = _jdbcTemplate.queryForObject(sql, new CategoriesMapper(), id);
		return c;
	}
	
	public int updateCategory(int id ,Categories c) {
		if (isCategoryExist(c.getName().trim()) || c.getName().trim().length() == 0) {
			return -1;
		}
		int rs = 0;
		String sql = "UPDATE category SET name = ? WHERE id = ?";
		rs = _jdbcTemplate.update(sql, c.getName(),id);
		return rs;
	}
	
	public List<Categories> GetDataSearchCategories(String name) {
		List<Categories> list = new ArrayList<Categories>();
		String sql = "SELECT * FROM category WHERE name LIKE ?";
		list = _jdbcTemplate.query(sql, new CategoriesMapper(),"%" + name.trim() + "%");
		return list;
	}
}
