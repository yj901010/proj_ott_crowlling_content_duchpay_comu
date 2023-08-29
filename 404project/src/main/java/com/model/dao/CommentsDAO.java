package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.dto.CommentsDTO;

public class CommentsDAO {
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

	// 댓글 작성 메소드
	public int write(CommentsDTO dto) {
		getConnection();
		
		int cnt = 0;
		String sql="INSERT INTO COMMENTS VALUES(COMMENT_NO.NEXTVAL, ?,?,SYSDATE,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getPostNo());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 댓글 목록 조회 메소드
	public ArrayList<CommentsDTO> select(int postNo) {

		ArrayList<CommentsDTO> list = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM COMMENTS WHERE POST_NO=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, postNo);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String content = rs.getString("content");
				String postDate = rs.getString("post_date");
				CommentsDTO dto = new CommentsDTO(no, id, content, postDate,postNo);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
		
	}

	// 작성한 댓글 목록 조회 메소드
	public ArrayList<CommentsDTO> selectMy(String id) {

		ArrayList<CommentsDTO> list = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM COMMENTS WHERE ID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				id = rs.getString("id");
				String content = rs.getString("content");
				String postDate = rs.getString("post_date");
				int postNo = rs.getInt("post_no");
				CommentsDTO dto = new CommentsDTO(no, id, content, postDate,postNo);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
		
	}
	

	
	// 댓글 수정 메소드
	public int update(CommentsDTO dto) {
		getConnection();
		
		int cnt = 0;
		
		String sql="UPDATE COMMENTS SET CONTENT = ? WHERE NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getNo());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 댓글 삭제 메소드
	public int delete(int no) {
		getConnection();
		
		int cnt = 0;
		String sql="DELETE FROM COMMENTS WHERE NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 글번호postNo에 달린 댓글 모두 삭제 메소드
	public int deleteAll(int postNo) {
		getConnection();
		
		int cnt = 0;
		String sql="DELETE FROM COMMENTS WHERE POST_NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, postNo);
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
}
