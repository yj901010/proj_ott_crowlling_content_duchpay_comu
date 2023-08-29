package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.BoardFileDAO;
import com.model.dao.PostDAO;

@WebServlet("/PostUpdateFileDeleteService")
public class PostUpdateFileDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
        
        BoardFileDAO fileDao = new BoardFileDAO();
        PostDAO dao = new PostDAO();
        
        // 이전 파일 번호 조회
        int oldFileNo = dao.getFindNo(no);
        
        // 이전 파일 삭제
        if (oldFileNo > 0) {
        	dao.fileNull(no);
            // 파일을 실제로 삭제하는 로직
            fileDao.deleteFile(oldFileNo);
            
            // 데이터베이스에서 파일 정보 삭제
            fileDao.delete(oldFileNo);
        }
        
        // 수정 페이지로 리다이렉트
        response.sendRedirect("postUpdate.jsp?no=" + no);
	}

}
