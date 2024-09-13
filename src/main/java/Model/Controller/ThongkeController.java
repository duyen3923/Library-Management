
package Model.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.ChiTietMuonTraDto;
import Model.Dto.ThongKeDto;
import Model.Entity.Authors;
import Model.Entity.Users;
import Model.Service.ThongKeServiceImpl;

@Controller
public class ThongkeController extends BaseController {
	@Autowired
	ThongKeServiceImpl thongke = new ThongKeServiceImpl();

	@RequestMapping(value = "thongke")
	public ModelAndView ThongKe() {
		ModelAndView mv = new ModelAndView("admin/ThongKe");
		mv.addObject("borrowedRate", thongke.MatDo());
		mv.addObject("borrowedBooksAmount", thongke.SoSachDangMuon());
		mv.addObject("bookAmount", thongke.TongSoSach());
		mv.addObject("readersAmount", thongke.SoluongReader());
		mv.addObject("categoryMax", thongke.TheLoaiMax());

		List<ThongKeDto> categoryMax = thongke.TheLoaiMax();
		List<ThongKeDto> categoryMin = thongke.TheLoaiMin();
		List<ThongKeDto> favoriteCategory = thongke.mostFavoriteCategory();
		List<ThongKeDto> leastfavoriteCategory = thongke.leastFavoriteCategory();
		List<ChiTietMuonTraDto> readers = thongke.readersInfor();
		List<Authors> authors = thongke.authorInfor();
		mv.addObject("categoryMaxName", categoryMax.get(0).getCategoryName());
		mv.addObject("categoryMaxAmount", categoryMax.get(0).getAmount());
		mv.addObject("categoryMinName", categoryMin.get(0).getCategoryName());
		mv.addObject("categoryMinAmount", categoryMin.get(0).getAmount());
		mv.addObject("mostFavoriteCategoryAmount", favoriteCategory.get(0).getAmount());
		mv.addObject("mostFavoriteCategoryName", favoriteCategory.get(0).getCategoryName());
		mv.addObject("leastFavoriteCategoryAmount", leastfavoriteCategory.get(0).getAmount());
		mv.addObject("leastFavoriteCategoryName", leastfavoriteCategory.get(0).getCategoryName());
		mv.addObject("readers", readers);
		mv.addObject("authors", authors);
		LinkedHashMap<String, String> treeMap = thongke.ColumnChart();
		ObjectMapper barchart = new ObjectMapper();
		String jsonBarchart;
		try {
			jsonBarchart = barchart.writeValueAsString(treeMap);
			mv.addObject("listReceipt", jsonBarchart);
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		List<ThongKeDto> dataList = thongke.DataPieChart();
		ObjectMapper mapper = new ObjectMapper();
		String json;
		try {
			json = mapper.writeValueAsString(dataList);
			mv.addObject("pieChart", json);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mv;
	}
}
