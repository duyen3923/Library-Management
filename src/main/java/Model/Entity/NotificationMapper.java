package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class NotificationMapper implements RowMapper<Notification>{

	public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Notification notification = new Notification();
		notification.setId(rs.getInt("id"));
		notification.setTitle(rs.getString("title"));
		notification.setContent(rs.getString("content"));
		notification.setImage(rs.getString("image"));
		notification.setDayCreated(rs.getDate("dayCreated"));
		return notification;
	}
}
