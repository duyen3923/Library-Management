
package Model.Dto;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ThongKeDtoMapper  implements RowMapper<ThongKeDto> {
	public ThongKeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ThongKeDto thongke = new ThongKeDto();
		thongke.setCategoryName(rs.getString("categoryName"));
		thongke.setAmount(rs.getInt("amount"));
		return thongke;
	}
}


	
