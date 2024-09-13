package Model.Dto;

public class ThongKeDto {
	private String categoryName;
	private int amount;
	private String year;
	private String month;
	private int soluongMuon;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getSoluongMuon() {
		return soluongMuon;
	}
	public void setSoluongMuon(int soluongMuon) {
		this.soluongMuon = soluongMuon;
	}

	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
