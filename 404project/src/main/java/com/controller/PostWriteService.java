package com.controller;

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

@WebServlet("/PostWriteService")
public class PostWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	
		HttpSession session = request.getSession(); 
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		 
		String id = info.getId();
		 
		String path = "C:/Users/gjaischool/Desktop/WebStudy/04. Server/404project/404project/src/main/webapp/upload";
		
		
		int size = 256*256;
		
		MultipartRequest mr = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
	
		// 오리지널 파일명: 클라이언트가 업로드한 파일명 
		String uploadO = mr.getOriginalFileName("upload");
		
		// 실제 서버에 저장된 파일명
		String upload = mr.getFilesystemName("upload");
		
		path +=  "/" + upload;
		
		int file_no = 0;
		if(upload != null) {
			// 파일테이블에 insert
			BoardFileDTO fileDto = new BoardFileDTO(uploadO, upload, path);
			BoardFileDAO fileDao = new BoardFileDAO();
			file_no = fileDao.insert(fileDto);
		}
	
		
		ServletContext application = getServletContext();
		int view = 0;
		application.setAttribute("view", view);
		
		int like = 0;
		application.setAttribute("like", like);

		PostDTO postDto = new PostDTO(title, id, content, view, like, file_no);
		PostDAO postDao = new PostDAO();
		int cnt = postDao.write(postDto);
		
		if(cnt > 0) {
			System.out.println("게시글 작성 성공");
			response.sendRedirect("post_main.jsp");
		}else {
			System.out.println("게시글 작성 실패");
		}
	}

}
