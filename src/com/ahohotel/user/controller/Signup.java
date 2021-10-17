package com.ahohotel.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.service.AhoUserService;

@WebServlet("/user/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	/* get 요청은 단순 회원가입 버튼 클릭 시 요청 되는 부분 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/view/login/signup.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/* post는 회원가입 페이지에서 회원가입 진행 시 요청 되는 부분 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(pw);
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		int year = Integer.valueOf(birthday.substring(0,4));
		int month = Integer.valueOf(birthday.substring(4,6));
		int day = Integer.valueOf(birthday.substring(6,8));
		Calendar birth = new GregorianCalendar(year, month-1, day);
		Date bday = new Date(birth.getTimeInMillis());

		AhoUserDTO signupDTO = new AhoUserDTO();
		signupDTO.setId(id);
		signupDTO.setPw(pw);
		signupDTO.setName(name);
		signupDTO.setPhone(phone);
		signupDTO.setEmail(email);
		signupDTO.setGender(gender);
		signupDTO.setBirth(bday);
		
		AhoUserService userService = new AhoUserService();
		
		if(userService.signUp(signupDTO)) {
			response.sendRedirect(request.getContextPath());
//			System.out.println("회원가입 성공!");
		} else {
			request.setAttribute("message", "회원가입 실패!");
			request.getRequestDispatcher("/WEB-INF/view/common/failed.jsp").forward(request, response);
//			System.out.println("회원가입 실패!");
		}
		
		
		
		
		
		
		
		
		
		
	}
	
}
