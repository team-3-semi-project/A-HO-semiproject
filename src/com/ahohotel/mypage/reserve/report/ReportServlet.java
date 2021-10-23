package com.ahohotel.mypage.reserve.report;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		System.out.println(reserveCode);
		
		ReserveService reserveService = new ReserveService();
		ReserveDTO reserve = reserveService.selectReserve(reserveCode);
		
		request.setAttribute("reserve", reserve);
		
		String path = "/WEB-INF/view/searchHotel/report.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int loginUser = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		int reserveCode = Integer.valueOf(request.getParameter("reserveCode"));
		String reportText = request.getParameter("reportText");
		
		System.out.println(loginUser);
		System.out.println(reserveCode);
		System.out.println(reportText);
		
		ReportDTO report = new ReportDTO();
		report.setReserveCode(reserveCode);
		report.setReportReason(reportText);
		report.setUserCode(loginUser);
		
		ReserveService reserveService = new ReserveService();
		
		int result = reserveService.insertReport(report);
		String path = "";
		
		if (result > 0) {
			path = "/WEB-INF/view/common/success.jsp";
			request.setAttribute("successCode", "insertReport");
		} else {
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
