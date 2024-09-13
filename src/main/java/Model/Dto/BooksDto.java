package Model.Dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BooksDto {
	private int bookId;
	private int authorId;
	private int categoryId;
	private String bookName;
	private String authorName;
	private String categoryName;
	private int bookAmount;
	private String bookDayCreated;
	private String bookImage;
	private String bookDescription;
	private String authorImage;
	private String authorDescription;
	private String pdf;
	public String getPdf() {
		return pdf;
	}

	public void setPdf(String pdf) {
		this.pdf = pdf;
	}

	public int getBookId() {
		return bookId;
	}
	
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getBookAmount() {
		return bookAmount;
	}
	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}
	public String getBookDayCreated() {
		return bookDayCreated;
	}
	public void setBookDayCreated(String bookDayCreated) {
		this.bookDayCreated = bookDayCreated;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public String getBookDescription() {
		return bookDescription;
	}
	public void setBookDescription(String bookDescription) {
		this.bookDescription = bookDescription;
	}
	public String getAuthorImage() {
		return authorImage;
	}
	public void setAuthorImage(String authorImage) {
		this.authorImage = authorImage;
	}
	public String getAuthorDescription() {
		return authorDescription;
	}
	public void setAuthorDescription(String authorDescription) {
		this.authorDescription = authorDescription;
	}

	
}