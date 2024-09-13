package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AdminMapper implements RowMapper<Admin>{
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		Admin admin = new Admin();
		admin.setId(rs.getInt("id"));
		admin.setName(rs.getString("name"));
		admin.setUsername(rs.getString("username"));
		admin.setPassword(rs.getString("password"));
		admin.setEmail(rs.getString("email"));
		return admin;
	}
}
