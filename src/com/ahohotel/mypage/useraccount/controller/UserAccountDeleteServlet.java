package com.ahohotel.mypage.useraccount.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.useraccount.model.service.UserAccountService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/accountDelete")
public class UserAccountDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 회원 탈퇴 - AHOUSER에서 OUT_YN을 update */
		int userCode = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		
		int result = new UserAccountService().deleteUserAccount(userCode);
		
		
		if (result > 0) {
//			System.out.println("탈퇴 성공!!!!!");
			
			/* 로그아웃 */
			request.getSession().invalidate();
			
			/* 메인페이지로 이동 */		
			String path = "/WEB-INF/view/common/mainPage.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			
		} else {
			System.out.println("탈퇴 실패");
		}
	}
}
