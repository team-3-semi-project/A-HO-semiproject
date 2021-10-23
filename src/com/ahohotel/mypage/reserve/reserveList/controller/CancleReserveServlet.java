package com.ahohotel.mypage.reserve.reserveList.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.dto.UserDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/reserve/cancle")
public class CancleReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reserveCode = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(reserveCode);
		
		ReserveService reserverService = new ReserveService();
		
		ReserveDTO reserve = reserverService.selectCancleReserve(reserveCode);
		
		System.out.println(reserve);
		
		
		int user = reserve.getUserCode();
		UserDTO ahoUser = reserverService.selectUser(user);
		
		System.out.println(ahoUser);
		int savePoint = (int)(reserve.getPrice() * 0.1);
		
		int usePoint = reserve.getUsePoint();
		
		int userPoint = ahoUser.getPoint();
		
		int totalPoint = userPoint + usePoint - savePoint;
		
		int Pointresult = reserverService.updatePoint(totalPoint, user);
		
		int reserveResult = reserverService.deleteReserve(reserveCode); 
		
		String path = "";
		if (reserveResult > 0 && Pointresult > 0) {
			path = "/WEB-INF/view/common/success.jsp";
			request.setAttribute("successCode", "deleteReserve");
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "예약취소 실패");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	
}
