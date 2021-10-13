package com.ahohotel.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.service.AhoUserService;
import com.google.gson.Gson;

import static com.ahohotel.common.smtp.FindID.sendEmailMessage;

@WebServlet("/user/findid")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/view/login/findid.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("email");
		String jsonString = null;
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		AhoUserService userService = new AhoUserService();
		
		String userId = userService.findId(mail);
		
		if(userId != null) {
			sendEmailMessage(mail, userId);
			jsonString = new Gson().toJson("입력하신 이메일로 해당 아이디를 보내드렸습니다. 확인 부탁드립니다.");
		} else {
			jsonString = new Gson().toJson("입력하신 이메일로 가입된 회원이 없습니다. 확인 부탁드립니다.");
		}
    	out.print(jsonString);
		out.flush();
		out.close();
		
	}

}
