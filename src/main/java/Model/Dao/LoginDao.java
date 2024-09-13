package Model.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Entity.Admin;
import Model.Entity.AdminMapper;
import Model.Entity.Users;
import Model.Entity.UsersMapper;



@Repository
public class LoginDao extends BaseDao{

	public Users GetUserByAccount(String username) {
		  String sql = "SELECT * FROM user WHERE username = ?"; 
		List<Users> user = _jdbcTemplate.query(sql, new UsersMapper(), username);
		  if (user.isEmpty()) {
		        return null;
		    } else {
		        return user.get(0); // Trả về đọc giả đầu tiên nếu có
		    }
	}
	public Users GetUserByEmail(String email) {
		  String sql = "SELECT * FROM user WHERE email = ?"; 
		  List<Users> user = _jdbcTemplate.query(sql, new UsersMapper(), email);
		  if (user.isEmpty()) {
		        return null;
		    } else {
		        return user.get(0); 
		    }
	}
}
