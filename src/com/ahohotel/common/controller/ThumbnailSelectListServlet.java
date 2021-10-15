package com.ahohotel.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.hotellist.model.service.HotelService;

@WebServlet("/thumbnail/list")
public class ThumbnailSelectListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HotelService hotelService = new HotelService();
		
		List<HotelListDTO> thumbnailList = hotelService.selectThumbnailList();
		
		for(HotelListDTO hotel : thumbnailList) {
			System.out.println(hotel);
		}
		
		String path = "";
		if(thumbnailList != null) {
			path = "/WEB-INF/view/thumbnail/thumbnailList.jsp";
			request.setAttribute("thumbnailList", thumbnailList);
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "썸네일 게시판 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
