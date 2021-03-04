package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	DataSource ds;
	public UserDAO() {
		try {
			InitialContext initContext = new InitialContext();
			Context context = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) context.lookup("jdbc/collabo");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int user_login(String userID, String user_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_pwd").equals(user_pwd)) {
					return 1; //로그인 성공 
				}
				return 2; //비밀번호 오류 
			}else {
				return 0; //해당사용자 없음
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 에러 
	}

	public int reg_chk(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
					return 0; //이미 존재하는 회원 
			}else {
				return 1; //가입가능 
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 에러
	}
	public int register(String userID, String user_pwd, String user_profile, String user_name, String user_age, String user_gender, String user_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, user_pwd);
			pstmt.setString(3, user_name);
			pstmt.setInt(4, Integer.parseInt(user_age));
			pstmt.setString(5, user_gender);
			pstmt.setString(6, user_email);
			pstmt.setString(7, user_profile);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 에러 
	}
}
