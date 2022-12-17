package model;

public class BoardDTO {
	
	private int articleno;
	private String title;
	private String content;
	private String writedate;
	private int hit;
	private String member_id;
	private String member_name;
	private int deletion;

	public BoardDTO() {
		super();
	}

	public BoardDTO(String title, String content, String writedate, String member_id, int deletion) {
		super();
		this.title = title;
		this.content = content;
		this.member_id = member_id;
		this.deletion = deletion;
	}

	public BoardDTO(int articleno, String member_id) {
		super();
		this.articleno = articleno;
		this.member_id = member_id;
	}

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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public int getDeletion() {
		return deletion;
	}

	public void setDeletion(int deletion) {
		this.deletion = deletion;
	}
	
	
}
