package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.dao.MembershipDAO;
import com.model.dto.MembershipDTO;

@WebServlet("/MembershipSelect")
public class MembershipSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String platform = request.getParameter("platform");
		// System.out.println(platform);
		
		MembershipDAO dao = new MembershipDAO();
		ArrayList<MembershipDTO> list =  dao.nameSel(platform);
		
		
		
		//System.out.println(platform);
		//System.out.println(list.size());
		/*
		 * for(int i = 0; i < list.size(); i++) {
		 * System.out.println(list.get(i).toString()); }
		 */
		Gson gson = new Gson();
		String result = gson.toJson(list);
		response.setCharacterEncoding("EUC-KR");
		response.getWriter().print(result);
	}

}




