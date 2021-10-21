package com.ahohotel.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotelserch.model.dto.HotelListDTO;
import com.ahohotel.hotelserch.model.service.HotelService;

@WebServlet("/manager/hotel")
public class HotelManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 호텔 조회 */
		List<HotelListDTO> hotelDTO = new HotelService().searchHotel();
		
		/* 호텔 지점별로 가져오기 */
		String path = "/WEB-INF/view/manager/hotelmanagement.jsp";
		request.setAttribute("hotelList", hotelDTO);
			
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
