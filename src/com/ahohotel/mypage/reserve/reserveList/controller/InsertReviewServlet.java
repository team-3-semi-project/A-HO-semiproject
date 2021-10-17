package com.ahohotel.mypage.reserve.reserveList.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/review")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reserveNum = Integer.parseInt(request.getParameter("no"));
		System.out.println(reserveNum);
		
		ReserveService reserveService = new ReserveService();
		ReserveSearchListDTO reserve = reserveService.selectOneReserve(reserveNum);

		System.out.println(reserve);
		
		String path = "";
		if (reserve != null) {
			path = "/WEB-INF/view/mypage/review.jsp";
			request.setAttribute("reserve", reserve);
		} else {
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNum = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		int reserveNum = Integer.valueOf(request.getParameter("reserveCode"));
		int star = Integer.valueOf(request.getParameter("score"));
		String reviewText = request.getParameter("reviewText");
		Date today = new Date();
		
		ReserveDTO review = new ReserveDTO();
		
		review.setScore(star);
		review.setUserCode(userNum);
		review.setReviewDate(today);
		review.setReview(reviewText);
		review.setReserveCode(reserveNum);
		
		System.out.println(review);
		ReserveService reserveService = new ReserveService();
		int result = reserveService.insertReview(review);
		
		String path = "";
		if (result > 0) {
			path = "/WEB-INF/view/common/success.jsp";
			request.setAttribute("successCode", "insertReview");
		} else {
			
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
