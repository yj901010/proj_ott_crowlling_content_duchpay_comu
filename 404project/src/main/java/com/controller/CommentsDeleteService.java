package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.CommentsDAO;

@WebServlet("/CommentsDeleteService")
public class CommentsDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		int postNo = Integer.parseInt(request.getParameter("postNo")) ;
		CommentsDAO dao = new CommentsDAO();
		int cnt = dao.delete(no);
	
		if(cnt > 0) {
			System.out.println("댓글 삭제 성공");
		}else {
			System.out.println("댓글 삭제 실패");
		}
		response.sendRedirect("post_view.jsp?no="+postNo);
	
	}

}
