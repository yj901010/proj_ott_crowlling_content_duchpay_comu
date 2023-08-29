package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.MemberDAO;
import com.model.dto.MemberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post방식 - 한글깨짐방식
		request.setCharacterEncoding("EUC-KR");
		
		// 사용자가 입력한 8가지의 정보를 가져오기(id,pw,name,birth,phone,email,nick,gender)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birthYear")+"-" + request.getParameter("birthMonth")+"-" + request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String gender = request.getParameter("gender");
		
		MemberDTO dto = new MemberDTO(id,pw,name,birth,phone,email,nick,gender);
		// 입력받은 정보를 데이터베이스에 저장하기
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		response.sendRedirect("login_join.jsp");
	
	
	}

}
