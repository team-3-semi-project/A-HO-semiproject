package com.ahohotel.mypage.reserve.reserveList.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/mypage/reserve")
public class MyReserveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNum = ((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode();
		
		ReserveService reserveService = new ReserveService();
		
		List<ReserveSearchListDTO> reserveList = reserveService.selectMyReserve(userNum);
		
		HotelPhotoDTO hotelPhoto = new HotelPhotoDTO();
		
		
		/* 호텔의 이미지가 없더라도 동작하기 위한 코드 */
		for (ReserveSearchListDTO resertImg : reserveList) {
			int hotelNum = 0;
			
			hotelNum = resertImg.getHotel().getHoCode();
			hotelPhoto = reserveService.selectPhotoPath(hotelNum);
			resertImg.setHotelPhoto(hotelPhoto);
				
			System.out.println(resertImg.getHotelPhoto());
		}
		java.util.Date today = new Date();
		System.out.println(today);
		
		System.out.println(reserveList);
		
		String path = "";
		
		if (reserveList != null) {
			path = "/WEB-INF/view/mypage/myReserve.jsp";
			request.setAttribute("reserveList", reserveList);
			request.setAttribute("today", today);
		} else {
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
