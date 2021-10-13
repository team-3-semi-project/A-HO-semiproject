package com.ahohotel.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.model.dto.ReserveSearchPointDTO;
import com.ahohotel.mypage.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/point")
public class PointSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int searchUserNo = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		System.out.println(searchUserNo);
		ReserveSearchPointDTO reserveUser = new ReserveSearchPointDTO();
		reserveUser.setUserCode(searchUserNo);
		
		ReserveService reserveService = new ReserveService();
		List<ReserveSearchPointDTO> reserveList = reserveService.searchPoint(reserveUser);
		
		for (ReserveSearchPointDTO reserveSearchPointDTO : reserveList) {
			System.out.println(reserveSearchPointDTO);
			
		}
		
		
		String path = "";
		if(reserveList != null) {
			path = "/WEB-INF/view/mypage/pointSearch.jsp";
			request.setAttribute("reserveList", reserveList);
		} else {
//			path = "/WEB-INF/view/common/failed.jsp";
//			request.setAttribute("message", "공지사항 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
}
