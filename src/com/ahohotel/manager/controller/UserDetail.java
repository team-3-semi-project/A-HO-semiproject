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

@WebServlet("/manager/userdetail")
public class UserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/view/manager/userdetail.jsp";
		/* request.getRequestDispatcher(path).forward(request, response); */
		
		String code = request.getParameter("code");
		
		AhoUserService userService = new AhoUserService();
		
		AhoUserDTO user = userService.selectUserDetail(code);
		
		request.setAttribute("user", user);
		
		System.out.println(user);

		
		/* 예약 내역이 있는 회원들만 예약 리스트를 담아서 내보내기 */
		List<ReserveAndReportDTO> reserveList = user.getReserve();
		ReserveAndReportDTO reserve1 = reserveList.get(0);
		
		if (reserve1.getReserveCode() != 0) {
			request.setAttribute("reserveList", reserveList);
		}
		
		/* 예약 내역이 있으면서, 리뷰 내역이 있는 회원만 예약 리스트를 담아서 보내기 */
		List<ReserveAndReportDTO> reserveList2 = new ArrayList<ReserveAndReportDTO>();
		int k = 0;
		for (int i = 0; i < reserveList.size(); i++) {
			ReserveAndReportDTO reserve = reserveList.get(i);
			if(reserve.getReview() != null) {
				List<ReportDTO> reportL = reserve.getReport();
				k = 0;
				for (int j = 0; j < reportL.size(); j++) {
					ReportDTO report = reportL.get(j);
					if(report.getReportCode() != 0) {
						reserve.setLatelyReportReason(report.getReserveReason());
						k += 1;
					}
				}
				reserve.setReportCount(k);
				reserveList2.add(reserve);
			}
		}
		 
		if (reserveList2 != null) {
			request.setAttribute("reportReserveList", reserveList2);
		}
		
		/* jsp로 이동 */
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
