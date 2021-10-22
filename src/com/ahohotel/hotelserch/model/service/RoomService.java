package com.ahohotel.hotelserch.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotelserch.model.dao.RoomDAO;
import com.ahohotel.hotelserch.model.dto.RoomListDTO;

public class RoomService {
	
	RoomDAO dao = new RoomDAO();

	public int selectRoomTotalCount(Map<String, String> searchMap) {
		SqlSession session = getSqlSession();
		
		int result = dao.selectRoomTotalCount(session, searchMap);
		
		session.close();
		
		return result;
	
	}

	public List<RoomListDTO> selectRoomList(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		
		List<RoomListDTO> roomList = dao.selectRoomList(session, selectCriteria);
		
		session.close();
		
		return roomList;	
		}

}
