package com.ahohotel.common.room.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.room.model.dto.RoomDTO;
import com.ahohotel.common.room.model.dto.RoomPhotoDTO;
import com.ahohotel.hotellist.model.dto.HotelListDTO;

public class RoomDAO {
	
	/* 방 정보 조회 */
	public RoomDTO selectRoom(SqlSession session, int roomCode) {

		return session.selectOne("RoomDAO.selectRoom", roomCode);
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