package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.model.dto.VideoDTO;

public class VideoDAO {
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

   // 제목 검색 시 video 전체 목록 조회 메소드
   public ArrayList<VideoDTO> select(String titleInput) {
      
      getConnection();
      ArrayList<VideoDTO> list = new ArrayList<>();
      String sql = "SELECT * FROM VIDEO WHERE TITLE LIKE ?";
      try {
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, "%" + titleInput + "%");
         
         rs = psmt.executeQuery();
         
         while (rs.next()) {
            int no = rs.getInt(1);
            String title = rs.getString(2);
            String poster_Path = rs.getString(3);
            String thumbnail_Path = rs.getString(4);
            String platform_Name = rs.getString(5);
            int year = rs.getInt(6);
            String genre = rs.getString(7);
            String director = rs.getString(8);
            String actor = rs.getString(9);
            String running_Time = rs.getString(10);
            int age_Rating = rs.getInt(11);
            double score = rs.getDouble(12);
            String synopsis = rs.getString(13);
            
            VideoDTO dto = new VideoDTO(no, title, poster_Path, thumbnail_Path, platform_Name, year, genre, director, actor, running_Time, age_Rating, score, synopsis);
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      
      
      return list;
   }

   // video 상세 정보 조회 메소드
   public VideoDTO selectOne(int no) {
	   VideoDTO dto = null;
	   
	   getConnection();
	   
	   try {
	        String sql = "SELECT * FROM VIDEO WHERE NO=?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, no);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            no = rs.getInt("no");
	            String title = rs.getString("title");
	            String posterPath = rs.getString("poster_path");
	            String thumbnailPath = rs.getString("thumbnail_path");
	            String platformName = rs.getString("platform_name");
	            int year = rs.getInt("year");
	            String genre = rs.getString("genre");
	            String director = rs.getString("director");
	            String actor = rs.getString("actor");
	            String runningTime = rs.getString("running_time");
	            int ageRating = rs.getInt("age_rating");
	            double score = rs.getDouble("score");
	            String synopsis = rs.getString("synopsis");

	            dto = new VideoDTO(no, title, posterPath, thumbnailPath, platformName, year, genre, director, actor, runningTime, ageRating, score, synopsis);
	        } else {
	            System.out.println("영화가 없습니다.");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }

	   
	   
	   return dto;
   }

   // 평점 update 메소드
   public void updateScore(int no, double inputScore) {
		getConnection();

		// 소수점 둘째 자리까지 반올림
        double score = Math.round(inputScore * 100.0) / 100.0;
		
		String sql="UPDATE VIDEO SET SCORE = ? WHERE NO = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, score);
			psmt.setInt(2, no);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

}