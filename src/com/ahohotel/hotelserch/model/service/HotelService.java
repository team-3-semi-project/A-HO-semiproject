package com.ahohotel.hotelserch.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.hotelserch.model.dao.HotelDAO;
import com.ahohotel.hotelserch.model.dto.HotelListDTO;
import com.ahohotel.hotelserch.model.dto.RoomListDTO;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

public class HotelService {
	HotelDAO dao = new HotelDAO();

	public List<HotelListDTO> searchHotel() {
		SqlSession session = getSqlSession();
		
		List<HotelListDTO> hotelList = dao.searchHotel(session);
		
		session.close();
		
		return hotelList;
	}

	public List<RoomListDTO> selectHotelList(Map<String, String> selectHotel) {
		SqlSession session = getSqlSession();
		List<RoomListDTO> room = null;
		
		HotelListDTO RoomList = dao.selectHotelList(session, selectHotel);
		
		if(RoomList != null) {
			room = RoomList.getRoom();
			for (int i = 0; i < room.size(); i++) {
				String roomCode = String.valueOf(room.get(i).getRoomCode());
				selectHotel.put("roomCode", roomCode);
				
				int count = dao.selectRoomReserve(session, selectHotel);
				if (room.get(i).getCount() <= count) {
					room.remove(i);
				}
			}
		}
		
		session.close();
		
		return room;
	}

}
