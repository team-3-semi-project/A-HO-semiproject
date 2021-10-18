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
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;

import com.ahohotel.mypage.useraccount.model.service.UserAccountService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/accountUpdate")
public class UserAccountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 로그인한 회원 code */
		int userCode = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		
		/* 수정할 회원정보 받아서 dto에 담기 */
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
		
		/* 회원정보 수정 */
		int result = new UserAccountService().updateUserAccount(updateUserDTO);
		
		String path = "";
		
		if (result > 0) { /* 회원정보 수정 성공 시 */			
			response.sendRedirect(request.getContextPath() + "/mypage/accountSelect");
			
		} else { /* 회원정보 수정 실패 시 */
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "회원정보 수정 실패!");
			request.getRequestDispatcher(path).forward(request, response);
		}
		
		
	}

}
