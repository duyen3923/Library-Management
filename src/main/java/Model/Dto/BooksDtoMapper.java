package Model.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BooksDtoMapper implements RowMapper<BooksDto> {
	public BooksDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BooksDto booksDto = new BooksDto();
		booksDto.setBookId(rs.getInt("bookId"));
		booksDto.setAuthorId(rs.getInt("authorId"));
		booksDto.setCategoryId(rs.getInt("categoryId"));
		booksDto.setBookName(rs.getString("bookName"));
        booksDto.setBookImage(rs.getString("bookImage"));
        booksDto.setBookAmount(rs.getInt("bookAmount"));
        booksDto.setBookDayCreated(rs.getString("bookDayCreated"));
        booksDto.setBookDescription(rs.getString("bookDescription"));
        booksDto.setAuthorName(rs.getString("authorName"));
        booksDto.setAuthorImage(rs.getString("authorImage"));
        booksDto.setAuthorDescription(rs.getString("authorDescription"));
        booksDto.setCategoryName(rs.getString("categoryName"));
        booksDto.setPdf(rs.getString("pdf"));
		return booksDto;
	}

}
