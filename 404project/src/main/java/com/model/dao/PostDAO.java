package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.dto.PostDTO;

public class PostDAO {
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

	// 게시글 작성 메소드 - 게시글 번호 반환
	public int write(PostDTO dto) {
		getConnection();
		
		int cnt = 0;
		String sql="INSERT INTO POST VALUES(POST_NO.NEXTVAL, ?,?,?,SYSDATE,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getP_View());
			psmt.setInt(5, dto.getP_Like());
			if(dto.getFile_no() != 0) {
				psmt.setInt(6, dto.getFile_no());
			}else {
				psmt.setNull(6, dto.getFile_no());
			}
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 게시글 삭제 메소드
	public int delete(int no) {
		getConnection();
		
		int cnt = 0;
		
		try {
			
			String sql = "DELETE FROM POST WHERE NO=?";
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


	// 게시글 전체 조회 메소드
	public ArrayList<PostDTO> select() {

		ArrayList<PostDTO> list = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM POST";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String content = rs.getString("content");
				String postDate = rs.getString("post_date");
				int view = rs.getInt("p_view");
				int like = rs.getInt("p_like");
				int file_no = rs.getInt("file_no");
				PostDTO dto = new PostDTO(no, title, id, content, postDate, view, like, file_no);
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

	// 내가 쓴 글 목록 조회 메소드
	public ArrayList<PostDTO> mySelect(String id) {

		ArrayList<PostDTO> list = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM POST WHERE ID=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				//String id = rs.getString("id");
				String content = rs.getString("content");
				String postDate = rs.getString("post_date");
				int view = rs.getInt("p_view");
				int like = rs.getInt("p_like");
				int file_no = rs.getInt("file_no");
				
				PostDTO dto = new PostDTO(no, title, id, content, postDate, view, like, file_no);
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

	
	// 조회수 업데이트 메소드
	public int updateView(int view, int no) {
		getConnection();
		
		int cnt = 0;
		String sql = "UPDATE POST SET P_VIEW=? WHERE NO = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, view);
			psmt.setInt(2, no);
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	// 한 게시글 조회 메소드 - 조회수 증가
	  public PostDTO selectOne(int no) {
	       getConnection();
	       PostDTO dto = null;

	       try {
	           String selectSql = "SELECT * FROM POST WHERE NO=?";
	           psmt = conn.prepareStatement(selectSql);
	           psmt.setInt(1, no);
	           rs = psmt.executeQuery();

	           if (rs.next()) {
	               int postNo = rs.getInt("no");
	               String title = rs.getString("title");
	               String id = rs.getString("id");
	               String content = rs.getString("content");
	               String postDate = rs.getString("post_date");
	               int view = rs.getInt("p_view") + 1; // 조회수 증가
	               int like = rs.getInt("p_like");
	               int file_no = rs.getInt("file_no");

	               // 업데이트된 조회수를 데이터베이스에 저장
	               updateView(view, postNo);

	               dto = new PostDTO(postNo, title, id, content, postDate, view, like, file_no);
	           } else {
	               System.out.println("게시물이 없습니다.");
	           }

	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           close();
	       }

	       return dto;
	   }




	// 추천수 업데이트 메소드 - 추천수 증가
	  public int updateLike(int like, int no) {
	      
	      PostDTO dto = selectOne(no);
	      int view = dto.getP_View()-2;
	      updateView(view, no);
	      
	      getConnection();
	      int cnt = 0;
	      like++;
	      
	      String sql = "UPDATE POST SET P_LIKE=? WHERE NO = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, like);
	         psmt.setInt(2, no);
	         
	         cnt = psmt.executeUpdate();
	         
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return view;
	   }

	// 게시글 수정 메소드
   public int update(String id, int no, String title, String content, int fileNo) {
	      
	      getConnection();
	      
	      int cnt = 0;
	      
	      try {
	         String sql = "UPDATE POST SET TITLE =?, CONTENT=?, POST_DATE=SYSDATE, FILE_NO=? WHERE NO=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, title);
	         psmt.setString(2, content);
	         if(fileNo == 0) {
	        	 psmt.setNull(3, fileNo);
	         }else {
	        	 psmt.setInt(3, fileNo);
	         }
	         psmt.setInt(4, no);
	         cnt = psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return cnt;
	   }

   // 파일번호 찾는 메소드
   public int getFindNo (int no) {
	      
	      int findNo = 0;
	      getConnection();
	      
	      try {
	         String sql = "SELECT FILE_NO FROM POST WHERE NO=?";
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setInt(1, no);
	         
	         rs = psmt.executeQuery();
	         
	         if (rs.next()) {
	            findNo = rs.getInt(1);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return findNo;
   	}
   
   
   public int fileNull(int no) {
	      
	      getConnection();
	      
	      int cnt = 0;
	      
	      try {
	         String sql = "UPDATE POST SET FILE_NO=null WHERE NO=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, no);
	         
	         cnt = psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return cnt;
   }
 
// 키워드 검색 시 제목에 키워드가 포함된 목록 조회
   public ArrayList<PostDTO> searchTitle(String input) {

      ArrayList<PostDTO> list = new ArrayList<>();
      
      getConnection();
      
      try {
         String sql = "SELECT * FROM POST WHERE TITLE LIKE ?";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, "%" + input + "%");
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            int no = rs.getInt("no");
            String title = rs.getString("title");
            String id = rs.getString("id");
            String content = rs.getString("content");
            String postDate = rs.getString("post_date");
            int view = rs.getInt("p_view");
            int like = rs.getInt("p_like");
            int file_no = rs.getInt("file_no");
            
            PostDTO dto = new PostDTO(no, title, id, content, postDate, view, like,file_no);
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
   	
}
