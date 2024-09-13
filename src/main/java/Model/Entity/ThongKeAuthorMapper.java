package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ThongKeAuthorMapper implements RowMapper<Authors>{
	public Authors mapRow(ResultSet rs, int rowNum) throws SQLException {
		Authors authors = new Authors();
		authors.setId(rs.getInt("id"));
		authors.setName(rs.getString("name"));
		authors.setAmount(rs.getInt("amount"));
		authors.setBookname(rs.getString("bookname"));
		return authors;
	}
}
