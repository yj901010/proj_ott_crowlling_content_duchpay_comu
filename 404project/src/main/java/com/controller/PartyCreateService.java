package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.MembershipDAO;
import com.model.dao.PartyDAO;
import com.model.dto.MemberDTO;
import com.model.dto.MembershipDTO;
import com.model.dto.PartyDTO;

@WebServlet("/PartyCreateService")
public class PartyCreateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		
		String id = info.getId();
		
		String name = request.getParameter("platform");
		String title = request.getParameter("title");
		MembershipDTO mdto = new MembershipDTO(name, title);
		
		String start_Date = request.getParameter("start_Date");
		int period = Integer.parseInt(request.getParameter("period"));
		PartyDTO pdto = new PartyDTO(id, start_Date, period);
		PartyDAO pdao = new PartyDAO();
		
		
		int cnt = pdao.PartyCreate(pdto, mdto);
		System.out.println(cnt);
		
		if(cnt > 0) {
			System.out.println("파티 성공");
			response.sendRedirect("JoinPartyMemberService?no="+cnt);
		}else {
			System.out.println("파티 실패");
			PrintWriter out=response.getWriter();
			out.println(0);
			//response.sendRedirect("party_post_main.jsp");
		}
	}

}
