package book.model;

public class MyListVO {
	private long mylist_code;
	private String member_id;
	private long isbn;	
	private String book_title;
	private String author;
	private String publishing;
	private String book_sorting;

		
	public MyListVO() {
	}

	public long getMylist_code() {
		return mylist_code;
	}

	public void setMylist_code(long mylist_code) {
		this.mylist_code = mylist_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public long getIsbn() {
		return isbn;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
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

	public String getBook_sorting() {
		return book_sorting;
	}

	public void setBook_sorting(String book_sorting) {
		this.book_sorting = book_sorting;
	}

}
