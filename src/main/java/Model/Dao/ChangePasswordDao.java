package Model.Dao;

import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Users;
import Model.Entity.UsersMapper;

@Repository
public class ChangePasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	@Autowired
	LoginDao loginDao = new LoginDao();

	public int ChangePassword(String newpassword, int id) {
		int rs = 0;
		String sql;
		sql = "UPDATE user SET password = ? WHERE id = ?";
		rs = _jdbcTemplate.update(sql, newpassword, id);
		return rs;
	}

	public int checkOldPassword(String password,  String username) {
		int rs = 0;
		String sql;
		sql = "SELECT * FROM user WHERE username = ?";
		List<Users> readers = _jdbcTemplate.query(sql, new UsersMapper(), username);
		if (!readers.isEmpty()) {
			Users reader = readers.get(0);
			if (BCrypt.checkpw(password, reader.getPassword())) {
				rs = 1;
			}
		}
		return rs;

	}
}
