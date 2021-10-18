package com.ahohotel.mypage.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.inquiry.model.Service.InquiryService;

@WebServlet("/mypage/inquiry/delete")
public class InquiryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//선택한 1:1문의의 inquiryCode
		int inquiryCode = Integer.valueOf(request.getParameter("inquiryCode"));
		System.out.println(inquiryCode);
		
		int result = new InquiryService().deleteInquiry(inquiryCode);
		
		if (result > 0) {
			System.out.println("삭제 성공");
			response.sendRedirect(request.getContextPath() + "/mypage/inquiry");
		} else {
			String path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "1:1 문의 삭제 실패!");
		}

	}

}
