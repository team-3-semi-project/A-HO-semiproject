package com.ahohotel.website.oftenQuestion.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.website.oftenQuestion.model.dto.OftenQuestionDTO;
import com.ahohotel.website.oftenQuestion.model.service.OftenQuestionService;

@WebServlet("/website/oftenOQ")
public class OftenQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<OftenQuestionDTO> oqList = new OftenQuestionService().selectAllOq();
		
		System.out.println(oqList);
		
		String path = "";
		if (oqList != null) {
			path = "/WEB-INF/view/website/oftenQuestion.jsp";
			request.setAttribute("oqList", oqList);
		} else {
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
