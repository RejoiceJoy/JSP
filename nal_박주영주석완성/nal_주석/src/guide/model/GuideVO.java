package guide.model;

//guide테이블에 들어가는 정보를 get/set메서드를 사용하여 활용할 수 있도록 하는 클래스 생성
public class GuideVO {
  private int guide_room_code; // pk 번호
  private String guide_room_name; // 시설 이름
  private String guide_intro; // 간략소개
  private String guide_time; //이용시간
  private String guide_location; //위치
  private String guide_phonenumber; //전화번호
  
//get/set 메서드 정의
	public int getGuide_room_code() {
		return guide_room_code;
	}
	public void setGuide_room_code(int guide_room_code) {
		this.guide_room_code = guide_room_code;
	}
	public String getGuide_room_name() {
		return guide_room_name;
	}
	public void setGuide_room_name(String guide_room_name) {
		this.guide_room_name = guide_room_name;
	}
	public String getGuide_intro() {
		return guide_intro;
	}
	public void setGuide_intro(String guide_intro) {
		this.guide_intro = guide_intro;
	}
	public String getGuide_time() {
		return guide_time;
	}
	public void setGuide_time(String guide_time) {
		this.guide_time = guide_time;
	}
	public String getGuide_location() {
		return guide_location;
	}
	public void setGuide_location(String guide_location) {
		this.guide_location = guide_location;
	}
	public String getGuide_phonenumber() {
		return guide_phonenumber;
	}
	public void setGuide_phonenumber(String guide_phonenumber) {
		this.guide_phonenumber = guide_phonenumber;
	}
  
}//end class