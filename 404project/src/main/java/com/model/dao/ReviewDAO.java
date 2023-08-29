package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.dto.ReviewDTO;

public class ReviewDAO {
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
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
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

	// 리뷰 작성 메소드
	public int write(ReviewDTO dto) {
		getConnection();
		
		
		int cnt = 0;
		String sql="INSERT INTO REVIEW VALUES(?,?,?,?,REVIEW_NO.NEXTVAL)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getVideo_No());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getScore());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 한 video에 달린 리뷰 조회 메소드
	public ArrayList<ReviewDTO> select(int videoNo) {

		ArrayList<ReviewDTO> list = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM REVIEW WHERE VIDEO_NO=? ORDER BY NO DESC";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, videoNo);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String content = rs.getString("content");
				int score = rs.getInt("score");
				ReviewDTO dto = new ReviewDTO(videoNo, id, content, score,no);
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

	// 한 video에 달린 평점 계산 메소드
	public double score(int videoNo) {
		int cnt = count(videoNo);
		double score = 0.0;
		
		if(cnt != 0) {
			getConnection();
			
			try {
				String sql = "SELECT * FROM REVIEW WHERE VIDEO_NO=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, videoNo);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					score += rs.getInt("score");
				}
				score = score / cnt;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
		}
		
		
		return score;
		
	}
	
	// videoNo에 달린 리뷰 개수 메소드
	public int count(int videoNo) {

		getConnection();
		int cnt = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM REVIEW WHERE VIDEO_NO=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, videoNo);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return cnt;
		
	}
	// 리뷰 수정 메소드
	public int update(ReviewDTO dto) {
		getConnection();
		
		int cnt = 0;
		
		String sql="UPDATE REVIEW SET CONTENT = ?, SCORE = ? WHERE NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getScore());
			psmt.setInt(3, dto.getNo());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 리뷰 삭제 메소드
	public int delete(int no) {
		getConnection();
		
		int cnt = 0;
		String sql="DELETE FROM REVIEW WHERE NO = ?";
		
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

}
