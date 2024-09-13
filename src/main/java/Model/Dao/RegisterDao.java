package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Users;

@Repository
public class RegisterDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	@Autowired
	public ForgotPasswordDao checkEmail = new ForgotPasswordDao();
	
	public int AddAccount(Users reader) {
		String checkUsername = "SELECT COUNT(*) FROM user WHERE username = ?";
		Integer count = _jdbcTemplate.queryForObject(checkUsername, new Object[] { reader.getUsername() },
				Integer.class);
		if (count > 0) {
			return 2; // Username đã được đăng ký
		} {
			String sql = "INSERT INTO user (name, username, password, email,isAdmin) VALUES (?, ?, ?, ?,?)";
			int insert = _jdbcTemplate.update(sql, reader.getName(), reader.getUsername(), reader.getPassword(),
					reader.getEmail(),0);
			return insert;
		}
	}

}
