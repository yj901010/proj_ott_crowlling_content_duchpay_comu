package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.PartyDAO;
import com.model.dto.MemberDTO;
import com.model.dto.PartyDTO;

@WebServlet("/DeletePartyService")
public class DeletePartyService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cnt =0;

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String id = info.getId();
		
		PartyDAO dao = new PartyDAO();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		PartyDTO dto = new PartyDTO(no, id);
		
		cnt = dao.delete(dto);
		
		if(cnt > 0 ) {
			System.out.println("파티삭제");
			response.sendRedirect("party_post_main.jsp");
		} else {
			System.out.println("파티삭제 실패");
		}
		
	}

}
