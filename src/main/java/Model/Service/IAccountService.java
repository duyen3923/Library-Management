package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Model.Entity.Books;
import Model.Entity.Users;

@Service
public interface IAccountService {
	public int AddAccount(Users reader);
	public Users CheckAccount(Users reader);
}