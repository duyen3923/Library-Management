package Model.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Admin;
import Model.Entity.Users;
import Model.Service.BookServiceImpl;
import Model.Service.UserInfoServiceImpl;

@Controller
public class UserInfoController {

	@Autowired
	UserInfoServiceImpl userInfoService = new UserInfoServiceImpl();

	@Autowired
	BookServiceImpl bookService = new BookServiceImpl();

	@RequestMapping(value = "userInfo", method = RequestMethod.GET)
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/UserProfile");
		Users reader = (Users) session.getAttribute("LoginReader");
		Users admin = (Users) session.getAttribute("loginAdmin");
		if (reader != null) {
			mv.addObject("user", reader);
		} else if (admin != null) {
			mv.addObject("user", admin);
		}
		return mv;
	}

	@RequestMapping(value = "updateUserInfo", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(HttpSession session, @ModelAttribute("user") Users user,
	                                  RedirectAttributes redirectAttributes) {
	    // Retrieve logged-in user from session
	    Users sessionUser = (Users) session.getAttribute("LoginReader");
	    if (sessionUser == null) {
	        sessionUser = (Users) session.getAttribute("loginAdmin");
	    }

	    if (sessionUser == null || sessionUser.getId() == 0) {
	        redirectAttributes.addFlashAttribute("messages", "Người dùng không hợp lệ!");
	        return new ModelAndView("redirect:/userInfo");
	    }

	    try {
	        int updateResult = userInfoService.updateUserInfo(sessionUser.getId(), user);
	        if (updateResult == -1) {
	            // Tên người dùng đã tồn tại
	            redirectAttributes.addFlashAttribute("messages", "Tên người dùng đã tồn tại cho người dùng khác!");
	        } else if (updateResult == -2) {
	            // Email đã tồn tại
	            redirectAttributes.addFlashAttribute("messages", "Email đã tồn tại cho người dùng khác!");
	        } else if (updateResult == -3) {
	            // Lỗi không xác định
	            redirectAttributes.addFlashAttribute("messages", "Cập nhật thất bại!");
	        } else {
	            // Cập nhật thành công
	            redirectAttributes.addFlashAttribute("messages", "Cập nhật thành công!");
	            // Cập nhật lại thông tin trong session
	            user.setId(sessionUser.getId()); // Đảm bảo ID không bị mất
	            if (session.getAttribute("LoginReader") != null) {
	                session.setAttribute("LoginReader", user);
	            }
	            if (session.getAttribute("loginAdmin") != null) {
	                session.setAttribute("loginAdmin", user);
	            }
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("messages", "Cập nhật thất bại!");
	        System.err.println("Error in updateUserInfo: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return new ModelAndView("redirect:/userInfo");
	}

	@RequestMapping(value = "userbook", method = RequestMethod.GET)
	public ModelAndView userBook(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/MyBook");
		Users reader = (Users) session.getAttribute("LoginReader");
		if (reader != null) {
			List<ChiTietMuonTraDto> list = userInfoService.GetBookBorrowedByReaderId(reader.getId());
			mv.addObject("ctmtDtos", list);
			mv.addObject("bookDtos", bookService.GetDataBooksDto());
			System.out.println("Fetched book details for reader ID: " + reader.getId());
		} else {
			System.out.println("Reader is null");
		}
		return mv;
	}

	@RequestMapping(value = "searchBorrowedBook", method = RequestMethod.POST)
	public ModelAndView searchBorrowedBook(HttpSession session, @RequestParam("searchKeyword") String searchKeyword) {
		ModelAndView mv = new ModelAndView("user/MyBook");
		Users reader = (Users) session.getAttribute("LoginReader");
		if (reader != null) {
			List<ChiTietMuonTraDto> list = userInfoService.SearchBorrowedBooks(reader.getId(), searchKeyword);
			mv.addObject("ctmtDtos", list);
			mv.addObject("bookDtos", bookService.GetDataBooksDto());
			System.out.println("Searched borrowed books for reader ID: " + reader.getId());
		} else {
			System.out.println("Reader is null");
		}
		return mv;
	}

}