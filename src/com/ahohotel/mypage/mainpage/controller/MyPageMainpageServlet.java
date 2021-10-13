package com.ahohotel.mypage.mainpage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage")
public class MyPageMainpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getName();
		int vipCode = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getVipCode();
		
		String vipGrade = "";
		if (vipCode == 1) {
			vipGrade = "브론즈 ";
		} else if (vipCode == 2) {
			vipGrade = "실버 ";
		} else if (vipCode == 3) {
			vipGrade = "골드 ";
		} else if (vipCode == 4) {
			vipGrade = "다이아 ";
		}
		
		String path = "/WEB-INF/view/mypage/mypageMain.jsp";
		request.setAttribute("userName", userName);
		request.setAttribute("vipGrade", vipGrade);

		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
