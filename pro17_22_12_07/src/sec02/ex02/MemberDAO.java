package sec02.ex02;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//DBCP 처리 위해 생성
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;

	//DBCP 설정  01_DBCP_Test.jsp 테스트 
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end MemberDAO

	//오라클 DB 테이블 t_Board  select
	public List<MemberVO> listMembers() {
		//db SQL 결과 저장 인터페이스 사용은 거의 문법 수준
		List<MemberVO> membersList = new ArrayList();
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "select * from  t_member order by joinDate desc";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberVO memberVO = new MemberVO(id, pwd, name, email, joinDate);
				membersList.add(memberVO);
			}//end while
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end try
		return membersList;
	}//end listMembers

	//오라클 DB 테이블 t_Board  insert
	public void addMember(MemberVO m) {
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			String query = "INSERT INTO t_member(id, pwd, name, email)" + " VALUES(?, ? ,? ,?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end try
	}//end addMember

	//오라클 DB 테이블 t_Board  select
	public MemberVO findMember(String _id) {
		MemberVO memInfo = null;
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "select * from  t_member where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, _id);
			System.out.println(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String email = rs.getString("email");
			Date joinDate = rs.getDate("joinDate");
			memInfo = new MemberVO(id, pwd, name, email, joinDate);
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		return memInfo;
	}//end findMember

	//오라클 DB 테이블 t_Board  update
	public void modMember(MemberVO memberVO) {
		String id = memberVO.getId();
		String pwd = memberVO.getPwd();
		String name = memberVO.getName();
		String email = memberVO.getEmail();
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "update t_member set pwd=?,name=?,email=?  where id=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end modMember

	//오라클 DB 테이블 t_Board  delete
	public void delMember(String id) {
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "delete from t_member where id=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end delMember

}//end class
