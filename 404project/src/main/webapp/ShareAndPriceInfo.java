package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.MembershipDAO;
import com.model.MembershipDTO;

@WebServlet("/ShareAndPriceInfo")
public class ShareAndPriceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String platform = request.getParameter("platform");
		String title = request.getParameter("title");
		
		MembershipDAO dao = new MembershipDAO();
		ArrayList<MembershipDTO> list =  dao.infoSel(platform, title);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		response.setCharacterEncoding("EUC-KR");
		response.getWriter().print(result);
	}

}
