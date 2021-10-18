package com.ahohotel.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.service.AhoUserService;

/**
 * Servlet implementation class ReportCheck
 */
@WebServlet("/manager/reportcheck")
public class ReportCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String managerCheck = request.getParameter("reportcheck");
		String reportCode = request.getParameter("reportcode");
		
		Map<String, String> reportMap = new HashMap<>();
		reportMap.put("reportcheck", managerCheck);
		reportMap.put("reportcode", reportCode);
		
		AhoUserService userService = new AhoUserService();
		
		if(userService.checkReport(managerCheck, reportMap)) {
			response.sendRedirect(request.getContextPath() + "/manager/reportlist");
		} else {
			request.setAttribute("message", "신고 확인 처리 실패!");
			request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
		}
	}

}
