
package Model.Dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import Model.Dto.ChiTietMuonTraDto;
import Model.Dto.ColumnChartMapper;
import Model.Dto.ThongKeDto;
import Model.Dto.ThongKeDtoMapper;
import Model.Entity.Authors;
import Model.Entity.ThongKeAuthorMapper;
import Model.Entity.ThongKeReaderMapper;


@Repository
public class ThongKeDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public float MatDoMuonSach() {
		DecimalFormat df = new DecimalFormat("0.00");
		int count = TongsoSach();
		int count1 = SoSachDangDuocMuon();
		float rs = (float) count1 / count;
		return Float.parseFloat(df.format(rs));
	}

	public int SoLuongReader() {
		String sql = "SELECT COALESCE(COUNT(id), 0) FROM user WHERE isAdmin = 0";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		return count != null ? count : 0;
	}

	public int SoLuongSachConlai() {
		int count = TongsoSach() - SoSachDangDuocMuon();
		return count;
	}

	public int TongsoSach() {
		String sql = "SELECT COALESCE(COUNT(id), 0) FROM book";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		return count != null ? count : 0;
	}

	public int SoSachDangDuocMuon() {
		String sql1 = "SELECT COALESCE(SUM(amount),0) FROM chitietmuontra WHERE trangThai = 0";
		Integer count1 = _jdbcTemplate.queryForObject(sql1, Integer.class);
		return count1 != null ? count1 : 0;
	}


	public List<ThongKeDto> GetDataPieChart(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT c.name as categoryName, COUNT(DISTINCT b.id) AS amount FROM category c LEFT JOIN book b ON b.categoryId = c.id GROUP BY c.id, c.name;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	public List<ThongKeDto> TheLoaiMax() {
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT  category.name as categoryName, COALESCE(COUNT(book.id), 0) AS amount FROM category LEFT JOIN book ON category.id = book.categoryId GROUP BY category.id, category.name ORDER BY amount DESC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	
	public List<ThongKeDto> TheLoaiMin() {
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT category.name as categoryName, COALESCE(COUNT(book.id), 0) AS amount FROM category LEFT JOIN book ON category.id = book.categoryId GROUP BY category.id, category.name ORDER BY amount ASC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	
	// COLUMN CHART 
	public List<ThongKeDto> ColumnChart(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT YEAR(ngayMuon) AS year,MONTH(ngayMuon) AS month,IFNULL(SUM(amount), 0) AS soluongMuon FROM chitietmuontra WHERE YEAR(ngayMuon) = 2024  GROUP BY YEAR(ngayMuon), MONTH(ngayMuon)ORDER BY Year, Month;";
		list = _jdbcTemplate.query(sql, new ColumnChartMapper());
		return list;
	}
	
	public List<ThongKeDto> mostFavoriteCategory(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT  c.name AS categoryName, COUNT(*) AS amount FROM category c JOIN book b ON c.id =b.categoryId JOIN chitietmuontra cm ON b.id = cm.bookId GROUP BY c.id, c.name ORDER BY amount DESC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}

	public List<ThongKeDto> leastFavoriteCategory(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT  c.name AS categoryName, COUNT(*) AS amount FROM category c JOIN book b ON c.id =b.categoryId JOIN chitietmuontra cm ON b.id = cm.bookId GROUP BY c.id, c.name ORDER BY amount ASC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	public List<ChiTietMuonTraDto> thongKeReader(){
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT \r\n" + 
				"    r.id AS readerId, \r\n" + 
				"    r.name as readerName, \r\n" + 
				"   COALESCE( SUM(ct.amount), 0) AS bookAmount,\r\n" + 
				"    SUM(CASE WHEN ct.trangThai = 0 THEN ct.amount ELSE 0 END) AS ctmtAmount\r\n" + 
				"FROM \r\n" + 
				"    (SELECT id,name FROM user WHERE isAdmin = 0) r \r\n" + 
				"JOIN \r\n" + 
				"    chitietmuontra ct ON r.id = ct.readerId \r\n" + 
				"GROUP BY \r\n" + 
				"    r.id, r.name;\r\n" + 
				"" ;
		list = _jdbcTemplate.query(sql, new ThongKeReaderMapper());
		return list;
	}
	
	public List<Authors> thongkeTacgia(){
		List<Authors> list = new ArrayList<Authors>();
		String sql = "SELECT\r\n" + 
				"    a.id AS id,\r\n" + 
				"    a.name AS name,\r\n" + 
				"    b.name AS bookname,\r\n" + 
				"    COALESCE(COUNT(ctm.id), 0)  AS amount\r\n" + 
				"FROM\r\n" + 
				"    chitietmuontra ctm\r\n" + 
				"JOIN\r\n" + 
				"    book b ON ctm.bookId = b.id\r\n" + 
				"JOIN\r\n" + 
				"    author a ON b.authorId = a.id\r\n" + 
				"GROUP BY\r\n" + 
				"    a.id, a.name\r\n" + 
				"ORDER BY\r\n" + 
				"    amount DESC\r\n" + 
				";";
		list = _jdbcTemplate.query(sql, new ThongKeAuthorMapper());
		return list;
	}

}
