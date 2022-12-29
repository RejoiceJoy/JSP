/* 작성자 배재연 */
package usermadang.board.model;

public class FreeboardVO {
	// DB의 freeboard의 모든 열들을 VO class의 필드로 선언
	private int articleno;
	private String title;
	private String content;
	private String writedate;
	private String member_id;
	private String member_name;
	private int hit;
	private int deletion;
	
	// 기본 생성자
	public FreeboardVO() {
		super();
	}

	// setter 및 getter
	public int getArticleno() {
		return articleno;
	}

	public void setArticleno(int articleno) {
		this.articleno = articleno;
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

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getDeletion() {
		return deletion;
	}

	public void setDeletion(int deletion) {
		this.deletion = deletion;
	}
	
}
