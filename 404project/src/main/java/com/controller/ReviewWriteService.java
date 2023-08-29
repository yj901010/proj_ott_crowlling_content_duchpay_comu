package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.ReviewDAO;
import com.model.dto.MemberDTO;
import com.model.dto.ReviewDTO;

@WebServlet("/ReviewWriteService")
public class ReviewWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("review");
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String id = info.getId();

		int videoNo = Integer.parseInt(request.getParameter("no"));
		int score = 0;
		if(request.getParameter("reviewStar")!=null) {
			score = Integer.parseInt(request.getParameter("reviewStar"));
		}
		
		String content = request.getParameter("content");
		
		System.out.println(id);
		System.out.println(score);
		System.out.println(content);
		
		ReviewDTO dto = new ReviewDTO(videoNo, id, content, score);
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.write(dto);
	
		if(cnt >0) {
			System.out.println("리뷰 작성 성공");
		}else {
			System.out.println("리뷰 작성 실패");
		}
	
		response.sendRedirect("video_contens_view.jsp?no="+videoNo);
	}

}
