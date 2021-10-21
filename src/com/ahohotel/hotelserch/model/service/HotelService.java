package com.ahohotel.hotelserch.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.hotelserch.model.dao.HotelDAO;
import com.ahohotel.hotelserch.model.dto.HotelListDTO;
import com.ahohotel.hotelserch.model.dto.HotelPhotoDTO;
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

	public HotelListDTO selectHotel(String code) {
		SqlSession session = getSqlSession();
		
		HotelListDTO hotel = dao.selectHotel(session, code);
		
		session.close();
		
		return hotel;
	}

	public int insertHotel(HotelListDTO thumbnail) {
		SqlSession session = getSqlSession();
		
		int result = 0;
		
		int hotelresult = dao.insertHotel(session, thumbnail);
		
		int hotelCode = dao.selectHotelbyName(session, thumbnail.getHotelName());
		
		List<HotelPhotoDTO> fileList = thumbnail.getHotelPhoto();
		
		int photoresult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			fileList.get(i).setHotelCode(hotelCode);
			photoresult += dao.insertHotelPhoto(session, fileList.get(i));
		}
		
		if(hotelresult > 0 && photoresult == fileList.size()) {
			session.commit();
			result = 1;
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

}
