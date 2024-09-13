package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BooksMapper implements RowMapper<Books>{
	public Books mapRow(ResultSet rs, int rowNum) throws SQLException {
		Books books = new Books();
		books.setId(rs.getInt("id"));
		books.setName(rs.getString("name"));
		books.setAmount(rs.getInt("amount"));
		books.setCategoryId(rs.getInt("categoryId"));
		books.setDayCreated(rs.getString("dayCreated"));
		books.setImage(rs.getString("image"));
		books.setDescription(rs.getString("description"));
		books.setAuthorId(rs.getInt("authorId"));
		books.setPdf(rs.getString("pdf"));
		return books;
	}
}
