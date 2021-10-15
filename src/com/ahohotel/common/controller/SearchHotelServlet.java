package com.ahohotel.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.common.paging.Pagenation;
import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.hotellist.model.service.HotelService;

@WebServlet("/searchHotel")
public class SearchHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchHotel = request.getParameter("searchHotel");
		int pageNo = 1;
		
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		String searchSale = request.getParameter("searchSale");
		
		Map<String, String> searchHotel1 = new HashMap<>();
		searchHotel1.put("searchHotel", searchHotel);
		
		HotelService hotelService = new HotelService();
		int totalCount = hotelService.selectTotalCount(searchHotel1);
		
		int limit = 10;
		
		int buttonAmount = 5;
				
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		SelectCriteria selectCriteria = null;
		
		if(searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount, searchCondition, searchValue, searchSale);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount);
		}
		
		System.out.println(selectCriteria);
		
		List<HotelListDTO> hotelList = hotelService.selectHotelList(selectCriteria);
		
		System.out.println("hotelList : " + hotelList);
		
		String path = "";
		if(hotelList != null) {
			path = "/WEB-INF/view/searchHotel/SearchHotel.jsp";
			request.setAttribute("hotelList", hotelList);
			request.setAttribute("selectCriteria", selectCriteria);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 목록 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
