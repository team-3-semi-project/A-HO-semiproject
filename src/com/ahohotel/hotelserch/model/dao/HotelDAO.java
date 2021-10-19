package com.ahohotel.hotelserch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.hotelserch.model.dto.HotelListDTO;

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

}
