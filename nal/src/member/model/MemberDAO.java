package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


// import nal.member.MemberVO;
//import dbmanager.DBconnection;
import util.DBConnection;

public class MemberDAO {
	
	//싱글톤패턴 위해 private 으로 선언
	private static MemberDAO instance = new MemberDAO();
	
	//외부에서 수정하지 못하고 값을 얻을 수만 있도록 read only property로 만들기 위해 setter는 정의하지 않고 getter만 만듦
	//new 연산자를 사용해 동일한 형태의 객체를 계속 생성하지 않고 getInstance() 메소드를 접근해서 사용하도록 함
	//MemberDAO mDao = MemberDAO.getInstance(); <<와 같이 객체 얻어옴
	public static MemberDAO getInstance() {
		return instance;
	} //MemberDAO 객체 리턴
	
	// 로그인 메소드
	//member 테이블과 비교해 존재하지 않으면 -1, ID만 일치하면 0, 모두 일치하면 1 리턴
	public int login(String member_id, String member_pw) {
		int result = -1; // 회원이 없는 것을 가정하고 시작
		String sql = "SELECT member_pw FROM member WHERE member_id = ?"; // 로그인 폼에서 입력받은 ID로 member 테이블에서 PW 얻어옴
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id); // select 문의 ? 에 매개변수로 받아온 아이디를 바인딩시킴
			rs = pstmt.executeQuery(); // 쿼리문 실행 시 결과값을 ResultSet 객체인 rs에 저장
			
			if (rs.next()) { // ID가 일치하는 행이 존재하면 true
				if (rs.getString(1)!=null && rs.getString(1).equals(member_pw)) {
					result = 1;
				} else { // ID가 일치하지만, PW가 불일치한 경우
					result = 0;
				}
			} else { // 해당 ID가 존재하지 않을 경우
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// ID로 회원 정보 가져오는 메소드
	//member 테이블에서 ID로 해당 회원을 찾아 회원 정보를 MemberVO 객체로 가져옴
	public MemberVO getMember(String member_id) {
		MemberVO mVo = null;
		String sql = "SELECT * FROM member WHERE member_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // ID가 일치하는 로우가 존재할 경우 VO객체에 DB에 저장된 회원정보 채움 
				mVo = new MemberVO();
				mVo.setMember_id(rs.getString("member_id"));
				mVo.setMember_pw(rs.getString("member_pw"));
				mVo.setMember_name(rs.getString("member_name"));
				mVo.setMember_email(rs.getString("member_email"));
				mVo.setMember_phone(rs.getString("member_phone"));
				mVo.setMember_birthdate(rs.getString("member_birthdate"));
				mVo.setMember_address(rs.getString("member_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mVo;
	}
	
	// 아이디 중복체크
	public int confirmID(String member_id) {
		int result = -1;
		String sql = "SELECT member_id FROM member WHERE member_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // 중복된 ID가 존재할 경우 1
				result = 1;
			} else {	// 중복된 ID가 존재하지 않을 경우 -1
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 회원가입 >> 회원 정보를 DB에 추가하는 메소드
	public int insertMember(MemberVO mVo) {
		int result = -1;
		String sql = "INSERT INTO member(member_code, member_id, member_name, member_birthdate, member_pw, member_email, member_phone, member_address) VALUES(member_code_seq.nextval, ?, ?, ?, ?, ?, ?, ?)"; // 회원정보를 member테이블에 삽입하기 위한 insert문
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			// 칼럼에 저장할 값은 매개변수로 받은 VO 객체에서 얻어와 바인딩
			pstmt.setString(1, mVo.getMember_id());
			pstmt.setString(2, mVo.getMember_name());
			pstmt.setString(3, mVo.getMember_birthdate());
			pstmt.setString(4, mVo.getMember_pw());
			pstmt.setString(5, mVo.getMember_email());
			pstmt.setString(6, mVo.getMember_phone());
			pstmt.setString(7, mVo.getMember_address());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ID찾기 메소드
	public String SearchId(String member_name, String member_email, String member_birthdate) {
		String member_id = null; // 회원이 없는 것을 가정하고 시작
		String sql = "SELECT \"column2\" FROM view1 WHERE \"column3\" = ? and \"column5\" = ? and \"column4\" = ?";// 뷰 사용
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_name);
			pstmt.setString(2, member_email);
			pstmt.setString(3, member_birthdate);
			rs = pstmt.executeQuery(); // 쿼리문 실행 시 결과값을 ResultSet 객체인 rs에 저장
			
			if (rs.next()) { // 존재하면 true
				member_id = rs.getString(1);
				
			} else { // 존재하지 않을 경우
				member_id = null;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return member_id;
	}
	
	// PW변경 메소드
	public int updatePw(String member_pw, String member_id) {
		int result = -1;
		String sql = "UPDATE member SET member_pw = ? WHERE member_id = ?";
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member_pw);
			pstmt.setString(2, member_id);
			result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (conn != null) pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return result;
	}
}
