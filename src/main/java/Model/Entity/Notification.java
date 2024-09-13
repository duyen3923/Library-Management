package Model.Entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notification {
	private int id;
	private String title;
	private String content;
	private String image;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date dayCreated;
	public Notification() {
		// TODO Auto-generated constructor stub
	}
	public Notification(int id, String title, String content, String image, Date dayCreated) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.dayCreated = dayCreated;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getDayCreated() {
		return dayCreated;
	}
	public void setDayCreated(Date dayCreated) {
		this.dayCreated = dayCreated;
	}
	
	
}
