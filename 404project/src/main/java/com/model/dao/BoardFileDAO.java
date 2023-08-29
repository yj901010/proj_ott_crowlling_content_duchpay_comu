package com.model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.dto.BoardFileDTO;

public class BoardFileDAO {
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
	// 파일 업로드 메소드
	public int insert(BoardFileDTO dto) {
		getConnection();
		int no = 0;
		String sql="INSERT INTO BOARD_FILE VALUES(FILE_NO.NEXTVAL, ?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getOriginal_name());
			psmt.setString(2, dto.getFile_name());
			psmt.setString(3, dto.getPath());
			
			psmt.executeUpdate();
			
			no = findNo(dto.getFile_name());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return no;
	}

	// 파일번호 찾는 메소드
	public int findNo(String name) {

		int no = 0;
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM BOARD_FILE WHERE FILE_NAME = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,name);
			rs = psmt.executeQuery();
			while(rs.next()) {
				no = rs.getInt("no");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return no;
	}
	
	// 파일경로 찾는 메소드
	public String findPath(int file_no) {

		String path = "";
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM BOARD_FILE WHERE NO = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,file_no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				path += rs.getString("path");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return path;
	}

	// 파일테이블 행 삭제 메소드
	   public void delete(int no) {
	      
	      deleteFile(no);
	      getConnection();

	      
	      String sql="DELETE FROM BOARD_FILE WHERE NO = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, no);
	         
	         psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	    	  close();
	      }
	      
	      
	   }
	   
	   // 실제 파일 삭제 메소드
	   public void deleteFile(int no) {
	      String path = findPath(no);

	      File file = new File(path);
	      
	      if(file.exists()) {
	         file.delete();
	         System.out.println("파일 삭제 완료");
	      }else {
	         System.out.println("파일 존재 X");
	      }
	      
	   }
	   
	// 파일 이름 찾는 메소드
	   public String findName(int file_no) {

		   getConnection();
	      String name = "";
	      try {
	         String sql = "SELECT * FROM BOARD_FILE WHERE NO = ?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1,file_no);
	         rs = psmt.executeQuery();
	         while(rs.next()) {
	             name += rs.getString("file_name");
	            
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	    	  close();
	      }
	      
	      
	      return name;
	   }

	   
	// 유저별로 가입한 맴버쉽 찾기
	   public List<String> findMemberShipByuserId(String user_id) {

		   getConnection();
		   List<String> memberShip = new ArrayList<String>();
	      try {
	         String sql = "SELECT ms.name AS membership_name FROM party p "
	         		+ " LEFT JOIN member m ON m.id = p.id"
	         		+ " LEFT JOIN membership ms ON p.p_no = ms.no"
	         		+ " where m.id =?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1,user_id);
	         rs = psmt.executeQuery();
	         while(rs.next()) {
	        	 memberShip.add(rs.getString("membership_name"));
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	    	  close();
	      }
	      
	      
	      return memberShip;
	   }
	  
}
