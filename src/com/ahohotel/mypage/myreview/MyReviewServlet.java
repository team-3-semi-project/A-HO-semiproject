package com.ahohotel.mypage.myreview;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.MyReviewDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/myReview")
public class MyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int user = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		ReserveService reserve = new ReserveService();
		
		List<MyReviewDTO> reviewList = reserve.selectMyReviewList(user);
		
		System.out.println(reviewList);
		
		String path = "";
		
		if (reviewList != null) {
			path = "/WEB-INF/view/mypage/review/myReview.jsp";
			request.setAttribute("reviewList", reviewList);
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "리뷰 조회 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
