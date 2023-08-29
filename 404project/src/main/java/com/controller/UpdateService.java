package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.dao.BoardFileDAO;
import com.model.dao.MemberDAO;
import com.model.dto.BoardFileDTO;
import com.model.dto.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.service.SessionService;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
   private static final long serialVersionUID = 1L;
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("EUC-KR");
      
      MemberDAO dao = new MemberDAO();
      HttpSession session = request.getSession();
      MemberDTO info = (MemberDTO)session.getAttribute("info");
      
      String id = info.getId();
      String name = info.getName();
      String birth = info.getBirth();
      String gender = info.getGender();
      
      
      
      String path =  "C:/Users/gjaischool/Desktop/WebStudy/04. Server/404project/404project/src/main/webapp/upload";
      int size = 1024*1024;
      
      MultipartRequest mr = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
      
      String pw = mr.getParameter("pw");
      String phone = mr.getParameter("phone");
      String email = mr.getParameter("email");
      String nick = mr.getParameter("nick");
      

   
      // 오리지널 파일명: 클라이언트가 업로드한 파일명 
      String uploadO = mr.getOriginalFileName("upload");
      
      // 실제 서버에 저장된 파일명
      String upload = mr.getFilesystemName("upload");
      
   
      path += "/"+upload;
      
      // 이전 파일 번호 조회
       int oldFileNo = dao.getFindNo(id);
      
       int cnt = 0;
       MemberDTO changeInfo = null;
      if(upload != null) {
         // 수정 시 첨부파일을 새로 등록한 경우
         BoardFileDTO file_dto = new BoardFileDTO(uploadO, upload, path);
         BoardFileDAO file_dao = new BoardFileDAO();
         
         // 새 파일 정보 데이터베이스에 추가하고 파일 번호(fileNo)를 얻어옴
           int newFileNo = file_dao.insert(file_dto);
           
           

            changeInfo = new MemberDTO(id,pw,name,birth,phone,email,nick,gender,newFileNo);
            cnt = dao.update(changeInfo);
            
            // 이전 파일 삭제
            if (oldFileNo > 0) {
                  file_dao.delete(oldFileNo);
             }

      }else {
          // 파일을 변경하지 않은 경우
            // 기존 파일 정보를 그대로 사용하여 게시글 수정

            changeInfo = new MemberDTO(id,pw,name,birth,phone,email,nick,gender,oldFileNo);
            cnt = dao.update(changeInfo);
      }
      
   
      if(cnt > 0) {
         // 세션영역에 수정된 회원정보를 저장, main.jsp로 이동
         session.setAttribute("info", changeInfo);
         try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         response.sendRedirect("profile.jsp");
      }else {
         response.sendRedirect("member_info_modification.jsp");
      }
   
   
   
   }

}