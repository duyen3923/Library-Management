package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Model.Dto.ChiTietMuonTraDto;

public class ChiTietMuonTraDtoMapper implements RowMapper<ChiTietMuonTraDto>{

	public ChiTietMuonTraDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ChiTietMuonTraDto ctmtsDto = new ChiTietMuonTraDto();
		ctmtsDto.setCtmtId(rs.getInt("ctmtId"));
		ctmtsDto.setBookId(rs.getInt("bookId"));
		ctmtsDto.setCtmtNgayMuon(rs.getDate("ctmtNgayMuon"));
		ctmtsDto.setCtmtTrangThai(rs.getInt("ctmtTrangThai"));
		ctmtsDto.setCtmtNgayTra(rs.getDate("ctmtNgayTra"));
		ctmtsDto.setCtmtAmount(rs.getInt("ctmtAmount"));
		ctmtsDto.setBookName(rs.getString("bookName"));
		ctmtsDto.setBookAmount(rs.getInt("bookAmount"));
		ctmtsDto.setReaderId(rs.getInt("readerId"));
		ctmtsDto.setReaderName(rs.getString("readerName"));
		return ctmtsDto;
	}

}
