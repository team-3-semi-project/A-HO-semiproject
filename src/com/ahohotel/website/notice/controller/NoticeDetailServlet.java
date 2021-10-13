package com.ahohotel.website.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.valueOf(request.getParameter("no"));
		System.out.println(no);
		
		NoticeService noticeService = new NoticeService();
		NoticeDTO noticeDetail = noticeService.selectNoticeDetail(no);
		
		System.out.println(noticeDetail);
		
		String path = "";
		if (noticeDetail != null) {
			path = "/WEB-INF/view/website/noticeDetail.jsp";
			request.setAttribute("notice", noticeDetail);
		} else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "공지사항 상세 보기 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
