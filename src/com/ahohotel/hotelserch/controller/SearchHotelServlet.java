package com.ahohotel.hotelserch.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotelserch.model.dto.HotelListDTO;
import com.ahohotel.hotelserch.model.dto.RoomListDTO;
import com.ahohotel.hotelserch.model.service.HotelService;
import com.google.gson.Gson;


@WebServlet("/hotelserch")
public class SearchHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 호텔 조회 */
		List<HotelListDTO> hotelDTO = new HotelService().searchHotel();
		
		/* 호텔 지점별로 가져오기 */
		String path = "/WEB-INF/view/hotelserch/hotelserch.jsp";
		request.setAttribute("hotelList", hotelDTO);
			
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		List<HotelListDTO> hotelDTO = new HotelService().searchHotel();
		
		/* 호텔 지점별로 가져오기 */
		request.setAttribute("hotelList", hotelDTO);
		
		
		String hotelCode = request.getParameter("hotel");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String adult = request.getParameter("adult");
		String kids = request.getParameter("kids");
		/*
		 * int adult = Integer.valueOf(request.getParameter("adult")); int kids =
		 * Integer.valueOf(request.getParameter("kids"));
		 */
		int person1 = Integer.valueOf(adult) + Integer.valueOf(kids);
		
		String person = String.valueOf(person1);
		
		Map<String, String> selectHotel = new HashMap<>();
		selectHotel.put("hotelCode", hotelCode);
		selectHotel.put("startdate", startdate);
		selectHotel.put("enddate", enddate);
		selectHotel.put("adult", adult);
		selectHotel.put("kids", kids);
		selectHotel.put("person", person);
		
		HotelService hotelService = new HotelService();
		
		List<RoomListDTO> roomList = hotelService.selectHotelList(selectHotel);
		
		if(roomList != null) {
			request.setAttribute("roomList", roomList);
			request.setAttribute("selectCriteria", selectHotel);
		} else {
			request.setAttribute("noneSelect", "예약 가능한 방이 없습니다.");
			request.setAttribute("selectCriteria", selectHotel);
		}
		
		System.out.println(roomList);

		request.getRequestDispatcher("/WEB-INF/view/hotelserch/hotelserch.jsp").forward(request, response);
		
	}

}

