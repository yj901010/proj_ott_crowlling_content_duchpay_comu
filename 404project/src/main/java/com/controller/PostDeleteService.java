package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.BoardFileDAO;
import com.model.dao.CommentsDAO;
import com.model.dao.PostDAO;
import com.model.dto.MemberDTO;
import com.model.dto.PostDTO;

@WebServlet("/PostDeleteService")
public class PostDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PostDAO PostDao = new PostDAO();
		CommentsDAO commentsDao= new CommentsDAO();
		int no = Integer.parseInt(request.getParameter("no"));
		int fileNo = PostDao.getFindNo(no);
		commentsDao.deleteAll(no);
		
		int cnt = PostDao.delete(no);
		
		if(cnt>0) {
			System.out.println("게시글 삭제 성공");
			BoardFileDAO fileDAO = new BoardFileDAO();
			fileDAO.delete(fileNo);
		}else {
			System.out.println("게시글 삭제 실패...");
		}
	
		response.sendRedirect("post_main.jsp");
	
	}

}
