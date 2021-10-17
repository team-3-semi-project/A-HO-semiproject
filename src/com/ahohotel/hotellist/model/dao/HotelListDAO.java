package com.ahohotel.hotellist.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotellist.model.dto.AttachmentDTO;
import com.ahohotel.hotellist.model.dto.HotelListDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;


public class HotelListDAO {

	
	/* 호텔 정보 조회 */
	public HotelListDTO selectHotelList(SqlSession session, int hotelCode) {

		return session.selectOne("HotelListDAO.selectHotelList", hotelCode);
	}

	
	/* 썸네일게시판 목록 조회용 메소드 */
	public static List<HotelListDTO> selectThumbnailList(SqlSession session) {
		
		return session.selectList("HotelListDAO.selectThumbnailList");
	}
	
	/* 썸네일 제목과 내용 insert용 메소드 */
	public static int insertThumbnailContent(SqlSession session, HotelListDTO thumbnail) {
		
		return session.insert("HotelListDAO.insertThumbnailContent", thumbnail);
	}
	
	/* Attachment 테이블에 insert */
	public static int insertAttachment(SqlSession session, AttachmentDTO file) {
		
		return session.insert("HotelListDAO.insertAttachment", file);
	}
	
	public static int incrementBoardCount(SqlSession session, int no) {
		
		return session.update("HotelListDAO.incrementBoardCount", no);
	}

	public static HotelListDTO selectOneThumbnailBoard(SqlSession session, int no) {
		
		return session.selectOne("HotelListDAO.selectOneThumbnailBoard", no);
	}

}


