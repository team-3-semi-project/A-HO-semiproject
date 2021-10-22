package com.ahohotel.manager.controller;

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
import com.ahohotel.hotelserch.model.dto.RoomListDTO;
import com.ahohotel.hotelserch.model.service.RoomService;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.service.AhoUserService;
import com.ahohotel.website.notice.model.dto.NoticeDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/manager/noticelist")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 목록보기를 눌렀을 시 가장 처음에 보여지는 페이지는 1페이지이다.
		 * 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달받은 페이지 수 이다.
		 * */
		String currentPage = request.getParameter("currentPage");
		String black = (String) request.getAttribute("blackList");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		
		/* 전체 게시물 수가 필요하다.
		 * 데이터베이스에서 먼저 전체 게시물 수를 조회해올 것이다.
		 * 검색조건이 있는 경우 검색 조건에 맞는 전체 게시물 수를 조회한다.
		 * */
		NoticeService noticeService = new NoticeService();
		int totalCount = noticeService.selectTotalCount(searchMap);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 5;		//얘도 파라미터로 전달받아도 된다.
		/* 한 번에 보여질 페이징 버튼의 갯수 */
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		SelectCriteria selectCriteria = null;
		
		if(searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount, searchCondition, searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount);
		}
		
		if(black != null && !"".equals(black)) {
			selectCriteria.setBlackList(black);
		}
		
		/* 조회해온다 */
		List<NoticeDTO> noticeList = noticeService.selectAllNoticeList(selectCriteria);
		
		String path = "";
		if(noticeList != null) {
			path = "/WEB-INF/view/manager/noticelist.jsp";
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("selectCriteria", selectCriteria);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "회원 목록 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
