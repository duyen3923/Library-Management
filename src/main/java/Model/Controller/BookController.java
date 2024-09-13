package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Model.Dto.BooksDto;
import Model.Entity.Categories;
import Model.Entity.Pagination;
import Model.Entity.SearchBook;
import Model.Service.BookServiceImpl;

@Controller
public class BookController extends BaseController {
	@Autowired
	BookServiceImpl book = new BookServiceImpl();

	// ADMIN
//	@RequestMapping(value = "/dausach", method = RequestMethod.GET)
//	public ModelAndView sachQuanLy() {
//		ModelAndView mv = new ModelAndView("admin/DauSachQuanLy");
//		mv.addObject("books", book.GetDataBooks());
//		mv.addObject("categories", book.getDataCategories());
//		mv.addObject("authors", book.getDataAuthor());
//		mv.addObject("insertBook", new BooksDto());
//		return mv;
//	}

	@RequestMapping(value = "/dausach")
	public String sachQuanLy(@RequestParam(name = "page", defaultValue = "1") int pageNo,
			@RequestParam(name = "size", defaultValue = "6") int pageSize, ModelMap model) {
		Pagination<BooksDto> bookPage = book.getBookByPage(pageNo, pageSize);
		model.addAttribute("bookspage", bookPage);
		model.addAttribute("categories", book.getDataCategories());
	    model.addAttribute("authors", book.getDataAuthor());
	    model.addAttribute("insertBook", new BooksDto());
		return "admin/DauSachQuanLy";
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.GET)
	public String ThemDauSach(ModelMap model) {
		model.addAttribute("books", book.GetDataBooks());
		model.addAttribute("categories", book.getDataCategories());
		model.addAttribute("authors", book.getDataAuthor());
		model.addAttribute("insertBook", new BooksDto());
		return "admin/ThemDauSach";
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String ThemDauSach(@ModelAttribute("insertBook") BooksDto books, RedirectAttributes redirectAttributes) {
		int rs = book.insertBook(books);
		if (rs > 0) {
			redirectAttributes.addFlashAttribute("message", "Thêm thành công");
			redirectAttributes.addFlashAttribute("books", book.GetDataBooks());
			redirectAttributes.addFlashAttribute("categories", book.getDataCategories());
			redirectAttributes.addFlashAttribute("authors", book.getDataAuthor());
		} else {
			redirectAttributes.addFlashAttribute("message", "Thêm thất bại");
		}
		return "redirect:/dausach";
	}
	// ADMIN
		// Delete book
		@RequestMapping(value = "/deleteBook/{bookId}", method = RequestMethod.POST)
		public String deleteBook(@PathVariable int bookId, RedirectAttributes redirectAttributes) {
			int rs = book.deleteBook(bookId);
			if (rs > 0) {
				redirectAttributes.addFlashAttribute("message", "Xoá thành công");
			} else {
				redirectAttributes.addFlashAttribute("message", "Xoá thất bại");
			}
			return "redirect:/dausach";
		}

		// Show edit book form
		@RequestMapping(value = "editBook/{bookId}", method = RequestMethod.GET)
		public String updateBookGet(@PathVariable("bookId") int bookId, ModelMap model) {
			BooksDto booksDto = book.getBookById(bookId);
			model.addAttribute("editBook", booksDto);
			model.addAttribute("categories", book.getDataCategories());
			model.addAttribute("authors", book.getDataAuthor());
			return "admin/SuaDauSach";
		}

		// Update book
		@RequestMapping(value = "/editBook/{id}", method = RequestMethod.POST)
		public String updateBookPost(@PathVariable("id") int id, @ModelAttribute("editBook") BooksDto booksDto,
				RedirectAttributes redirectAttributes) {
			System.out.println("Updating book with ID: " + id);
			int rs = book.updateBook(id, booksDto);
			if (rs > 0) {
				redirectAttributes.addFlashAttribute("message", "Sửa đầu sách thành công");
			} else {
				redirectAttributes.addFlashAttribute("message", "Sửa đầu sách thất bại");
			}
			return "redirect:/dausach";
		}
		@RequestMapping(value = "/searchBook", method = RequestMethod.GET)
		public String searchBooks(@RequestParam(name = "page", defaultValue = "1") int pageNo,
		                          @RequestParam(name = "size", defaultValue = "6") int pageSize,
		                          @RequestParam(name = "name") String name,
		                          ModelMap model) {
		    Pagination<BooksDto> searchResult = book.searchBook(pageNo, pageSize, name);
		    model.addAttribute("bookspage", searchResult);
		    model.addAttribute("categories", book.getDataCategories());
		    model.addAttribute("authors", book.getDataAuthor());
		    model.addAttribute("insertBook", new BooksDto());
		    return "admin/DauSachQuanLy";
		}

		
//USER
		
//	@RequestMapping(value = "/sach")
//	public ModelAndView Sach() {
//		ModelAndView mv = new ModelAndView("user/sach");
//		mv.addObject("books", _HomeService.GetDataBooks());
//		mv.addObject("categories", _HomeService.getDataCategories());
//		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
//		mv.addObject("search", new SearchBook());
//		return mv;
//	}
	@RequestMapping(value = "/sach", method = RequestMethod.GET)
	public String Sach(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int pageSize,
			@RequestParam(required = false) Integer categoryId, ModelMap model) {
		Pagination<BooksDto> pagination;
		List<Categories> categories = book.getDataCategories();

		if (categoryId != null) {
			pagination = book.getBooksByCategory(categoryId, page, pageSize);
			model.addAttribute("selectedId", categoryId);
		} else {
			pagination = book.getPaginationBooks(page, pageSize);
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		model.addAttribute("search", new SearchBook());
		return "user/sach";
	}

	@RequestMapping(value = "timKiemSach", method = RequestMethod.POST)
	public String timSach(@ModelAttribute("search") SearchBook search, ModelMap model,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int pageSize) {
		Pagination<BooksDto> pagination = book.getDataSearchBookDto(search.getBookName(), page, pageSize);
		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", book.getDataCategories());
		model.addAttribute("search", new SearchBook());
		return "user/sach";
	}

//	@RequestMapping(value = "filterCategory/{categoryId}",method = RequestMethod.POST)
//	public ModelAndView filterCategory(@PathVariable int categoryId) {
//		ModelAndView mv = new ModelAndView("user/sach");
//		mv.addObject("categories", _HomeService.getDataCategories());
//		mv.addObject("booksDto", book.getDataFilterBookDto(categoryId));
//		mv.addObject("search", new SearchBook());
//		return mv;
//	}

	@RequestMapping(value = "/filterCategory/page", method = RequestMethod.GET)
	public String filterCategory(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "6") int pageSize, @RequestParam(required = false) Integer categoryId,
			ModelMap model) {
		Pagination<BooksDto> pagination;

		List<Categories> categories = book.getDataCategories();

		if (categoryId != null) {
			pagination = book.getBooksByCategory(categoryId, page, pageSize);
			model.addAttribute("selectedId", categoryId);
		} else {
			pagination = book.getPaginationBooks(page, pageSize);
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		model.addAttribute("search", new SearchBook());
		return "user/sach";
	}
//Book Detail
	@RequestMapping(value = "/bookDetail/{id}")
	public ModelAndView BookDetail(@PathVariable int id ) {
		ModelAndView mv = new ModelAndView("user/book_detail");
		mv.addObject("selectedId", _HomeService.GetAllFromId(id));
		mv.addObject("categories", _HomeService.getDataCategories());
		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
		return mv;
	}
}