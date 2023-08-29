package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.CommentsDAO;
import com.model.dao.ReviewDAO;

@WebServlet("/ReviewDeleteService")
public class ReviewDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		int no = Integer.parseInt(request.getParameter("no")) ;
		int videoNo = Integer.parseInt(request.getParameter("videoNo")) ;
		
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.delete(no);
	
		if(cnt > 0) {
			System.out.println("리뷰 삭제 성공");
		}else {
			System.out.println("리뷰 삭제 실패");
		}
	
		response.sendRedirect("video_contens_view.jsp?no="+videoNo);
	
	
	
	}

}
