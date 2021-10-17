package com.ahohotel.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.hotellist.model.service.HotelService;

@WebServlet("/thumbnail/detail")
public class ThumbnailDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		HotelListDTO thumbnail = new HotelService().selectOneThumbnailBoard(no);
		System.out.println(thumbnail);
		
		String path = "";
		if(thumbnail != null) {
			path = "/WEB-INF/view/thumbnail/thumbnailDetail.jsp";
			request.setAttribute("thumbnail", thumbnail);
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "썸네일 게시판 상세 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
