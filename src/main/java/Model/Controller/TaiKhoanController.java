package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Users;
import Model.Service.AccountServiceImpl;

@Controller
public class TaiKhoanController extends BaseController {

	@Autowired
	AccountServiceImpl  taiKhoan = new AccountServiceImpl();
	
	@RequestMapping(value = "/dsTaiKhoan")
	public ModelAndView dsTaiKhoan() {
		ModelAndView mv = new ModelAndView("admin/DanhSachTaiKhoan");
		mv.addObject("taiKhoan", taiKhoan.GetDataReader());
		return mv;
	}
	
	@RequestMapping(value = "timReader", method = RequestMethod.POST)
	public ModelAndView searchReader(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("admin/DanhSachTaiKhoan");
		List<Users> searchResults = taiKhoan.GetDataSearchReader(name);
		mv.addObject("taiKhoan", searchResults);
		return mv;
	}
	
	@RequestMapping(value = "themTaiKhoan", method = RequestMethod.GET)
	public ModelAndView DangKy() {
		_mvShare.setViewName("admin/ThemTaiKhoan");
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}
// modelAttribute controller = modelAttribute view 
	@RequestMapping(value = "themTaiKhoan", method = RequestMethod.POST)
	public ModelAndView createAccount(@ModelAttribute("user")Users reader) {
		ModelAndView mv = new ModelAndView("admin/ThemTaiKhoan");
		int count = taiKhoan.AddAccount(reader);
		if (count == 1) {
			mv.addObject("message", "Thêm tài khoản người đọc thành công");
			return new ModelAndView("redirect:dsTaiKhoan");
		} else if (count == 2) {
			mv.setViewName("admin/ThemTaiKhoan");
			mv.addObject("message", "Username đã tồn tại");
			return mv;
		} else if (count == 3) {
			mv.setViewName("admin/ThemTaiKhoan");
			mv.addObject("message", "Email đã tồn tại");
			return mv;
		}
		else  {
			mv.setViewName("admin/ThemTaiKhoan");
			mv.addObject("message", "Thêm tài khoản người đọc thất bại");
			return mv;
		}
		// _mvShare.addObject("status",true)
		
	}
}
