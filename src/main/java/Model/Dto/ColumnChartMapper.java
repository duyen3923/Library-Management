package Model.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ColumnChartMapper implements RowMapper<ThongKeDto> {
    public ThongKeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        ThongKeDto thongke = new ThongKeDto();
        thongke.setYear(rs.getString("year"));
        thongke.setMonth(rs.getString("month"));
        thongke.setSoluongMuon(rs.getInt("soluongMuon"));
        return thongke;
    }
}