package com.ahohotel.hotellist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotellist.model.dto.HotelAndHotelPhotoDTO;
import com.ahohotel.hotellist.model.dto.HotelReviewListDTO;
import com.ahohotel.hotellist.model.service.HotelListService;
import com.ahohotel.mypage.reserve.model.dto.HotelDTO;
import com.ahohotel.mypage.reserve.model.dto.HotelPhotoDTO;

@WebServlet("/hotel/list")
public class HotelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int hotelNum = Integer.parseInt(request.getParameter("no"));
		
		/* 호텔 정보 부분 SELECT */
		HotelListService hotelService = new HotelListService();
		
		List<HotelDTO> hotelList = hotelService.selectAllHotel();
		
		System.out.println("호텔목록" + hotelList);
		
		HotelPhotoDTO mainPhoto = hotelService.selectMainPhoto(hotelNum);
		
		System.out.println(mainPhoto);
		
		HotelAndHotelPhotoDTO hotel = hotelService.selectHotelPage(hotelNum);
		
		System.out.println(hotel);
		
		/* 호텔페이지 리뷰부분 SELECT */
		List<HotelReviewListDTO> hotelReviewList = hotelService.selectHotelReview(hotelNum);
		
		
		double total = 0;
		double count = 0;
		
		for (HotelReviewListDTO ho : hotelReviewList) {
			if(ho.getReview() != null) {
				total += ho.getScore();
				count++;
			}
		}
		
		double totalScore = total/count ;
		
		
		String path = "";
		if (hotel != null) {
			path = "/WEB-INF/view/website/hotelList.jsp";
			request.setAttribute("mainPhoto", mainPhoto);
			request.setAttribute("hotel", hotel);
			request.setAttribute("hotelReview", hotelReviewList);
			request.setAttribute("totalScore", totalScore);
			request.setAttribute("hotelList", hotelList);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
