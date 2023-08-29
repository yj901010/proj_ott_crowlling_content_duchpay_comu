package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.MemberDAO;

@WebServlet("/PwService")
public class PwService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.same(id, email);
		
		
		if(cnt > 0) {
			HttpSession session = request.getSession();
		    session.setAttribute("cnt", cnt);
		    response.sendRedirect("find_id_password.jsp?id=" + id);
		} else {
			response.sendRedirect("find_id_password.jsp");
		}
		
	}

}
