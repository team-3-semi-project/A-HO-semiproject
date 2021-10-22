package com.ahohotel.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;
import com.ahohotel.user.model.dto.ReserveAndReportDTO;
import com.ahohotel.user.model.service.AhoUserService;
import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/manager/noticedetail")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		
		int code = Integer.valueOf(request.getParameter("code"));
		
		NoticeService noticeService = new NoticeService();
		NoticeDTO noticeDetail = noticeService.selectNoticeDetail(code);
		
		if (noticeDetail != null) {
			path = "/WEB-INF/view/manager/noticedetail.jsp";
			request.setAttribute("notice", noticeDetail);
		} else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "공지사항 상세 보기 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService noticeService = new NoticeService();
		String path = null;
		
		if(request.getParameter("delete") != null && !"".equals(request.getParameter("delete"))) {
			String code = request.getParameter("code");
			
			if(noticeService.deleteNotice(code)) {
				response.sendRedirect(request.getContextPath() + "/manager/noticelist");
			} else {
				path = "/WEB-INF/views/common/failed.jsp";
				request.setAttribute("message", "공지사항 삭제에 실패하였습니다.");
			}
			
		} else {
			NoticeDTO notice = new NoticeDTO();
			notice.setNoticeCode(Integer.valueOf(request.getParameter("code")));
			notice.setNoticeTitle(request.getParameter("title"));
			notice.setNoticeContent(request.getParameter("content"));
			
			if(noticeService.updateNotice(notice)) {
				response.sendRedirect(request.getContextPath() + "/manager/noticelist");
			} else {
				path = "/WEB-INF/views/common/failed.jsp";
				request.setAttribute("message", "공지사항 수정에 실패하였습니다.");
			}
		}
		
	}

}
