package Model.Service;



import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ThongKeDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Dto.ThongKeDto;
import Model.Entity.Authors;
import Model.Entity.Users;

@Service
public class ThongKeServiceImpl {
	@Autowired
	private ThongKeDao thongke = new ThongKeDao();
	

	
	public float MatDo() {
		return thongke.MatDoMuonSach();
	}
	
	public int SoluongReader() {
		return thongke.SoLuongReader();
	}
	
	public int SoSachDangMuon() {
		return thongke.SoSachDangDuocMuon();
	}
	
	public int SoSachConLai() {
		return thongke.SoLuongSachConlai();
	}
	
	public int TongSoSach() {
		return thongke.TongsoSach();
	}
	
	public List<ThongKeDto> DataPieChart() {
		return thongke.GetDataPieChart() ;
	}
	public List<ThongKeDto> TheLoaiMax() {
		return thongke.TheLoaiMax();
	}
	public List<ThongKeDto> TheLoaiMin() {
		return thongke.TheLoaiMin();
	}
	public  LinkedHashMap<String, String> ColumnChart(){
		 LinkedHashMap<String, String> fullYearData = new  LinkedHashMap<String, String>();
		List<ThongKeDto> dataFromDao = thongke.ColumnChart();
		List<String> months = new ArrayList<String>();
	      int dataIndex = 0; // Index của dữ liệu từ DAO
	      for (int i = 1; i <= 12; i++) {
	          months.add("Tháng " + i);
	      }
	      for (int i = 0; i < months.size(); i++) {
	          String month = months.get(i);
	          if (dataIndex < dataFromDao.size() && dataFromDao.get(dataIndex).getMonth().equals(String.valueOf(i + 1))){
	              fullYearData.put(month, String.valueOf(dataFromDao.get(dataIndex).getSoluongMuon()));
	              dataIndex++;
	          } else {
	              fullYearData.put(month, String.valueOf(0));
	          }
	      }
		return fullYearData;
	}
	public List<ThongKeDto> mostFavoriteCategory(){
		return thongke.mostFavoriteCategory();
	}

	public List<ThongKeDto> leastFavoriteCategory(){
		return thongke.leastFavoriteCategory();
	}
	
	public List<ChiTietMuonTraDto> readersInfor(){
		return thongke.thongKeReader();
	}
	public List<Authors> authorInfor(){
		return thongke.thongkeTacgia();
	}
}

