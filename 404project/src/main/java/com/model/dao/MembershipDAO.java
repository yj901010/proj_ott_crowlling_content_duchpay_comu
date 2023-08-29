package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.dto.MembershipDTO;

public class MembershipDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	// 데이터베이스 연결메소드
	public void getConnection() {
		
		// JDBC순서
		// 0.드라이버 파일 프로젝트에 넣기
		// 1.드라이버 동적로딩
		// 2.커넥션 연결
		// 3.SQL문 실행
		// 4.연결종료
		
		
		// 1.데이터베이스 동적로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.커넥션 열기
			// - DB가 존재하는 url, 아이디, 비밀번호
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa4_Spring_hacksim_4";
			String db_pw = "aishcool4";
			
			// 권한 가져오기
			conn = DriverManager.getConnection(db_url,db_id, db_pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("ojdbc6.jar 또는 경로를 체크하세요!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
		}
	}
	
	// 데이터베이스 종료메소드
	public void close() {
		// 역순으로 자원 반납
		// ResultSet, PreparedStament, Connection
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<MembershipDTO> nameSel(String platform) {
		// TODO Auto-generated method stub
		getConnection();
		
		ArrayList<MembershipDTO> list = new ArrayList<MembershipDTO>();

		String sql = "SELECT * FROM MEMBERSHIP WHERE NAME = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, platform);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int share = rs.getInt("share");
				MembershipDTO info = new MembershipDTO(no, name, title, price, share);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public ArrayList<MembershipDTO> select(){
		
		getConnection();
		
		ArrayList<MembershipDTO> list = new ArrayList<MembershipDTO>();
		
		String sql = "SELECT * FROM MEMBERSHIP";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int share = rs.getInt("share");
				
				MembershipDTO info = new MembershipDTO(no, name, title, price, share);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		
		return list;
	}	
	
	// 글 넘버를 받아 멤버쉽정보 받아오기
	public ArrayList<MembershipDTO> membershipsel(int no) {
		
		getConnection();
		
		ArrayList<MembershipDTO> list = new ArrayList<>();
		
		String sql = "SELECT m.* FROM MEMBERSHIP m JOIN PARTY p ON p.P_NO = m.NO WHERE p.NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int m_no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int share = rs.getInt("share");
				
				MembershipDTO info = new MembershipDTO(m_no, name, title, price, share);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 플랫폼, 요금제 받아서 검색
	public ArrayList<MembershipDTO> infoSel(String platform, String title) {
		
		getConnection();
		
		ArrayList<MembershipDTO> list = new ArrayList<MembershipDTO>();

		String sql = "SELECT * FROM MEMBERSHIP WHERE NAME = ? AND TITLE = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, platform);
			psmt.setString(2, title);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String mtitle = rs.getString("title");
				int price = rs.getInt("price");
				int share = rs.getInt("share");
				MembershipDTO info = new MembershipDTO(no, name, mtitle, price, share);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
}
