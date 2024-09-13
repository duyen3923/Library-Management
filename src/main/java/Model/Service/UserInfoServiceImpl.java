package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.UserInfoDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Books;
import Model.Entity.Users;

@Service
public class UserInfoServiceImpl {
	@Autowired
	private UserInfoDao userInfoDao;

	
	public int updateUserInfo(int id, Users user) {
		return userInfoDao.updateInfoUser(id, user);
	}
	
	public List<ChiTietMuonTraDto>  GetBookBorrowedByReaderId(int readerId) {
		return userInfoDao.getBookBorrowedByReaderId(readerId);
	}
	
	public List<ChiTietMuonTraDto> SearchBorrowedBooks(int readerId, String searchKeyword) {
		return userInfoDao.searchBorrowedBooks(readerId, searchKeyword);
	}
}