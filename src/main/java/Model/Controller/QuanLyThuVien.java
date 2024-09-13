package Model.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuanLyThuVien extends BaseController{
	@RequestMapping(value ="/QuanLyThuVien")
	public ModelAndView Quanly() {
		return new ModelAndView("admin/QuanLyThuVien");
	}
}
