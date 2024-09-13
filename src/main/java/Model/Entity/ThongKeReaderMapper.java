package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import Model.Dto.ChiTietMuonTraDto;

public class ThongKeReaderMapper implements RowMapper<ChiTietMuonTraDto>{
	public ChiTietMuonTraDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ChiTietMuonTraDto ctmtsDto = new ChiTietMuonTraDto();
		ctmtsDto.setBookAmount(rs.getInt("bookAmount"));
		ctmtsDto.setReaderId(rs.getInt("readerId"));
		ctmtsDto.setReaderName(rs.getString("readerName"));
		ctmtsDto.setCtmtAmount(rs.getInt("ctmtAmount"));
		return ctmtsDto;
	}
}
