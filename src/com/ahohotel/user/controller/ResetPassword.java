package com.ahohotel.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.service.AhoUserService;

@WebServlet("/user/resetpassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		String id = request.getParameter("userid");

		AhoUserDTO resetPw = new AhoUserDTO();
		resetPw.setPw(pw);
		resetPw.setId(id);
		
		AhoUserService userService = new AhoUserService();
		
		if(userService.resetPw(resetPw)) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("message", "회원 가입 실패!");
			
			request.getRequestDispatcher("/WEB-INF/view/common/failed.jsp").forward(request, response);
			
		}
		
		
	}

}
