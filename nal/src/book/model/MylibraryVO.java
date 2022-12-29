//작성자: 이기쁨
package book.model;
//"내 서재에 담기" 구현 위한 mylibrary 테이블의 열들을 필드로 선언
public class MylibraryVO {
	private long mylibrary_code;	// 출력시 정렬을 위해 sequence 사용
	private String member_id;		// 회원 아이디별로 select 하기 위해 저장
	private long isbn;				// 책 고유번호로서 book 테이블에서 PK로 설정된 isbn을 FK로 받아옴
	
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