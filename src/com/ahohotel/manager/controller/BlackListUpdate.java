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

@WebServlet("/manager/blacklistupadte")
public class BlackListUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String blackListReason = request.getParameter("blacklistreason");
		String blacklistcancle = request.getParameter("blacklistcancle");
		
		AhoUserService userService = new AhoUserService();
		
		if(blacklistcancle != null && !"".equals(blacklistcancle)) {
			
			if(userService.blackListCancle(blacklistcancle)) {
				response.sendRedirect(request.getContextPath() + "/manager/userlist");
			} else {
				request.setAttribute("message", "블랙리스트 해제 처리 실패!");
				request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
			}
		}
		
		if(blackListReason != null && !"".equals(blacklistcancle)) {
			Map<String, String> blackListMap = new HashMap<>();
			blackListMap.put("userId", userId);
			blackListMap.put("blackListReason", blackListReason);
			
			
			if(userService.updateBlackList(blackListMap)) {
				response.sendRedirect(request.getContextPath() + "/manager/userlist");
			} else {
				request.setAttribute("message", "블랙리스트 등록 처리 실패!");
				request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
			}
		}
		
		
		
	}

}
