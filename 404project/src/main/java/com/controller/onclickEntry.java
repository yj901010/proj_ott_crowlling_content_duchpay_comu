package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.dao.PartyDAO;

@WebServlet("/onclickEntry")
public class onclickEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		
		PartyDAO dao = new PartyDAO();
		int entryCon = dao.entrycondition(id, no); // 입장조건 1이면 입장가능 0이면 입장불가
		int pCheck = dao.peopleCheck(no); // 공유인원확인
		int enterCheck = dao.enterCheck(no); // 입장인원
		
		int[] array = {entryCon, pCheck, enterCheck};
		
		Gson gson = new Gson();
		String restult = gson.toJson(array);
		response.setCharacterEncoding("EUC-KR");
		response.getWriter().print(restult);
	}

}
