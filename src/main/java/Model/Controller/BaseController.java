package Model.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import Model.Service.HomeServiceImpl;



// Cac object dung chung
@Controller
public class BaseController {
	@Autowired
	HomeServiceImpl _HomeService;
	public ModelAndView _mvShare = new ModelAndView();

}
