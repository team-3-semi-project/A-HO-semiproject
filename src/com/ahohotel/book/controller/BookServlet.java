package com.ahohotel.book.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.book.model.dto.AhoUserAndVipDTO;
import com.ahohotel.book.model.dto.BookDTO;
import com.ahohotel.book.model.dto.BookingHotelDTO;
import com.ahohotel.book.model.dto.PetDTO;
import com.ahohotel.book.model.service.BookService;
import com.ahohotel.mypage.model.dto.RoomDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인한 사용자 정보
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		int userCode = user.getCode();
		
		/* 임시데이터 */
		int hotelCode = 2;											//호텔 코드
		int roomCode = 7;											//객실 코드
		String checkIn = "2021-10-21";						//체크인 날짜
		String checkOut = "2021-10-24";						//체크아웃 날짜
		int roomPerson = 3;											//숙박인원
		String roomOption = "Y";									//침대추가 여부
		

		/* 예약하려는 호텔정보 조회 */
		BookingHotelDTO bookingHotelDTO = new BookService().selectBookingHotel(hotelCode);
//		System.out.println("bookingHotelDTO : " + bookingHotelDTO);
		
		/* 예약하려는 객실정보 조회 */
		RoomDTO bookingRoomDTO = new BookService().selectBookingRoom(roomCode);
//		System.out.println("bookingRoomDTO : " + bookingRoomDTO);
		
		/* 사용자 정보(등급테이블과 조인해서) 조회 */
		AhoUserAndVipDTO bookingUserDTO = new BookService().selectBookingUserAndVip(userCode);
//		System.out.println("bookingUserDTO" + bookingUserDTO);
		
		/* 금액 합계 계산 */
		int days = calDateBetweenAandB(checkIn, checkOut);
		int price = bookingRoomDTO.getPrice();
		int roomOptionPrice = 0;
		if (roomOption == "Y") {
			roomOptionPrice = 10000;
		}
		int sumPrice = (days * price) + roomOptionPrice;
		
		/* 할인 금액 계산 */
		int sale = bookingUserDTO.getVipSale();
		int priceSale = (int) (sumPrice * ((double)sale / 100));
//		System.out.println(sumPriceSale);
		
		String path = "/WEB-INF/view/book/book.jsp";
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("roomPerson", roomPerson);
		request.setAttribute("roomOption", roomOption);
		request.setAttribute("bookingHotel", bookingHotelDTO);
		request.setAttribute("bookingRoom", bookingRoomDTO);
		request.setAttribute("bookingUser", bookingUserDTO);
		request.setAttribute("sumPrice", sumPrice);
		request.setAttribute("priceSale", priceSale);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		
		// 예약내역 insert 할 데이터 준비
		int userCode = user.getCode();
		int roomCode = Integer.valueOf(request.getParameter("roomCode"));
		String reserveName = request.getParameter("bookName");
		String reservePhone = request.getParameter("bookPhone");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int roomPerson = Integer.valueOf(request.getParameter("roomPerson"));
		String roomOption = request.getParameter("roomOption");
		int usePoint = Integer.valueOf(request.getParameter("usePoint"));
		int totalAmountOfPayment = Integer.valueOf(request.getParameter("totalAmountOfPayment"));
		
		// 체크인, 체크아웃을 String -> Date 형변환
		Date startDate = null;
		Date endDate = null;
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			startDate = new Date(sdf.parse(checkIn).getTime());
			endDate = new Date(sdf.parse(checkOut).getTime());
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
			
		// 예약내역에 따른 반려동물내역 insert할 데이터 준비
		int bookCode = 0;
		
		String[] petKind = request.getParameterValues("petKind");
		String[] petSize = request.getParameterValues("petSize");
		String[] petIssue = request.getParameterValues("petIssue");

		/* 예약 insert */
		//insert할 dto 준비
		BookDTO bookDTO = new BookDTO();
		bookDTO.setUserCode(userCode);
		bookDTO.setRoomCode(roomCode);
		bookDTO.setReserveName(reserveName);
		bookDTO.setReservePhone(reservePhone);
		bookDTO.setStartDate(startDate);
		bookDTO.setEndDate(endDate);
		bookDTO.setPersonNum(roomPerson);
		bookDTO.setRoomOption(roomOption);
		bookDTO.setUsePoint(usePoint);
		bookDTO.setPrice(totalAmountOfPayment);		
//		System.out.println("bookDTO : " + bookDTO);
		
		// 예약내역 insert 메소드 수행
		int bookInsertResult = new BookService().insertBook(bookDTO);
		
		String path2 = "";
		if (bookInsertResult > 0) {			
			//insert한 예약 코드
			bookCode = bookDTO.getBookCode();
			for (int i = 0; i < petKind.length; i ++) {
				PetDTO petDTO = new PetDTO();
				
				petDTO.setBookCode(bookCode);
				petDTO.setPetKinds(petKind[i]);
				petDTO.setPetSize(petSize[i]);
				petDTO.setPetIssue(petIssue[i]);
				
				int petInsertResult = new BookService().insertPet(petDTO);
				
				if (petInsertResult > 0) {
//					System.out.println("성공");
				} else {
					path2 = "/WEB-INF/view/common/failed.jsp";
					request.setAttribute("message", "예약내역의 반려동물 내역 insert 실패!");
				}	
			}
		} else {
			path2 = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "예약내역 insert 실패!");
		}
		
		/* 회원의 모든 예약내역의 결제액 합 select */
		int allPriceSum = new BookService().selectAllPriceSum(userCode);
//		System.out.println("allPriceSum : " + allPriceSum);
		
		/* vip 기준 select */
		int updateVipCode = 0;
		if (allPriceSum > new BookService().selectVipStandard(4)) {
			updateVipCode = 4;
		} else if (allPriceSum > new BookService().selectVipStandard(3)) {
			updateVipCode = 3;
		} else if (allPriceSum > new BookService().selectVipStandard(2)) {
			updateVipCode = 2;
		} else {
			updateVipCode = 1;
		}

		/* 예약내역에 따라 변경된 회원정보 (point, vip) update */
		int updatePoint = (int) (user.getPoint() - usePoint + (totalAmountOfPayment * 0.01));
		Map<String, Integer> userInfo = new HashMap<>(); 
		userInfo.put("userCode", userCode);
		userInfo.put("updateVipCode", updateVipCode);
		userInfo.put("updatePoint", updatePoint);
		System.out.println(userInfo);
		
		int updateUserResult =  new BookService().updateUserInfo(userInfo);
		
		if (updateUserResult > 0) {
//			System.out.println("성공");
		} else {
			path2 = "/WEB-INF/view/common/failed.jsp";
			request.setAttribute("message", "예약내역에 따른 회원정보 수정 실패!");
		}

	}

	
	/* 체크아웃 날짜 - 체크인 날짜 구하는 메소드 */
	public int calDateBetweenAandB(String checkIn, String checkOut) {
	    String startDate = checkIn;
	    String endDate1 = checkOut;
	    
	    int days = 1;
	 
	    try{
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	        
	        //두 날짜를 parse()를 통해 Date형으로 변환
	        java.util.Date FirstDate = format.parse(startDate);
	        java.util.Date SecondDate = format.parse(endDate1);

	        long calDate = SecondDate.getTime() - FirstDate.getTime(); 

	        long calDateDays = (int) calDate / (24*60*60*1000); 
	 
	        days += (int) Math.abs(calDateDays);
	    } catch(ParseException e) {
	        	e.printStackTrace();
	    }
	    return days;
	}    
}
