package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.BoardFileDAO;
import com.model.dao.PostDAO;
import com.model.dto.BoardFileDTO;
import com.model.dto.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PostUpdateService")
public class PostUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String id = info.getId();
		request.setCharacterEncoding("EUC-KR");
		String path = "C:/Users/gjaischool/Desktop/WebStudy/04. Server/404project/404project/src/main/webapp/upload";
		
		int size = 256*256;
		
		MultipartRequest mr = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
		
		String fileName = mr.getFilesystemName("upload");
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		BoardFileDAO fileDao = new BoardFileDAO();
		PostDAO dao = new PostDAO();
		int no = Integer.parseInt(request.getParameter("no"));

		
		// 이전 파일 번호 조회
		int oldFileNo = dao.getFindNo(no);
		
		// 오리지널 파일명: 클라이언트가 업로드한 파일명 
		String uploadO = mr.getOriginalFileName("upload");
		
		// 실제 서버에 저장된 파일명
		String upload = mr.getFilesystemName("upload");
		
		path += "/" + upload;
		
		if(upload != null) {
			BoardFileDTO file_dto = new BoardFileDTO(uploadO, upload, path);
			BoardFileDAO file_dao = new BoardFileDAO();
		
			
			// 새 파일 정보 데이터베이스에 추가하고 파일 번호(fileNo)를 얻어옴
			int newFileNo = file_dao.insert(file_dto);
			
			
			
			//게시글 수정
			int cnt = dao.update(id, no, title, content, newFileNo);
			
			// 이전 파일 삭제
			if (oldFileNo > 0) {
	            file_dao.delete(oldFileNo);
	        }
		} else {
			// 파일을 변경하지 않은 경우
	        // 기존 파일 정보를 그대로 사용하여 게시글 수정
	        int cnt = dao.update(id, no, title, content, oldFileNo);
		}      
	    
	
		System.out.println("게시글 수정 성공");
		try {
			Thread.sleep(4000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("post_view.jsp?no=" + no);
	}
	
}


