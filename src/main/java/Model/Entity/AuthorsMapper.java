package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AuthorsMapper implements RowMapper<Authors>{
	public Authors mapRow(ResultSet rs, int rowNum) throws SQLException {
		Authors authors = new Authors();
		authors.setId(rs.getInt("id"));
		authors.setName(rs.getString("name"));
		authors.setImage(rs.getString("image"));
		authors.setDescription(rs.getString("description"));
		return authors;
	}
}
