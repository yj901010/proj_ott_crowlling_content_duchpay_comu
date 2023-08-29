package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.dao.MemberDAO;
import com.model.dto.MemberDTO;

public class SessionService {
	
	// 세션 정보 최신
	public void renewalSession(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Object sessionInfo = session.getAttribute("info");
		
		if (sessionInfo != null) {
			MemberDTO member = (MemberDTO)sessionInfo;
			MemberDAO dao = new MemberDAO();
			MemberDTO info = dao.getInfo(member.getId());
			dao.updateImage(info.getId(), info.getFile_no());
			
			
			session.setAttribute("info", info);
		}
	}
}
