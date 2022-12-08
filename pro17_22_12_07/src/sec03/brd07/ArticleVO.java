package sec03.brd07;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

//답변형 게시판을 데이터 저장을 위해 만든 VO
//_t_Board_sql.txt view 로 만들면 table처럼 처리 가능
public class ArticleVO {
	private int level;
	private int articleNO;
	private int parentNO;
	private String title;
	private String content;
	private String imageFileName;
	private String id;
	private Date writeDate;

	//자바 문법상 필요
	public ArticleVO() {	}

	//전체 모든 필드 값을 사용하는 구성자
	public ArticleVO(int level, int articleNO, int parentNO, String title, String content, String imageFileName,
			String id) {
		super();
		this.level = level;
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.id = id;
	}//end ArticleVO

	public int getLevel() {	return level;	}
	public void setLevel(int level) {	this.level = level;	}
	public int getArticleNO() {	return articleNO;	}
	public void setArticleNO(int articleNO) {	this.articleNO = articleNO;	}
	public int getParentNO() {	return parentNO;	}
	public void setParentNO(int parentNO) {		this.parentNO = parentNO;	}
	public String getTitle() {	return title;	}
	public void setTitle(String title) {	this.title = title;	}
	public String getContent() {	return content;	}
	public void setContent(String content) {	this.content = content;	}
	public String getId() {		return id;	}
	public void setId(String id) {		this.id = id;	}
	public Date getWriteDate() {		return writeDate;	}
	public void setWriteDate(Date writeDate) {		this.writeDate = writeDate;	}
	
	//이미지 파일 경로 특수문자 처리
	public String getImageFileName() {
		try {
			//파일이름에 특수문자가 있을 경우 인코딩합니다.
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			}//end if
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}//end try
		return imageFileName;
	}//end getImageFileName

	public void setImageFileName(String imageFileName) {
		try {
			 //파일이름에 특수문자가 있을 경우 인코딩합니다.
			this.imageFileName = 
					URLEncoder.encode(imageFileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}//end try
	}//end setImageFileName	

}//end ArticleVO
