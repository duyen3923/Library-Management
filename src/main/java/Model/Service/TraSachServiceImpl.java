package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChiTietMuonTraDtoDao;
import Model.Dao.TraSachDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTra;

@Service
public class TraSachServiceImpl {
	@Autowired
	private TraSachDao ctmtsDao;
	
	@Autowired
	private ChiTietMuonTraDtoDao ctmtDtoDao;
	
	public List<ChiTietMuonTra> getDataChiTietTra() {
		return ctmtsDao.GetDataChiTietTra();
	}
	
	public ChiTietMuonTra getCTMTFromId(int id) {
		return ctmtsDao.getCTMTFromId(id);
	}
	
	public int updateTraSach(int id ) {
		return ctmtsDao.updateTraSach(id);
	}
	
	public List<ChiTietMuonTraDto> GetDataChiTietMuonTraDto(){
		return ctmtDtoDao.GetDataChiTietMuonTraDto();
	}
	
	public List<ChiTietMuonTraDto> GetDataSearchChiTietMuonTraDto(String name){
		return ctmtDtoDao.GetDataSearchChiTietMuonTraDto(name);
	}
	
	public List<ChiTietMuonTraDto> GetDataChiTietTraDto(){
		return ctmtsDao.GetDataChiTietTraDto();
	}
	
	public List<ChiTietMuonTraDto> GetDataSearchChiTietTraDto(String name){
		return ctmtsDao.GetDataSearchChiTietTraDto(name);
	}
}
