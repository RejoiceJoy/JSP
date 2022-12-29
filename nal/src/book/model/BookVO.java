//작성자: 이기쁨
package book.model;
//도서 검색 시 출력될 도서 정보 담고있는 book 테이블의 열이름 필드로 저장
public class BookVO {
	private long book_code;			// 저장 순서 sequence
	private String book_title;		// 책 제목
	private String author;			// 작가
	private String publishing;		// 출판 정보
	private String book_sorting;	// 청구 기호
	private String room_name;		// 자료실
	private long isbn;				// isbn
		
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
	public String getBook_sorting() {
		return book_sorting;
	}
	public void setBook_sorting(String book_sorting) {
		this.book_sorting = book_sorting;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public long getIsbn() {
		return isbn;
	}
	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
	
	
	
	
}