package com.ahohotel.mypage.useraccount.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.useraccount.model.service.UserAccountService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/accountSelect")
public class UserAccountSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 로그인한 회원 code */
		int userCode = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();

		/* 로그인한 회원 정보 조회 */
		AhoUserDTO userDTO = new UserAccountService().selectUserAccount(userCode);
//		System.out.println(userDTO);
		
		String path = "";
		if (userDTO != null) {
			String userId = userDTO.getId();
			String userPw = userDTO.getPw();
			String userName = userDTO.getName();
			String userEmail = userDTO.getEmail();
			Date birth = userDTO.getBirth();
			String userPhone = userDTO.getPhone();
			
			SimpleDateFormat sdformat = new SimpleDateFormat("YYYY-MM-dd");
			String userBirth = sdformat.format(birth);
//			System.out.println(userBirth);

			path = "/WEB-INF/view/mypage/useraccount/userAccountSelect.jsp";
			request.setAttribute("userId", userId);
			request.setAttribute("userPw", userPw);
			request.setAttribute("userName", userName);
			request.setAttribute("userEmail", userEmail);
			request.setAttribute("userPhone", userPhone);
			request.setAttribute("userBirth", userBirth);
			
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "회원정보 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
