package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.dto.P_MemberDTO;

public class P_MemberDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	// 데이터베이스 연결메소드
	public void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa4_Spring_hacksim_4";
			String db_pw = "aishcool4";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("ojdbc.jar 또는 경로를 체크하세요!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("db연결에 필요한 정보가 맞는지 체크하세요!");
		}
	}

	// 데이터베이스 종료메소드
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 파티 만들시 멤버 조인
	public int PartyMemberJoin(P_MemberDTO dto) {

		getConnection();

		int cnt = 0;

		String sql = "INSERT INTO P_MEMBER VALUES(?, ?)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getNo());
			psmt.setString(2, dto.getId());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 파티 삭제시 멤버 탈퇴
	public int PartyMemberDelete(P_MemberDTO dto) {

		getConnection();

		int cnt = 0;

		String sql = "DELETE FROM P_MEMBER WHERE NO=? AND ID=?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getNo());
			psmt.setString(2, dto.getId());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 공유인원 검색
	public ArrayList<P_MemberDTO> selCount(int num) {

		ArrayList<P_MemberDTO> list = new ArrayList<P_MemberDTO>();

		getConnection();

		String sql = "SELECT * FROM P_MEMBER WHERE NO=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			rs = psmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");

				P_MemberDTO info = new P_MemberDTO(no, id);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	// 그냥 검색
	public ArrayList<P_MemberDTO> select() {

		ArrayList<P_MemberDTO> list = new ArrayList<P_MemberDTO>();

		getConnection();

		String sql = "SELECT * FROM P_MEMBER";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");

				P_MemberDTO info = new P_MemberDTO(no, id);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	
	// 파티 참가시 추가
	
	public int EnterParty(P_MemberDTO dto) {
		
		getConnection();
		
		int cnt = 0;
		
		String sql = "INSERT INTO P_MEMBER VALUES(?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getNo());
			psmt.setString(2, dto.getId());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 파티탈퇴
	public int ExitParty(P_MemberDTO dto) {
		
		getConnection();
		
		int cnt = 0;
		
		String sql = "DELETE FROM P_MEMBER WHERE ID=? AND NO=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getNo());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	//가입여부 확인
	public int checkId(P_MemberDTO dto) {
		
		getConnection();
		
		int check = 0;
		
		String sql = "SELECT * FROM P_MEMBER WHERE ID=? AND NO=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getNo());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				check++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return check;
	}
}
