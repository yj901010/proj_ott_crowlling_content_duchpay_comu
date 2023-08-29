package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.CommentsDAO;
import com.model.dto.CommentsDTO;
import com.model.dto.MemberDTO;

@WebServlet("/CommentsUpdateService")
public class CommentsUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String id = info.getId();
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		String content = request.getParameter("content");
		
		CommentsDTO dto = new CommentsDTO(no, id, content); 
		CommentsDAO dao = new CommentsDAO(); 
		int cnt = dao.update(dto);
		 
		if(cnt > 0) { System.out.println("댓글 수정 성공");
		}else { System.out.println("댓글 수정 실패"); }
		
		
	}

}
