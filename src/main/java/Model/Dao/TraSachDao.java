package Model.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Books;
import Model.Entity.BooksMapper;
import Model.Entity.ChiTietMuonTra;
import Model.Entity.ChiTietMuonTraDtoMapper;
import Model.Entity.MapperChiTietMuonTra;

@Repository
public class TraSachDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<ChiTietMuonTra> GetDataChiTietTra(){
		List<ChiTietMuonTra> list = new ArrayList<ChiTietMuonTra>();
		String sql = "SELECT * FROM chitietmuontra WHERE trangThai = 0";
		list = _jdbcTemplate.query(sql, new MapperChiTietMuonTra());
		return list;
	} 
	
	public List<ChiTietMuonTraDto> GetDataChiTietTraDto() {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT chitietmuontra.id as ctmtId, chitietmuontra.bookId, chitietmuontra.ngayMuon as ctmtNgayMuon,"
				+ "chitietmuontra.trangThai as ctmtTrangThai,chitietmuontra.ngayTra as ctmtNgayTra,chitietmuontra.amount as ctmtAmount,"
				+ "book.name as bookName,book.amount as bookAmount,reader.id as readerId,reader.name as readerName"
				+ " FROM chitietmuontra, book,(SELECT id,name FROM user WHERE isAdmin = 0) reader"
				+ " WHERE chitietmuontra.bookId = book.id and chitietmuontra.readerId  = reader.id and trangThai = 0";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper());
		return list;
	}
	
	public List<ChiTietMuonTraDto> GetDataSearchChiTietTraDto(String name) {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT " + "cmt.id AS ctmtId," + "cmt.bookId," + "cmt.ngayMuon AS ctmtNgayMuon,"
				+ "cmt.trangThai AS ctmtTrangThai," + "cmt.ngayTra AS ctmtNgayTra," + "cmt.amount AS ctmtAmount,"
				+ "b.name AS bookName," + "b.amount AS bookAmount," + "r.id AS readerId," + "r.name AS readerName "
				+ "FROM " + "chitietmuontra cmt " + "JOIN " + "book b ON cmt.bookId = b.id " + "JOIN "
				+ "(SELECT id,name FROM user WHERE isAdmin = 0) r ON cmt.readerId = r.id " + "WHERE " + "cmt.trangThai = 0 AND r.name LIKE ?";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), "%" + name + "%");
		return list;
	} 
	
	public ChiTietMuonTra getCTMTFromId(int id) {
		String sql = "SELECT * FROM chitietmuontra WHERE id = ?";
		ChiTietMuonTra c = _jdbcTemplate.queryForObject(sql, new MapperChiTietMuonTra(), id);
		return c;
	}
	public Books timBookTheoId(int id) {
		String sql ="SELECT * FROM book WHERE id = ?";
		Books b = _jdbcTemplate.queryForObject(sql, new Object[]{id}, new BooksMapper());
		return b;
	}
	
	public int updateAmountTra(int id,int amount) {
		String sql = "UPDATE book SET amount = ? WHERE id = ?";
		Books b = timBookTheoId(id);
		int temp = b.getAmount() + amount;
		int ctmt = _jdbcTemplate.update(sql, temp,id);
		return ctmt;
	}
	
	public int updateTraSach(int id) {
		String sql = "UPDATE chitietmuontra SET ngayTra = ?,trangThai = 1 WHERE id = ?";
		LocalDate ngayTra = LocalDate.now();
		int rs = _jdbcTemplate.update(sql,ngayTra,id);
		if (rs == 0) {
			return - 1;
        }
		ChiTietMuonTra c = getCTMTFromId(id);
		rs = updateAmountTra(c.getBookId(), c.getAmount());
		if (rs == 0) {
           return -1 ;
        }
		return rs;
	}
}
