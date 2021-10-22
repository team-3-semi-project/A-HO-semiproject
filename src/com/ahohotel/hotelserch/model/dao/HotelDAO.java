package com.ahohotel.hotelserch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.hotelserch.model.dto.HotelListDTO;
import com.ahohotel.hotelserch.model.dto.HotelPhotoDTO;

public class HotelDAO {

	public List<HotelListDTO> searchHotel(SqlSession session) {
		
		return session.selectList("HotelDAO.searchHotel");
	}

	public HotelListDTO selectHotelList(SqlSession session, Map<String, String> selectHotel) {

		return session.selectOne("HotelDAO.selectHotelList", selectHotel);
	}

	public int selectRoomReserve(SqlSession session, Map<String, String> selectHotel) {
		
		return session.selectOne("HotelDAO.selectRoomReserve", selectHotel);
	}

	public HotelListDTO selectHotel(SqlSession session,String code) {
		
		return session.selectOne("HotelDAO.selectHotel", code);
	}

	public int selectHotelbyName(SqlSession session, String hotelName) {
		
		return session.selectOne("HotelDAO.selectHotelbyName", hotelName);
	}

	public int insertHotel(SqlSession session, HotelListDTO thumbnail) {

		return session.insert("HotelDAO.insertHotel", thumbnail);
	}

	public int insertHotelPhoto(SqlSession session, HotelPhotoDTO hotelPhotoDTO) {

		return session.insert("HotelDAO.insertHotelPhoto", hotelPhotoDTO);
	}

	public int updateHotel(SqlSession session, HotelListDTO thumbnail) {
	
		return session.update("HotelDAO.updateHotel", thumbnail);
	}

	public int updateHotelPhoto(SqlSession session, HotelPhotoDTO hotelPhotoDTO) {

		return session.update("HotelDAO.updateHotelPhoto", hotelPhotoDTO);
	}
	
	

}
