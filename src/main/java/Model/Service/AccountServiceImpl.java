package Model.Service;


import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChangePasswordDao;
import Model.Dao.ForgotPasswordDao;
import Model.Dao.LoginDao;
import Model.Dao.ReaderDao;
import Model.Dao.RegisterDao;
import Model.Entity.Admin;
import Model.Entity.Users;


@Service
public class AccountServiceImpl implements IAccountService{
	@Autowired
	LoginDao loginDao = new LoginDao();
	
	@Autowired
	RegisterDao registerDao = new RegisterDao();
	
	@Autowired
	ChangePasswordDao changePassword = new ChangePasswordDao();
	
	@Autowired
	ForgotPasswordDao forgotPassword = new ForgotPasswordDao();
	// REGISTER

	@Autowired
	private ReaderDao readerDao  ;
	
	public int AddAccount(Users user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt(12)));
		if(forgotPassword.CheckEmail(user.getEmail()) == 1) {
			return 3;
		}
		return registerDao.AddAccount(user);
	}
	
	// LOGIN
	public Users CheckAccount(Users user) {
		String password = user.getPassword();
		user = loginDao.GetUserByAccount(user.getUsername());
		if(user != null)
		{
			if(BCrypt.checkpw(password, user.getPassword()))
			{
				return user;
			} 
		}
	return null;
	}
	
	
	// CHANGE PASSWORD
	public int ChangePassword(String password, int id) {
			return changePassword.ChangePassword(BCrypt.hashpw(password,BCrypt.gensalt(12)), id);
	}
	public int checkOldPassword(String password,String username) {
		return changePassword.checkOldPassword(password, username);
	}
	
	// CEHCK EMAIL EXISTED ? 
	public int Checkemail(String email) {
		return forgotPassword.CheckEmail(email);
	}
	public Users CheckAccByEmail(String email) {
		Users user = loginDao.GetUserByEmail(email);
		return user;
	}
	
	public List<Users> GetDataReader(){
		return readerDao.GetDataReader();
	}
	
	public List<Users> GetDataSearchReader(String name){
		return readerDao.GetDataSearchReader(name);
	}
	
}
