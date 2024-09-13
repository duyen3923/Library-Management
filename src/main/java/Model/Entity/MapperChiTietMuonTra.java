package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperChiTietMuonTra implements RowMapper<ChiTietMuonTra> {

	public ChiTietMuonTra mapRow(ResultSet rs, int rowNum) throws SQLException {
		ChiTietMuonTra ct = new ChiTietMuonTra();
		ct.setId(rs.getInt("id"));
		ct.setBookId(rs.getInt("bookId"));
		ct.setNgayMuon(rs.getString("ngayMuon"));
		ct.setTrangThai(rs.getInt("trangThai"));
		ct.setNgayTra(rs.getString("ngayTra"));
		ct.setReaderId(rs.getInt("readerId"));
		ct.setAmount(rs.getInt("amount"));
		return ct;
	}

}
