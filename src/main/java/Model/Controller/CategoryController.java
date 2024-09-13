
package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Model.Entity.Categories;
import Model.Service.CategoryServiceImpl;

@Controller
public class CategoryController {
	@Autowired
	CategoryServiceImpl category = new CategoryServiceImpl();
	
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public ModelAndView tacGiaQuanLy() {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		mv.addObject("categories", category.getDataCategories());
		mv.addObject("addCategory", new Categories());
		return mv;
	}
	
	@RequestMapping(value ="category", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("addCategory") Categories c,RedirectAttributes re) {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		mv.addObject("categories", category.getDataCategories());
		int rs = category.addCategory(c);
		if (rs > 0) {
			re.addFlashAttribute("message", "Thêm thể loại thành công");
			mv.addObject("categories", category.getDataCategories());
		}
		else if(rs == -1){
			re.addFlashAttribute("message", "Thêm thể loại thất bại, tên thể loại đã tồn tại!");
		}
		else {
			re.addFlashAttribute("message", "Thêm thể loại thất bại");
		}
		return  "redirect:/category";
	}
	
	@RequestMapping(value = "deleteCategory/{categoryId}", method = RequestMethod.POST)
	public String deleteAuthor(@PathVariable int categoryId, Categories c, RedirectAttributes re) {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		int rs = category.deleteCategory(categoryId); 
		if (rs == 1) {
			re.addFlashAttribute("message", "Xóa thể loại thành công");
			mv.addObject("categories",category.getDataCategories());
			return "redirect:/category"; 
		} else {
			re.addFlashAttribute("message", "Xóa thể loại thất bại, vẫn còn sách trong thể loại này!");
			mv.addObject("categories",category.getDataCategories());
			return "redirect:/category"; 
		}
	}
	
	@RequestMapping(value = "/editCategory/{categoryId}", method = RequestMethod.GET)
	public ModelAndView editGet(@PathVariable int categoryId) {
		ModelAndView mv = new ModelAndView("admin/SuaTheLoai");
		mv.addObject("selectCategory", category.getCateFromId(categoryId));
		mv.addObject("id", categoryId);
		return mv;
	}

	@RequestMapping(value = "/editCategory/{categoryId}", method = RequestMethod.POST)
	public String editPost(@PathVariable int categoryId, @ModelAttribute("selectCategory") Categories c, RedirectAttributes re) {
		int rs = category.updateCategory(categoryId, c);
		if (rs > 0) {
			re.addFlashAttribute("message", "Sửa thể loại thành công");
		} else {
			re.addFlashAttribute("message", "Sửa thể loại thất bại");		
		}
		return "redirect:/category";
	}
	
	@RequestMapping(value ="searchCategory", method = RequestMethod.POST)
	public ModelAndView searchReader(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		mv.addObject("categories", category.GetDataSearchCategories(name));
		mv.addObject("addCategory", new Categories());
		return mv;
	}
}
