package com.controller;

import java.awt.BorderLayout;
import java.io.IOException;

import javax.servlet.ServletContext;
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
import com.model.dto.PostDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UploadService")
public class UploadService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		
		String id = info.getId();
		
		String path = request.getServletContext().getRealPath("/upload");
		
		int size = 1024*1024;
		
		MultipartRequest mr = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
		
		String fileName = mr.getFilesystemName("upload");
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
	
		// 오리지널 파일명: 클라이언트가 업로드한 파일명 
		String uploadO = mr.getOriginalFileName("upload");
		
		// 실제 서버에 저장된 파일명
		String upload = mr.getFilesystemName("upload");
		
		path += "\\" + upload;
		
		BoardFileDTO file_dto = new BoardFileDTO(uploadO, upload, path);
		BoardFileDAO file_dao = new BoardFileDAO();
		int file_no = file_dao.insert(file_dto);
	
		
		ServletContext application = getServletContext();
		int view = 0;
		application.setAttribute("view", view);
		
		int like = 0;
		application.setAttribute("like", like);

		PostDTO post_dto = new PostDTO(title, id, content, view, like,file_no);
		PostDAO post_dao = new PostDAO();
		int cnt = post_dao.write(post_dto);
		
		if(cnt > 0) {
			System.out.println("게시글 작성 성공");
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("게시글 작성 실패");
		}
	}

}
