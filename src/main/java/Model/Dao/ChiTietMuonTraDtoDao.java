package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTraDtoMapper;
import Model.Entity.Pagination;

@Repository
public class ChiTietMuonTraDtoDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<ChiTietMuonTraDto> GetDataChiTietMuonTraDto() {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT " + "ctmt.id AS ctmtId, " + "ctmt.bookId, " + "ctmt.ngayMuon AS ctmtNgayMuon, " + "ctmt.trangThai AS ctmtTrangThai, " + 
				"ctmt.ngayTra AS ctmtNgayTra, " + "ctmt.amount AS ctmtAmount, " + "b.name AS bookName, " + "b.amount AS bookAmount, " + 
				"r.id AS readerId, " + "r.name AS readerName " + "FROM " + "chitietmuontra ctmt " + "JOIN " + "book b ON ctmt.bookId = b.id " + 
				"JOIN " + "(SELECT id,name FROM user WHERE isAdmin = 0) r ON ctmt.readerId = r.id";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper());
		return list;
	}

	public List<ChiTietMuonTraDto> GetDataSearchChiTietMuonTraDto(String name) {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT " + "cmt.id AS ctmtId, " + "cmt.bookId, " + "cmt.ngayMuon AS ctmtNgayMuon, " + "cmt.trangThai AS ctmtTrangThai, " +
	             "cmt.ngayTra AS ctmtNgayTra, " + "cmt.amount AS ctmtAmount, " + "b.name AS bookName, " + "b.amount AS bookAmount, " +
	             "r.id AS readerId, " + "r.name AS readerName " + "FROM " + "chitietmuontra cmt " + "JOIN " +"book b ON cmt.bookId = b.id " +
	             "JOIN " + "(SELECT id,name FROM user WHERE isAdmin = 0) r ON cmt.readerId = r.id " + "WHERE " + "r.name LIKE ?";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), "%" + name + "%");
		return list;
	}
	
}
