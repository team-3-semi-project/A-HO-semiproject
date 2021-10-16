package com.ahohotel.common.room.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.room.model.dto.RoomDTO;
import com.ahohotel.common.room.model.dto.RoomPhotoDTO;
import com.ahohotel.hotellist.model.dto.HotelListDTO;

public class RoomDAO {
	
public int selectTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("RoomDAO.selectTotalCount", searchMap);
	}

	public static int insertRoom(SqlSession session, RoomDTO newRoom) {
		
		return session.insert("RoomDAO.insertRoom", newRoom);
	}
	
	/* 썸네일게시판 목록 조회용 메소드 */
	public static List<RoomPhotoDTO> selectThumbnailList(SqlSession session) {
		
		return session.selectList("RoomPhotoDAO.selectThumbnailList");
	}
	
	/* 썸네일 제목과 내용 insert용 메소드 */
	public static int insertThumbnailContent(SqlSession session, HotelListDTO thumbnail) {
		
		return session.insert("RoomPhotoDAO.insertThumbnailContent", thumbnail);
	}
}