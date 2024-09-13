package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.CategoryDao;
import Model.Entity.Categories;

@Service
public class CategoryServiceImpl {
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Categories> getDataCategories() {
		return categoryDao.GetDataCategories();
	}
	
	public int addCategory(Categories c) {
		return categoryDao.addCategory(c);
	}
	
	public int deleteCategory(int id) {
		return categoryDao.deleteCategory(id);
	}
	
	public Categories getCateFromId(int id) {
		return categoryDao.getCateFromId(id);
	}
	
	public int updateCategory(int id ,Categories c) {
		return categoryDao.updateCategory(id, c);
	}
	
	public List<Categories> GetDataSearchCategories(String name){
		return categoryDao.GetDataSearchCategories(name);
	}
}
