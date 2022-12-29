//작성자: 이기쁨
package book.model;
//mylibrary에서 출력할 책 정보를 담고있는 mylist VIEW 의 열들을 필드로 선언
public class MyListVO {
	private long mylist_code;		//mylibrary 테이블의 mylibrary_code의 열이름을 바꿔서 저장
	private String member_id;		//회원명
	private long isbn;				//책 코드 isbn
	private String book_title;		//책 제목	
	private String author;			//작가
	private String publishing;		//출판 정보
	private String book_sorting;	//청구 기호

		
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
