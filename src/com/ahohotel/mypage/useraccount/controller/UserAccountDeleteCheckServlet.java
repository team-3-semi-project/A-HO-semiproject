package com.ahohotel.mypage.useraccount.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/accountDeleteCheck")
public class UserAccountDeleteCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/view/mypage/useraccount/userAccountDeleteCheck.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

}
