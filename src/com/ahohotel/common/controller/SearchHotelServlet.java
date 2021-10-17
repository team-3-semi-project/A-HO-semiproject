package com.ahohotel.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.hotellist.model.service.HotelService;

@WebServlet("/searchHotel")
public class SearchHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 호텔의 코드 */
		int hotelCode = ((HotelListDTO)request.getSession().getAttribute("searchHotel")).getHotelCode();
		
		/* 호텔 조회 */
		HotelListDTO hotelDTO = new HotelService().selectHotelList(hotelCode);
		
		/* 호텔 지점별로 가져오기 */
		String hotelName = hotelDTO.getHotelName();
		
		String hotelRegion ="";
		if (hotelCode == 1) {
			hotelName = "강원";
		} else if (hotelCode == 2) {
			hotelName = "부산";
		} else if (hotelCode == 3) {
			hotelName = "서울";
		} else if (hotelCode == 4) {
			hotelName = "인천";
		} else if (hotelCode == 5) {
			hotelName = "제주";
		}
				
	
		
		String path = "";
		request.setAttribute("hotelName", hotelName);
		request.setAttribute("hotelRegion", hotelRegion);
			
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
