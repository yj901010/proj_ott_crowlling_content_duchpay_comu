package com.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.VideoDAO;
import com.model.dto.VideoDTO;

@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String titleInput = request.getParameter("title");
		System.out.println(titleInput);
		VideoDAO dao = new VideoDAO();
		ArrayList<VideoDTO> video = dao.select(titleInput);
		
		if (video.size() == 0) {
			
		} else {
			for(int i=0;i<video.size();i++) {
				System.out.println(video.get(i));
			}
			
		}
	}
	
}
