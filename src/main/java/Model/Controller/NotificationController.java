package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import Model.Entity.Notification;
import Model.Entity.Pagination;
import Model.Service.NotificationImpl;

@Controller
public class NotificationController extends BaseController {
	@Autowired
	NotificationImpl notificationImp = new NotificationImpl();

	@RequestMapping(value = "ThemThongBao", method = RequestMethod.GET)
	public ModelAndView ThemThongBaoGET() {
		ModelAndView mv = new ModelAndView("admin/ThemThongBao");
		mv.addObject("notification", new Notification());
		return mv;
	}

	@RequestMapping(value = "ThemThongBao", method = RequestMethod.POST)
	public ModelAndView ThemThongBao(@ModelAttribute("notification") Notification notification) {
		int rs = notificationImp.AddNotification(notification);
		ModelAndView mv = new ModelAndView("admin/ThemThongBao");
		if (rs > 0) {
			ModelAndView mv1 = new ModelAndView("admin/ThongBaoQuanLy");
			mv1.addObject("message", "THÊM THÔNG BÁO THÀNH CÔNG");
			mv1.addObject("notifications", notificationImp.GetAllNotification());
			return mv1;
		} else {
			mv.addObject("message", "THÊM THÔNG BÁO THẤT BẠI");
			return mv;
		}

	}

	@RequestMapping(value = "ThongBaoQuanLy", method = RequestMethod.GET)
	public ModelAndView ThongBaoQuanLy() {
		_mvShare.setViewName("admin/ThongBaoQuanLy");
		_mvShare.addObject("notifications", notificationImp.GetAllNotification());
		return _mvShare;
	}

	@RequestMapping(value = "/SuaThongBao/{id}", method = RequestMethod.GET)
	public ModelAndView SuaThongBaoGet(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/SuaThongBao");
		mv.addObject("selectedNoti", notificationImp.GetNotiFromId(id));
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/SuaThongBao/{id}", method = RequestMethod.POST)
	public ModelAndView SuaThongBaoPost(@PathVariable int id,
			@ModelAttribute("selectedNoti") Notification notification,RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("admin/SuaThongBao");
		mv.addObject("notifications", notificationImp.GetAllNotification());
		Notification notifiOld = notificationImp.GetNotiFromId(id);
		if(notification.getImage().length() == 0 || notification.getImage() == null) {
			notification.setImage(notifiOld.getImage());
		}
		int rs = notificationImp.UpdateNotification(id, notification);
		if (rs > 0) {
			redirectAttributes.addFlashAttribute("message", "SỬA THÔNG BÁO THÀNH CÔNG");
	        return new ModelAndView(new RedirectView("/QLTV/ThongBaoQuanLy"));
		} else
			mv.addObject("message", "SỬA THÔNG BÁO THẤT BẠI");

		return mv;
	}

	@RequestMapping(value = "/XoaThongBao/{id}", method = RequestMethod.POST)
	public ModelAndView XoaThongBao(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/ThongBaoQuanLy");

		int rs = notificationImp.DeleteNotification(id);
		mv.addObject("notifications", notificationImp.GetAllNotification());
		if (rs > 0) {
			mv.addObject("message", "Xoá thành công");

		} else
			mv.addObject("message", "Xoá thất bại");

		return mv;
	}

	// User
	@RequestMapping(value = "/notification/page")
	public ModelAndView ThongBao() {
		ModelAndView mv = new ModelAndView("user/notification");
		mv.addObject("notifications", _HomeService.GetDataNotification());
		return mv;
	}

	@RequestMapping(value = "/notification/page", method = RequestMethod.GET)
	public String ThongBao(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "2") int pageSize,
			@RequestParam(defaultValue = "0") int month, Model model) {

		System.out.println("Received request for page: " + page + ", pageSize: " + pageSize + ", month: " + month);

		Pagination<Notification> pagination;
		if (month == 0) {
			pagination = notificationImp.getAllByPage(page, pageSize);
		} else {
			pagination = notificationImp.getNotificationsByPageAndMonth(page, pageSize, month);
		}

		System.out.println("Total pages: " + pagination.getTotalPages());

		// Nếu tháng đó hiện chưa có thông báo nào
		if (pagination.getContent().isEmpty()) {
			model.addAttribute("message", "Tháng này hiện tại không có thông báo nào");
			model.addAttribute("selectedMonth", month);
			return "user/notification";
		}

		// Redirect to first page if page number is less than 1
		if (page < 1) {
			System.out.println("Redirecting to page 1");
			return "redirect:/notification/page?page=1&month=" + month;
		}

		// Redirect to the last page if the requested page number is greater than total
		// pages
		if (page > pagination.getTotalPages()) {
			System.out.println("Redirecting to last page: " + pagination.getTotalPages());
			return "redirect:/notification/page?page=" + pagination.getTotalPages() + "&month=" + month;
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("selectedMonth", month);

		return "user/notification";
	}

}
