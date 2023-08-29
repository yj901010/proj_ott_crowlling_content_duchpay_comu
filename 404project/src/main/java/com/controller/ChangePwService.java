package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.MemberDAO;

@WebServlet("/ChangePwService")
public class ChangePwService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String confirmPw = request.getParameter("confirmPw");
		MemberDAO dao = new MemberDAO();
		System.out.println(id);
		System.out.println(pw);
		System.out.println(confirmPw);
		// 비밀번호 확인 로직 추가
        if (!pw.equals(confirmPw)) {
            // 비밀번호와 확인 비밀번호가 일치하지 않을 경우 처리 (예: 에러 메시지 출력 등)
            response.sendRedirect("find_id_password.jsp?error=1"); // 에러 코드를 파라미터로 전달
            return;
        }
		
		int pwResult = dao.changePw(id, pw);
		
		if(pwResult > 0) {
			response.sendRedirect("find_id_password.jsp?success=1");
		}
	}

}
