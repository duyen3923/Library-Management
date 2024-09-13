package Model.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Admin;
import Model.Entity.Users;
import Model.Service.AccountServiceImpl;

@Controller
public class VerifyOTP {
	@Autowired
	AccountServiceImpl accountService = new AccountServiceImpl();

	@RequestMapping(value = "VerifyPassword", method = RequestMethod.POST)
	public ModelAndView send() {
		  ModelAndView mv = new ModelAndView("user/ForgotToChangePassword");
		  return mv;
	}
	@RequestMapping(value = "ForgotToChangePassword", method = RequestMethod.POST)
	public ModelAndView ChangePassword(HttpServletRequest request,HttpSession session) {
		 ModelAndView mv = new ModelAndView("user/login");
		 String newPassword = request.getParameter("new_password");
	     String confirmPassword = request.getParameter("confirm_password");
	     Users loginReader = (Users) session.getAttribute("LoginReader");
	     Users loginAdmin = (Users)session.getAttribute("LoginAdmin");
	     String role = "";
	        int id ;
	        if(loginAdmin != null) {
	        	id = loginAdmin.getId();
	        	role = "admin";
	        }
	        else {
	        	id = loginReader.getId();
	        	role = "reader";
	        }
	     if(newPassword.equals(confirmPassword) == false) {
	        	mv.addObject("message", "MẬT KHẨU KHÔNG TRÙNG KHỚP");
	        	mv.addObject("user", new Users());
	        	return mv;
	       } else {
	           if(loginReader != null) {
	        	   accountService.ChangePassword(newPassword,id);
	           }
	      return new ModelAndView("redirect:trang-chu");
	}
}
}
