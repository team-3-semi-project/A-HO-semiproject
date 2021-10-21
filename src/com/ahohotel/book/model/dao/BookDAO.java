package com.ahohotel.book.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.book.model.dto.AhoUserAndVipDTO;
import com.ahohotel.book.model.dto.BookDTO;
import com.ahohotel.book.model.dto.BookingHotelDTO;
import com.ahohotel.book.model.dto.PetDTO;
import com.ahohotel.mypage.model.dto.RoomDTO;

public class BookDAO {

	public BookingHotelDTO selectBookingHotel(SqlSession session, int hotelCode) {
		
		return session.selectOne("BookDAO.selectBookingHotel", hotelCode);
	}
	
	public RoomDTO selectBookingRoom(SqlSession session, int roomCode) {
		
		return session.selectOne("BookDAO.selectBookingRoom", roomCode);
	}

	public AhoUserAndVipDTO selectBookingUserAndVip(SqlSession session, int userCode) {
		
		return session.selectOne("BookDAO.selectBookingUserAndVip", userCode);
	}

	public int insertBook(SqlSession session, BookDTO bookDTO) {
		
		return session.insert("BookDAO.insertBook", bookDTO);
	}

	public int insertPet(SqlSession session, PetDTO petDTO) {
		
		return session.insert("BookDAO.insertPet", petDTO);
	}

	public int selectAllPriceSum(SqlSession session, int userCode) {
		
		return session.selectOne("BookDAO.selectAllPriceSum", userCode);
	}

	public int selectVipStandard(SqlSession session, int vipCode) {
		
		return session.selectOne("BookDAO.selectVipStandard", vipCode);
	}

	public int updateUserInfo(SqlSession session, Map<String, Integer> userInfo) {
		
		return session.update("BookDAO.updateUserInfo", userInfo);
	}


}
