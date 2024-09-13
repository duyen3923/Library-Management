package Model.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Books;
import Model.Entity.BooksMapper;
import Model.Entity.ChiTietMuonTra;
import Model.Entity.MapperChiTietMuonTra;

@Repository
public class ChiTietMuonTraDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<ChiTietMuonTra> GetDataChiTietMuonTra(){
		List<ChiTietMuonTra> list = new ArrayList<ChiTietMuonTra>();
		String sql = "SELECT * FROM chitietmuontra";
		list = _jdbcTemplate.query(sql, new MapperChiTietMuonTra());
		return list;
	} 
	
	public int insertMuonTra(ChiTietMuonTra ct) {
		/* KIEM TRA SO LUONG -> GIAM -> INSERT */
		/*-1: Sach khong du 
		-2: Vuot so luong muon*/
		String sql = "SELECT amount FROM book WHERE id = ?"; // dem so sách còn lại
		Integer amount = _jdbcTemplate.queryForObject(sql, Integer.class, ct.getBookId());
		String sql0 = "SELECT SUM(amount) FROM chitietmuontra WHERE readerId = ? AND trangThai = 0"; // dem so sách da muon chua tra
		Integer daMuon = _jdbcTemplate.queryForObject(sql0, Integer.class, ct.getReaderId());
		if (daMuon == null) {
            daMuon = 0;
        }
		if ((daMuon + ct.getAmount()) > 5) {
			return -2;
		} else if( amount >= ct.getAmount()) { 
			String sql1 = "UPDATE book SET amount =  ? WHERE id = ?"; // cập nhật lại số lượng sách còn lại
			int soluong = amount - ct.getAmount();
			int rs1 = _jdbcTemplate.update(sql1,soluong,ct.getBookId());
			if(rs1 < 0) {
				return -3;
			}
			StringBuffer sql2 = new StringBuffer();
			 sql2.append ( "INSERT INTO chitietmuontra(bookId,ngayMuon,ngayTra,readerId,amount) VALUES('"+ ct.getBookId()+"','"+ ct.getNgayMuon()+"','"+ ct.getNgayTra()+"','"+ct.getReaderId()+"','"+ct.getAmount()+"')");
			int ctmt = _jdbcTemplate.update(sql2.toString());
			return ctmt;
		} 
		
		return -1;
	}
	
}
