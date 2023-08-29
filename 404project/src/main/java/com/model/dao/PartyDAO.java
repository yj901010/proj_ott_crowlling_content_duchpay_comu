package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.dto.MembershipDTO;
import com.model.dto.PartyDTO;

public class PartyDAO {
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
		} 
		catch (ClassNotFoundException e) {
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
				if(rs != null) {
					rs.close();
				}
				if(psmt != null) {
					psmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		// 파티만들기
		public int PartyCreate(PartyDTO dto, MembershipDTO mdto) {
			
			getConnection();
			
			// int no = noSel(mdto);
			
			int no = 0;
			
			String sql = "SELECT NO FROM MEMBERSHIP WHERE NAME = ? AND TITLE = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, mdto.getName());
				psmt.setString(2, mdto.getTitle());
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					no = rs.getInt("no");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}

			
			getConnection();
			
			int cnt = 0;
			
			String nsql = "INSERT INTO PARTY VALUES(ps.nextval, ?, ?, ?, ?, sysdate)";
			
			try {
				psmt = conn.prepareStatement(nsql);
				
				psmt.setString(1, dto.getId());
				psmt.setInt(2, no);
				psmt.setString(3, dto.getStart_Date());
				psmt.setInt(4, dto.getPeriod());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			getConnection();
			
			int partNo = 0;
			
			String qsql = "select no from party where id = ? order by post_date desc";
			
			try {
				psmt = conn.prepareStatement(qsql);
				
				psmt.setString(1, dto.getId());
				
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					partNo = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return partNo;
			
		}
	
		public ArrayList<PartyDTO> select(){
			
			getConnection();
			
			ArrayList<PartyDTO> list = new ArrayList<PartyDTO>();
			
			String sql = "SELECT * FROM PARTY ORDER BY POST_DATE DESC";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int no = rs.getInt("no");
					String id = rs.getString("id");
					int p_no = rs.getInt("p_no");
					String start_date = rs.getString("start_date");
					int period = rs.getInt("period");
					String post_date = rs.getString("post_date");
					
					PartyDTO info = new PartyDTO(no, id, p_no, start_date, period, post_date);
					list.add(info);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			
			
			return list;
		}
		
		public int delete(PartyDTO dto) {
			
			getConnection();
			
			int cnt = 0;
			
			String sql = "DELETE FROM PARTY WHERE ID=? AND NO=?";
			
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
		
		
		// 입장 조건
		public int entrycondition (String id, int no) {
			
			getConnection();
			
			int cnt = 0;
			
			String sql = "SELECT COUNT(*) FROM PARTY p JOIN P_MEMBER m ON p.NO = m.NO WHERE m.ID = ? AND p.NO = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id);
				psmt.setInt(2, no);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					cnt = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			
			return cnt;
		}
		
		// 인원확인
		public int peopleCheck(int no) {
			
			getConnection();
			
			int check = 0;
			
			String sql = "SELECT m.\"SHARE\" FROM PARTY p JOIN MEMBERSHIP m ON p.P_NO = m.NO WHERE p.NO = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, no);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					check = rs.getInt("share");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return check;
		}
		
		// 입장인원 확인
		public int enterCheck(int no) {
			
			getConnection();
			
			int check = 0;
			
			String sql = "SELECT COUNT(m.NO) FROM PARTY p JOIN P_MEMBER m ON p.NO = m.NO WHERE m.NO = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, no);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					check = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return check;
		}
		
		// 
		public ArrayList<PartyDTO> date(int no){
			
			getConnection();
			
			ArrayList<PartyDTO> list = new ArrayList<PartyDTO>();
			
			String sql = "SELECT * FROM PARTY WHERE NO = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, no);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					String start_date = rs.getString("start_date");
					int period = rs.getInt("period");
					
					PartyDTO info = new PartyDTO(start_date, period);
					list.add(info);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
		}
}
