package Model.Service;

import org.springframework.stereotype.Service;

import Model.Entity.Notification;

@Service
public interface INotificationService {
	public int AddNotification(Notification notification);
}
