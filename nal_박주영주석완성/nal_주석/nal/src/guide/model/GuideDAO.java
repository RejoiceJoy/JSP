package guide.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBConnection;

/*코드 작성자 : 박주영*/

public class GuideDAO {
	private GuideDAO() {
	}// 싱글턴 패턴 - 생성자에 private을 명시해 외부에서 생성하는 것을 방지한다.

	private static GuideDAO instance = new GuideDAO(); // 생성방법 class loading시 단 한 번만 실행된다.

	public static GuideDAO getInstance() { // 외부에서 사용할 수 있게 public static method를 instance로 반환한다.
		return instance; // 사용자가 서비스 받을 메서드
	} 
	
	// 모든 guide 리스트 DB에서 불러오기
	public ArrayList<GuideVO> total_list() {
	  
		ArrayList<GuideVO> guideList = new ArrayList<GuideVO>();
		String sql = "select * from nal.guide order by guide_room_code asc ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuideVO guideVO = new GuideVO();
				guideVO.setGuide_room_code(rs.getInt("guide_room_code"));
				
				System.out.println("DAO test: "+rs.getInt("guide_room_code"));
				
				guideVO.setGuide_room_name(rs.getString("guide_room_name"));
				guideVO.setGuide_intro(rs.getString("guide_intro"));
				guideVO.setGuide_time(rs.getString("guide_time"));
				guideVO.setGuide_location(rs.getString("guide_location"));
				guideVO.setGuide_phonenumber(rs.getString("guide_phonenumber"));
				guideList.add(guideVO);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return guideList;
	}
}//end class
