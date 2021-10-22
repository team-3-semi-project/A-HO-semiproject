package com.ahohotel.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/manager/noticeinsert")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/view/manager/noticeinsert.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService noticeService = new NoticeService();
		String path = null;
		
		NoticeDTO notice = new NoticeDTO();
		notice.setNoticeTitle(request.getParameter("title"));
		notice.setNoticeContent(request.getParameter("content"));
		
		if(noticeService.insertNotice(notice)) {
			response.sendRedirect(request.getContextPath() + "/manager/noticelist");
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "공지사항 수정에 실패하였습니다.");
		}
	}

}
