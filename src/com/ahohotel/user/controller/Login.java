package com.ahohotel.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.service.AhoUserService;

@WebServlet("/user/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		AhoUserDTO userDto = new AhoUserDTO();
		userDto.setId(id);
		userDto.setPw(pw);
		
		AhoUserService userService = new AhoUserService();
		
		AhoUserDTO login = userService.login(userDto);
		
		if(login != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("loginUser", login);
			
			System.out.println("로그인 성공!");
		} else {
			
//			request.setAttribute("message", "로그인 실패!");
			
//			response.sendRedirect(request.getContextPath());
			
			System.out.println("로그인 실패!");
		}
	}

}
