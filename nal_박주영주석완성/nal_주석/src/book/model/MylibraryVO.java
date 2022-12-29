package book.model;

public class MylibraryVO {
	private long mylibrary_code;
	private String member_id;
	private long isbn;
	
	public MylibraryVO() {
	}
	
	public long getMylibrary_code() {
		return mylibrary_code;
	}
	public void setMylibrary_code(long mylibrary_code) {
		this.mylibrary_code = mylibrary_code;
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
	
	
	

}
