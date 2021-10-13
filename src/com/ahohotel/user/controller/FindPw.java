package com.ahohotel.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ahohotel.user.model.service.AhoUserService;
import com.google.gson.Gson;

import static com.ahohotel.common.smtp.FindPW.sendEmailMessage;

@WebServlet("/user/findpw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/view/login/findpw.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String jsonString = null;
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		AhoUserService userService = new AhoUserService();
		
		String userEmail = userService.findEmailById(id);
		
		if(userEmail != null) {
			String code = sendEmailMessage(userEmail);
			
			jsonString = new Gson().toJson(code);
		} else {
			jsonString = new Gson().toJson("입력하신 아이디는 존재하지 않습니다.");
		}
		
		out.print(jsonString);
		out.flush();
		out.close();
	}

}
