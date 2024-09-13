package Model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Admin;
import Model.Entity.ChiTietMuonTraDtoMapper;
import Model.Entity.Users;
import Model.Entity.UsersMapper;

@Repository
public class UserInfoDao {
	@Autowired
	private JdbcTemplate _jdbcTemplate;

	public int updateInfoUser(int id, Users user) {
		try {
			// Kiểm tra thông tin hiện tại của người dùng
			String getCurrentUserSql = "SELECT id, name, username, password, email, isAdmin FROM user WHERE id = ?";
			List<Users> currentUserList = _jdbcTemplate.query(getCurrentUserSql, new UsersMapper(), id);
			Users currentUser = currentUserList.get(0);

			// Kiểm tra xem tên người dùng đang thay đổi đã tồn tại cho người dùng khác nếu có thay đổi
			if (!currentUser.getUsername().equals(user.getUsername())) {
				String checkUsernameSql = "SELECT COUNT(*) FROM user WHERE username = ? AND id != ?";
				int usernameCount = _jdbcTemplate.queryForObject(checkUsernameSql, Integer.class, user.getUsername(),
						id);
				if (usernameCount > 0) {
					return -1; // Tên người dùng đã tồn tại cho người dùng khác
				}
			}

			// Kiểm tra xem email mới đã tồn tại cho người dùng khác nếu có thay đổi
			if (!currentUser.getEmail().equals(user.getEmail())) {
				String checkEmailSql = "SELECT COUNT(*) FROM user WHERE email = ? AND id != ?";
				int emailCount = _jdbcTemplate.queryForObject(checkEmailSql, Integer.class, user.getEmail(), id);
				if (emailCount > 0) {
					return -2; // Email đã tồn tại cho người dùng khác
				}
			}

			String sql = "UPDATE user SET name = ?, username = ?, email = ? WHERE id = ?";
			return _jdbcTemplate.update(sql, user.getName(), user.getUsername(), user.getEmail(), id);
		} catch (Exception e) {
			System.err.println("Error updating user info: " + e.getMessage());
			e.printStackTrace();
			return -3; // Lỗi không xác định
		}
	}

	public List<ChiTietMuonTraDto> getBookBorrowedByReaderId(int readerId) {
		String sql = "SELECT " + "ctm.id AS ctmtId, " + "ctm.bookId, " + "ctm.ngayMuon AS ctmtNgayMuon, "
				+ "ctm.trangThai AS ctmtTrangThai, " + "ctm.ngayTra AS ctmtNgayTra, " + "ctm.amount AS ctmtAmount, "
				+ "b.name AS bookName, " + "b.amount AS bookAmount, " + "r.id AS readerId, " + "r.name AS readerName "
				+ "FROM chitietmuontra ctm " + "JOIN book b ON ctm.bookId = b.id "
				+ "JOIN (SELECT id,name FROM user WHERE isAdmin = 0) r ON ctm.readerId = r.id "
				+ "WHERE ctm.readerId = ? AND ctm.trangThai = 0";
		System.out.println("Executing SQL: " + sql + " with readerId: " + readerId); // Dòng kiểm tra
		List<ChiTietMuonTraDto> list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), readerId);
		System.out.println("Fetched ctmtDtos: " + list); // Dòng kiểm tra
		return list;
	}

	public List<ChiTietMuonTraDto> searchBorrowedBooks(int readerId, String searchKeyword) {
		String sql = "SELECT " + "ctm.id AS ctmtId, " + "ctm.bookId, " + "ctm.ngayMuon AS ctmtNgayMuon, "
				+ "ctm.trangThai AS ctmtTrangThai, " + "ctm.ngayTra AS ctmtNgayTra, " + "ctm.amount AS ctmtAmount, "
				+ "b.name AS bookName, " + "b.amount AS bookAmount, " + "a.name, " + "r.id AS readerId, "
				+ "r.name AS readerName " + "FROM chitietmuontra ctm " + "JOIN book b ON ctm.bookId = b.id "
				+ "JOIN author a ON b.authorId = a.id "
				+ "JOIN (SELECT id,name FROM user WHERE isAdmin = 0) r ON ctm.readerId = r.id "
				+ "WHERE ctm.readerId = ? " + "AND ctm.trangThai = 0 " + "AND (b.name LIKE ? OR a.name LIKE ?)"; // Thêm điều kiện tìm kiếm cho tên sách và tên tác giả

		String keyword = "%" + searchKeyword + "%"; // Thêm dấu % cho phần từ khóa tìm kiếm

		System.out.println(
				"Executing SQL: " + sql + " with readerId: " + readerId + " and search keyword: " + searchKeyword); // Dòng
																													// kiểm
																													// tra
		List<ChiTietMuonTraDto> list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), readerId, keyword,
				keyword);
		System.out.println("Fetched ctmtDtos: " + list); // Dòng kiểm tra
		return list;
	}

}