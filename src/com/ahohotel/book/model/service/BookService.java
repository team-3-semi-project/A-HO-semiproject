package com.ahohotel.book.model.service;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.book.model.dao.BookDAO;
import com.ahohotel.book.model.dto.AhoUserAndVipDTO;
import com.ahohotel.book.model.dto.BookDTO;
import com.ahohotel.book.model.dto.BookingHotelDTO;
import com.ahohotel.book.model.dto.PetDTO;
import com.ahohotel.book.model.dto.RoomDTO;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.Map;

public class BookService {

	public BookingHotelDTO selectBookingHotel(int hotelCode) {
		SqlSession session = getSqlSession();
		
		BookingHotelDTO bookingHotelDTO = new BookDAO().selectBookingHotel(session, hotelCode);
		
		session.close();
		
		return bookingHotelDTO;
	}
	
	public RoomDTO selectBookingRoom(int roomCode) {
		SqlSession session = getSqlSession();
		
		RoomDTO bookingRoomDTO = new BookDAO().selectBookingRoom(session, roomCode);
		
		session.close();
		
		return bookingRoomDTO;
	}

	public AhoUserAndVipDTO selectBookingUserAndVip(int userCode) {
		SqlSession session = getSqlSession();
		
		AhoUserAndVipDTO bookingUserDTO = new BookDAO().selectBookingUserAndVip(session, userCode);
		
		session.close();
		
		return bookingUserDTO;
	}

	public int insertBook(BookDTO bookDTO) {
		SqlSession session = getSqlSession();
		
		int bookInsertResult = new BookDAO().insertBook(session, bookDTO);
		
		if (bookInsertResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return bookInsertResult;
	}

	public int insertPet(PetDTO petDTO) {
		SqlSession session = getSqlSession();
		
		int petInsertResult = new BookDAO().insertPet(session, petDTO);
		
		if (petInsertResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return petInsertResult;
	}

	public int selectAllPriceSum(int userCode) {
		SqlSession session = getSqlSession();
		
		int allPriceSum = new BookDAO().selectAllPriceSum(session, userCode);
		
		session.close();
		
		return allPriceSum;
	}

	public int selectVipStandard(int vipCode) {
		SqlSession session = getSqlSession();
		
		int vipStandard = new BookDAO().selectVipStandard(session, vipCode);
		
		session.close();
		
		return vipStandard;
	}

	public int updateUserInfo(Map<String, Integer> userInfo) {
		SqlSession session = getSqlSession();
		
		int updateUserResult = new BookDAO().updateUserInfo(session, userInfo);
		
		if (updateUserResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return updateUserResult;
	}

}
