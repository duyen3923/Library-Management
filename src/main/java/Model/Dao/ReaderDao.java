
package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Users;
import Model.Entity.UsersMapper;

@Repository
public class ReaderDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Users> GetDataReader() {
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM user WHERE isAdmin = 0";
		list = _jdbcTemplate.query(sql, new UsersMapper());
		return list;
	}
	
	public List<Users> GetDataSearchReader(String name) {
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM user WHERE name LIKE ? AND isAdmin = 0";
		list = _jdbcTemplate.query(sql, new UsersMapper(),"%" + name + "%");
		return list;
	}
}
