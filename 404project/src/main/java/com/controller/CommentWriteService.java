package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.CommentsDAO;
import com.model.dto.CommentsDTO;
import com.model.dto.MemberDTO;

@WebServlet("/CommentWriteService")
public class CommentWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String id = info.getId();
		String content = request.getParameter("content");
		int postNo = Integer.parseInt(request.getParameter("no")) ;
	
		CommentsDTO dto = new CommentsDTO(id,content,postNo);
		CommentsDAO dao = new CommentsDAO();
		int cnt = dao.write(dto);
		
		if(cnt > 0) {
			System.out.println("댓글 작성 성공");
			response.sendRedirect("post_view.jsp?no="+postNo);
		}else {
			System.out.println("댓글 작성 실패");
			response.sendRedirect("post_view.jsp?no="+postNo);
		}
	
	}

}
