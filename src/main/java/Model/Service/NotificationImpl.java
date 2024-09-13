package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.NotificationDao;
import Model.Entity.Notification;
import Model.Entity.Pagination;

@Service
public class NotificationImpl implements INotificationService{
	@Autowired
	private NotificationDao notificationDao;
	
	public int AddNotification(Notification notification) {
		return notificationDao.AddNotification(notification);
	}
	public List<Notification> GetAllNotification(){
		return notificationDao.GetDataNotification();
	}
	public Notification GetNotiFromId(int id) {
		return notificationDao.GetNotiFromId(id);
	}
	public int UpdateNotification(int id,Notification notification) {
		return notificationDao.UpdateNotification(id,notification);
	}
	public int DeleteNotification(int id) {
		return notificationDao.DeleteNotification(id);
	}
	public List<Notification> GetDataNotificationByMonth(int month) {
		return notificationDao.GetDataNotificationByMonth(month);
	}
	public Pagination<Notification> getNotificationsByPageAndMonth(int pageNo, int pageSize, int month) {
		return notificationDao.getAllByPageAndMonth(pageNo, pageSize, month);
	}
	public Pagination<Notification> getAllByPage(int pageNo, int pageSize) {
		return notificationDao.getAllByPage(pageNo, pageSize);
	}
}
