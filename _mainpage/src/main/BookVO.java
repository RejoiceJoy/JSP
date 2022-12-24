package main;

public class BookVO {
	private long book_code;
	private String book_title;
	private String author;
	private String publishing;
	private String room_name;
	private String book_sorting;
	private String shape;
	private long isbn;
	
	
	
	public BookVO() {
	}
	
	
	public long getBook_code() {
		return book_code;
	}
	public void setBook_code(long book_code) {
		this.book_code = book_code;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing() {
		return publishing;
	}
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getBook_sorting() {
		return book_sorting;
	}
	public void setBook_sorting(String book_sorting) {
		this.book_sorting = book_sorting;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public long getIsbn() {
		return isbn;
	}
	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
	
	
	
	
}