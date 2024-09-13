package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Model.Entity.Authors;
import Model.Entity.Pagination;
import Model.Service.AuthorServiceImpl;

@Controller
public class AuthorController {
	@Autowired
	AuthorServiceImpl authorImpl = new AuthorServiceImpl();

//	@RequestMapping(value = "authors", method = RequestMethod.GET)
//	public ModelAndView TacGiaQuanLy() {
//		ModelAndView mv = new ModelAndView("admin/author");
//		mv.addObject("authors", authorImpl.getDataAuthor());
//		return mv;
//	}

	@RequestMapping(value = "authors/page", method = RequestMethod.GET)
	public String TacGiaQuanLy(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, Model model) {
		if (page < 1) {
			return "redirect:/authors/page?page=1";
		}

		Pagination<Authors> pagination = authorImpl.getAllByPage(page, pageSize);
		if (page > pagination.getTotalPages()) {
			return "redirect:/authors/page?page=" + pagination.getTotalPages();
		}

		model.addAttribute("pagination", pagination);
		return "admin/author";
	}

	@RequestMapping(value = "addAuthor", method = RequestMethod.GET)
	public ModelAndView ThemTacGia() {
		ModelAndView mv = new ModelAndView("admin/ThemTacGia");
		mv.addObject("authors", authorImpl.getDataAuthor());
		mv.addObject("insertAuthor", new Authors());
		return mv;
	}

	@RequestMapping(value = "addAuthor", method = RequestMethod.POST)
	public String ThemTacGia(@ModelAttribute("insertAuthor") Authors authors, RedirectAttributes redirectAttributes) {
		int rs = authorImpl.insertAuthor(authors);
//		ModelAndView mv = new ModelAndView("admin/ThemTacGia");
		if (rs > 0) {
			redirectAttributes.addFlashAttribute("message", "Thêm thành công");
			redirectAttributes.addFlashAttribute("authors", authorImpl.getDataAuthor());
		} else {
			redirectAttributes.addFlashAttribute("message", "Thêm thất bại");
		}
		return "redirect:/authors/page";
	}

	@RequestMapping(value = "/updateAuthor/{id}", method = RequestMethod.GET)
	public ModelAndView updateAuthor(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/updateAuthor");
		mv.addObject("editAuthor", authorImpl.getAuFromId(id));
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/updateAuthor/{id}", method = RequestMethod.POST)
	public String updateAuthor(@PathVariable int id, @ModelAttribute("editAuthor") Authors authors,
			RedirectAttributes redirectAttributes) {
//		ModelAndView mv = new ModelAndView("admin/updateAuthor");
		int rs = authorImpl.updateAuthor(id, authors);
		if (rs > 0) {
			redirectAttributes.addFlashAttribute("message", "Sửa tác giả thành công");
		} else {
			redirectAttributes.addFlashAttribute("message", "Sửa tác giả thành công");
		}
		return "redirect:/authors/page";
	}

	@RequestMapping(value = "/deleteAuthor/{id}", method = RequestMethod.POST)
	public String deleteAuthor(@PathVariable int id, RedirectAttributes redirectAttributes) {
		int rs = authorImpl.deleteAuthor(id);
		if (rs > 0) {
			redirectAttributes.addFlashAttribute("message", "Xoá thành công");
		} else {
			redirectAttributes.addFlashAttribute("message", "Xoá thất bại");
		}
		return "redirect:/authors/page";
	}

	@RequestMapping(value = "/searchAuthors", method = RequestMethod.GET)
	public String searchAuthors(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, @RequestParam("name") String name, Model model) {
		if (page < 1) {
			return "redirect:/searchAuthors?page=1&name=" + name;
		}

		Pagination<Authors> pagination = authorImpl.searchAuthor(name, page, pageSize);
		if (page > pagination.getTotalPages()) {
			return "redirect:/searchAuthors?page=" + pagination.getTotalPages() + "&name=" + name;
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("name", name);
		return "admin/author";
	}

}
