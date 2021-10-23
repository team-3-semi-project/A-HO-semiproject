package com.ahohotel.mypage.reserve.point.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/point")
public class PointSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int searchUserNo = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		System.out.println(searchUserNo);
		
		
		ReserveService reserveService = new ReserveService();
		
		List<ReserveSearchListDTO> reserveList = reserveService.searchPoint(searchUserNo);
		
		for (ReserveSearchListDTO reserveSearchPointDTO : reserveList) {
			System.out.println(reserveSearchPointDTO);
			
		}
		
		/* 포인트 소멸 일자 넣기 위한 반복문 */
		for (ReserveSearchListDTO reserve : reserveList) {
			long time = reserve.getPaymentDate().getTime() + 31536000000L;  // 1년을 Millisecond으로 변환시킨 것

			java.util.Date endPointDate = new Date(time);
			
			reserve.setendPointDate(endPointDate);
		}
		
		AhoUserDTO ahoUser = reserveService.searchMemberPoint(searchUserNo);	
		
		System.out.println(ahoUser);
		
		String path = "";
		if(reserveList != null) {
			path = "/WEB-INF/view/mypage/pointSearch.jsp";
			request.setAttribute("reserveList", reserveList);
			request.setAttribute("ahoUser", ahoUser);
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "포인트 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
}
