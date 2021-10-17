package com.ahohotel.website.notice.controller;

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
import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리를 하려는 페이지
		String jspPage = "noticeList";
		
		/* 처음에 보여지는 공지 목록의 페이지는 1페이지 */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		/* 검색조건 get한 후 mapping */
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		
		/* 전체 게시물 수(검색조건이 있는 경우 검색 조건에 맞는 전체 게시물 수) 조회 */
		int totalCount = new NoticeService().selectTotalCount(searchMap);
//		System.out.println("totalNoticeCount : " + totalCount);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;	
		/* 한 번에 보여질 페이징 버튼의 갯수 */
		int buttonAmount = 5;
		
		/* 페이징 처리에 관한 정보를 담고 있는 인스턴스 */
		SelectCriteria selectCriteria = null;
		
		if(searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount, searchCondition, searchValue, searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount);
		}
//		System.out.println(selectCriteria);
		
		List<NoticeDTO> noticeList = new NoticeService().selectAllNoticeList(selectCriteria);
//		System.out.println(noticeList);
		
		String path = "/WEB-INF/view/website/noticeList.jsp";
		request.setAttribute("jspPage", jspPage);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("selectCriteria", selectCriteria);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
