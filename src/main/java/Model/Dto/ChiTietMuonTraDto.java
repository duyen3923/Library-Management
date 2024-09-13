package Model.Dto;

import java.util.Date;

public class ChiTietMuonTraDto {
	private int ctmtId;
	private int bookId;
	private Date ctmtNgayMuon;
	private int ctmtTrangThai;
	private Date ctmtNgayTra;
	private int ctmtAmount;
	private String bookName;
	private int bookAmount;
	private int readerId;
	private String readerName;
	
	public ChiTietMuonTraDto() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietMuonTraDto(int ctmtId, int bookId, Date ctmtNgayMuon, int ctmtTrangThai, Date ctmtNgayTra, int ctmtAmount,
			String bookName, int bookAmount, int readerId, String readerName) {
		super();
		this.ctmtId = ctmtId;
		this.bookId = bookId;
		this.ctmtNgayMuon = ctmtNgayMuon;
		this.ctmtTrangThai = ctmtTrangThai;
		this.ctmtNgayTra = ctmtNgayTra;
		this.ctmtAmount = ctmtAmount;
		this.bookName = bookName;
		this.bookAmount = bookAmount;
		this.readerId = readerId;
		this.readerName = readerName;
	}

	public int getCtmtId() {
		return ctmtId;
	}

	public void setCtmtId(int ctmtId) {
		this.ctmtId = ctmtId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public Date getCtmtNgayMuon() {
		return ctmtNgayMuon;
	}

	public void setCtmtNgayMuon(Date ctmtNgayMuon) {
		this.ctmtNgayMuon = ctmtNgayMuon;
	}

	public int getCtmtTrangThai() {
		return ctmtTrangThai;
	}

	public void setCtmtTrangThai(int ctmtTrangThai) {
		this.ctmtTrangThai = ctmtTrangThai;
	}

	public Date getCtmtNgayTra() {
		return ctmtNgayTra;
	}

	public void setCtmtNgayTra(Date ctmtNgayTra) {
		this.ctmtNgayTra = ctmtNgayTra;
	}

	public int getCtmtAmount() {
		return ctmtAmount;
	}

	public void setCtmtAmount(int ctmtAmount) {
		this.ctmtAmount = ctmtAmount;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getBookAmount() {
		return bookAmount;
	}

	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}

	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}
}
