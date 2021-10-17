package com.ahohotel.mypage.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.inquiry.model.Service.InquiryService;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/mypage/inquiry/detail")
public class InquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		
		String userName = user.getName();
		
		/* 선택한 1:1문의 code */
		int no = Integer.valueOf(request.getParameter("no"));
//		System.out.println(no);
		
		/* 1:1문의 세부내용 조회하기 */
		InquiryDTO inquiryDetail = new InquiryService().selectInquiryDetail(no);
//		System.out.println(inquiryDetail);
		
		String path = "";
		if (inquiryDetail != null) {
			path = "/WEB-INF/view/mypage/inquiry/inquiryDetail.jsp";
			request.setAttribute("userName", userName);
			request.setAttribute("inquiry", inquiryDetail);
		} else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "공지사항 상세 보기 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
