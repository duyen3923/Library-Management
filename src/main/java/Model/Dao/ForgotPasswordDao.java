package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ForgotPasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public int CheckEmail(String email) {
		String checkEmailReaders = "SELECT COUNT(*) FROM user WHERE email = ?";
        Integer count1 = _jdbcTemplate.queryForObject(checkEmailReaders, new Object[]{email}, Integer.class);
        if(count1 == 0) {
        	return 0; // KO tim thay 
        }
		return 1;
	}
}
