package com.ahohotel.mypage.useraccount.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.useraccount.model.service.UserAccountService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/accountUpdate")
public class UserAccountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userCode = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		int year = Integer.valueOf(birthday.substring(0,4));
		int month = Integer.valueOf(birthday.substring(5,7));
		int day = Integer.valueOf(birthday.substring(8,10));
		Calendar birth = new GregorianCalendar(year, month-1, day);
		Date bday = new Date(birth.getTimeInMillis());

		
		AhoUserDTO updateUserDTO = new AhoUserDTO();
		updateUserDTO.setCode(userCode);
		updateUserDTO.setPw(pw);
		updateUserDTO.setName(name);
		updateUserDTO.setPhone(phone);
		updateUserDTO.setEmail(email);
		updateUserDTO.setBirth(bday);

		int result = new UserAccountService().updateUserAccount(updateUserDTO);
		
		if (result > 0) {
			System.out.println("회원 정보 수정 성공!");
			
			int userCode2 = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();

			AhoUserDTO userDTO = new UserAccountService().selectUserAccount(userCode2);
//			System.out.println(userDTO);
			
			String userId = userDTO.getId();
			String userPw = userDTO.getPw();
			String userName = userDTO.getName();
			String userEmail = userDTO.getEmail();
			Date birth2 = userDTO.getBirth();
			String userPhone = userDTO.getPhone();
			
			SimpleDateFormat sdformat = new SimpleDateFormat("YYYY-MM-dd");
			String userBirth = sdformat.format(birth2);
//			System.out.println(userBirth);

			String path = "/WEB-INF/view/mypage/useraccount/userAccountSelect.jsp";
			request.setAttribute("userId", userId);
			request.setAttribute("userPw", userPw);
			request.setAttribute("userName", userName);
			request.setAttribute("userEmail", userEmail);
			request.setAttribute("userPhone", userPhone);
			request.setAttribute("userBirth", userBirth);
			
			request.getRequestDispatcher(path).forward(request, response);
			
			
		} else {
			System.out.println("회원 정보 수정 실패.....");
		}
	}

}
