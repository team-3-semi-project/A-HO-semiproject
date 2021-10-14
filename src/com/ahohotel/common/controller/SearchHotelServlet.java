package com.ahohotel.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchHotel")
public class SearchHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchHotel = request.getParameter("searchHotel");
		
		Map<String, String> searchHotel1 = new HashMap<>();
		searchHotel1.put("searchHotel", searchHotel);
		
	
	}

}
