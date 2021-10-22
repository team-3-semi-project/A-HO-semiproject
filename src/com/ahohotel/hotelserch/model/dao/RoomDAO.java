package com.ahohotel.hotelserch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotelserch.model.dto.RoomListDTO;

public class RoomDAO {

	public int selectRoomTotalCount(SqlSession session, Map<String, String> searchMap) {

		return session.selectOne("HotelDAO.selectRoomTotalCount", searchMap);
	}

	public List<RoomListDTO> selectRoomList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("HotelDAO.selectRoomList", selectCriteria);
	}

}
