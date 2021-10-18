package com.ahohotel.mypage.inquiry.controller;

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
import com.ahohotel.mypage.inquiry.model.Service.InquiryService;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
import com.ahohotel.mypage.inquiry.model.dto.SelectCriteriaWithUserCode;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.website.notice.model.service.NoticeService;

@WebServlet("/mypage/inquiry")
public class InquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 user의 DTO session에서 get
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		
		int userCode = user.getCode();
		String userName = user.getName();
		
		
		/* 페이징 처리 */
		//페이징 처리를 하려는 페이지
		String jspPage = "inquiryList";
		
		// 처음에 보여지는 공지 목록의 페이지는 1페이지 
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		// 검색조건 get한 후 mapping 
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		
		
		/* 전체 게시물 수(검색조건이 있는 경우 검색 조건에 맞는 전체 게시물 수) 조회 */
		int totalCount = new InquiryService().selectInquiryTotalCount(searchMap);
//		System.out.println("totalInquiryCount : " + totalCount);
		
		// 한 페이지에 보여 줄 게시물 수
		int limit = 10;	
		// 한 번에 보여질 페이징 버튼의 갯수 
		int buttonAmount = 5;
		
		// 페이징 처리에 관한 정보를 담고 있는 인스턴스 
		SelectCriteria selectCriteria = null;
		
		if(searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount, searchCondition, searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount);
		}
//		System.out.println(selectCriteria);
		
		// SelectCriteria + userCode인 DTO
		SelectCriteriaWithUserCode selectCriteriaWithUserCode = new SelectCriteriaWithUserCode(selectCriteria, userCode);
//		System.out.println(selectCriteriaWithUserCode);
		
		/* 검색조건에 해당하는 1:1문의 목록 조회 */
		List<InquiryDTO> inquiryList  = new InquiryService().selectInquiryList(selectCriteriaWithUserCode);
//		System.out.println(inquiryList);
		
		String path = "";
		if (inquiryList != null) {
			path = "/WEB-INF/view/mypage/inquiry/inquiryList.jsp";
			request.setAttribute("userName", userName);
			request.setAttribute("jspPage", jspPage);
			request.setAttribute("inquiryList", inquiryList);
			request.setAttribute("selectCriteria", selectCriteria);
			
		} else {
			path = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "1:1 문의 목록 조회 실패!");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

}
