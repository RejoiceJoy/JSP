package util;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DBManager {
	public static Connection getConnection() {
		
		Connection conn = null; //dbcp 
		try {
			//Context.xml에서 디비정보 가져오기
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/oracle");
			//디비연결
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		return conn;
	}//end get..

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end cl..

	public static void close(Connection conn, Statement stmt) {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end cl..
} //end class