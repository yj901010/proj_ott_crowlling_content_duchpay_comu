package com.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.dto.MemberDTO;

public class MemberDAO {
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

	// 로그인 메소드
	public MemberDTO login(MemberDTO dto) {
		MemberDTO info = null;
		getConnection();
		
		String sql = "SELECT * FROM MEMBER WHERE ID=? AND PW=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String nick = rs.getString("nick");
				String gender = rs.getString("gender");
				int file_no = rs.getInt("file_no");
				info = new MemberDTO(id,pw,name,birth,phone,email,nick,gender,file_no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
		
	}

	// 유저정보 가져오는 메소드
		public MemberDTO getInfo(String sessionUserid) {
			MemberDTO info = null;
			getConnection();
			
			String sql = "SELECT * FROM MEMBER WHERE ID=?";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, sessionUserid);
				
				rs = psmt.executeQuery();
				if(rs.next()) {
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String birth = rs.getString("birth");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String nick = rs.getString("nick");
					String gender = rs.getString("gender");
					int file_no = rs.getInt("file_no");
					info = new MemberDTO(id,pw,name,birth,phone,email,nick,gender,file_no);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return info;
			
		}
	
	
	// 회원가입 메소드
	public int join(MemberDTO dto) {
		getConnection();
		int cnt = 0;
		try {
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,null)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getNick());
			psmt.setString(8, dto.getGender());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 회원탈퇴 메소드
	public int delete(MemberDTO dto) {
		
		// id와 pw가 일치하는 계정을 찾아서 삭제한 다음
		// 삭제 성공 -> 1 반환
		// 삭제 실패 -> 0 반환
		getConnection();
		int cnt = 0;
		
		try {
			String sql = "DELETE FROM MEMBER WHERE ID=? AND PW=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	// 회원정보수정 메소드
	public int update(MemberDTO changeInfo) {
		getConnection();
		
		int cnt = 0;
		String sql = "UPDATE MEMBER SET PW = ?, PHONE = ?, EMAIL = ?, NICK = ?, FILE_NO = ? WHERE ID = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, changeInfo.getPw());
			psmt.setString(2, changeInfo.getPhone());
			psmt.setString(3, changeInfo.getEmail());
			psmt.setString(4, changeInfo.getNick());
			
			if(changeInfo.getFile_no() != 0) {
				psmt.setInt(5, changeInfo.getFile_no());
			}else {
				psmt.setNull(5, changeInfo.getFile_no());
			}
			psmt.setString(6, changeInfo.getId());
			
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	// 회원정보이미지 수정 메소드
		public int updateImage(String id, int boardFileId) {
			getConnection();
			
			int cnt = 0;
			String sql = "UPDATE MEMBER SET FILE_NO=? WHERE ID=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, boardFileId);
				psmt.setString(2, id);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return cnt;
		}
	
	// 아이디로 닉네임찾는 메소드
	   public String getFindNick (String id) {
		      
		      getConnection();
		      String nick = "";
		      try {
		         String sql = "SELECT NICK FROM MEMBER WHERE ID=?";
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, id);
		         
		         rs = psmt.executeQuery();
		         
		         if (rs.next()) {
		            nick = rs.getString(1);
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally {
		         close();
		      }
		      
		      return nick;
	      }
	   
	// 파일번호 찾는 메소드
	   public int getFindNo (String id) {
		      
		      int findNo = 0;
		      getConnection();
		      
		      try {
		         String sql = "SELECT FILE_NO FROM MEMBER WHERE ID=?";
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, id);
		         
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
	
	// 아이디 찾기 메소드
	public String findId(String name,String email) {
		
		String id = null;
		
		getConnection();
		
		try {
			String sql = "SELECT ID FROM MEMBER WHERE NAME =? AND EMAIL=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, email);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return id;
	}
	
	
	
	// 비밀번호 찾을 때 입력받은 회원정보가 일치하는지 확인하는 메소드
	public int same(String id, String email) {
		
		int cnt = 0;
		getConnection();
		
		try {
			String sql = "SELECT * FROM MEMBER WHERE ID= ? AND EMAIL= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, email);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				return cnt = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 입력받은 회원정보가 일치하면 입력받은 비밀번호로 바꿔주는 메소드
	public int changePw(String id, String pw) {
		
		int pwResult = 0;
		getConnection();
		
		try {
			String sql = "UPDATE MEMBER SET PW= ? WHERE ID =?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, id);
			
			pwResult = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return pwResult;
	}


}
