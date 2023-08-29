package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.PostDAO;

@WebServlet("/PostLikeService")
public class PostLikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int like = Integer.parseInt(request.getParameter("like"));
		int no = Integer.parseInt(request.getParameter("no"));
		PostDAO dao = new PostDAO();
		
		dao.updateLike(like, no);
		
		response.sendRedirect("post_view.jsp?no="+no);
	}

}
