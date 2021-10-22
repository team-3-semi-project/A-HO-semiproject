package com.ahohotel.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.inquiry.model.Service.InquiryService;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;

@WebServlet("/manager/questiondetail")
public class QuestionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "";
		int code = Integer.valueOf(request.getParameter("questioncode")); 
		
		System.out.println(code);
		
		InquiryService questionService = new InquiryService();
		
		InquiryDTO question = questionService.selectQuestionDetail(code);
		
		System.out.println(question);
		
		if(question != null) {
			path = "/WEB-INF/view/manager/questiondetail.jsp";
			request.setAttribute("question", question);
		} else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "1:1문의 상세 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answer = request.getParameter("answer");
		int code = Integer.valueOf(request.getParameter("code"));
		
		InquiryDTO question = new InquiryDTO();
		question.setInquiryCode(code);
		question.setInquiryAnswer(answer);
		
		InquiryService questionService = new InquiryService();
		
		if(questionService.updateQuestion(question)) {
			response.sendRedirect(request.getContextPath() + "/manager/questionlist");
		} else {
			request.setAttribute("message", "썸네일 게시판 등록 실패!");
			request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
		}
		
	}

}
