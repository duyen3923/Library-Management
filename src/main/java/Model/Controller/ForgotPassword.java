package Model.Controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Mailer;
import Model.Entity.Users;
import Model.Service.AccountServiceImpl;

@Controller
public class ForgotPassword {
	@Autowired
	AccountServiceImpl accountService = new AccountServiceImpl();
	@Autowired
	Mailer mailer;
	// FORGOT PASSWORD
		@RequestMapping("ForgotPassword")
		public ModelAndView ForgotPasswordGET() {
			return new ModelAndView("user/forgotpassword");
		}
		@RequestMapping(value="ForgotPassword",method = RequestMethod.POST)
		public ModelAndView ForgotPasswordPOST(HttpServletRequest request,HttpSession session) {
			ModelAndView mv =  new ModelAndView("user/forgotpassword");
			String to = request.getParameter("email");
			int rs = accountService.Checkemail(to);
			if(rs == 0) {
				mv.addObject("message", "EMAIL NÀY CHƯA ĐƯỢC ĐĂNG KÝ");
				return mv;
			}
			String otp = getRandomNumber();
			String from = "huynhchitrung020503@gmail.com";
			String subject = "Quên mật khẩu";
			String body = "<html>" +
                    "<body>" +
                    "<h1>Your OTP: " + otp + "</h1>" +
                    "</body>" +
                    "</html>";
			// LOGIN BY EMAIL
			Users user = accountService.CheckAccByEmail(to);
			session.setAttribute("LoginReader", user);
			try {
				//mailer.send(from, to, subject, body);
				mailer.send(from, to, subject, body);
				
			} catch(Exception ex) {
				
			}
			mv.addObject("message", "THÀNH CÔNG");
			mv.setViewName("user/VerifyOTP");
			mv.addObject("otp", otp);
			return mv;
		}
		
		 public String getRandomNumber() {
		        Random random = new Random();
		        int randomNumber = 100000 + random.nextInt(900000); // Số ngẫu nhiên từ 100000 đến 999999
		        return String.valueOf(randomNumber);
		    }
}
