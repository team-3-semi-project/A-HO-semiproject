package com.ahohotel.hotellist.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.hotellist.model.dao.HotelListDAO;
import com.ahohotel.hotellist.model.dto.AttachmentDTO;
import com.ahohotel.hotellist.model.dto.HotelListDTO;


public class HotelService {
	
	private final HotelListDAO hotelDAO;
	
	public HotelService() {
		hotelDAO = new HotelListDAO();
	}
	
	
	/* 호텔 전체 조회용 메소드 */
	public HotelListDTO selectHotelList(int hotelCode) {
		SqlSession session = getSqlSession();
		
		HotelListDTO hotelDTO = new HotelListDAO().selectHotelList(session, hotelCode);
		
		session.close();
		
		return hotelDTO;
	}
	
	
	/* 썸네일 게시판 조회용 메소드 */
	public List<HotelListDTO> selectThumbnailList() {
		
		/* Connection 생성 */
		SqlSession session = getSqlSession();
		
		/* List 조회 */
		List<HotelListDTO> thumbnailList = HotelListDAO.selectThumbnailList(session);
		
		/* Connection 닫기 */
		session.close();
		
		/* 조회 결과 반환 */
		return thumbnailList;
	}
	
	public int insertThumbnail(HotelListDTO thumbnail) {
		
		/* Connection 생성 */
		SqlSession session = getSqlSession();
		
		/* 최종적으로 반환할 result 선언 */
		int result = 0;
		
		/* 먼저 board 테이블부터 thumbnail 내용부터 insert 한다. */
		int boardResult = HotelListDAO.insertThumbnailContent(session, thumbnail);
		
		System.out.println("boardResult : " + thumbnail);
	
		/* Attachment 리스트를 불러온다. */
		List<AttachmentDTO> fileList = thumbnail.getAttachmentList();
		
		/* fileList에 boardNo값을 넣는다. */
		for(int i = 0; i < fileList.size(); i++) {
			fileList.get(i).setRefBoardNo(thumbnail.getHotelCode());
		}
		
		/* Attachment 테이블에 list size만큼 insert 한다. */
		int attachmentResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			attachmentResult += HotelListDAO.insertAttachment(session, fileList.get(i));
		}
		
		/* 모든 결과가 성공이면 트랜젝션을 완료한다. */
		if(boardResult > 0 && attachmentResult == fileList.size()) {
			session.commit();
			result = 1;
		} else {
			session.rollback();
		}
		
		/* Connection을 닫는다. */
		session.close();
		
		/* 수행 결과를 리턴한다. */
		return result;
	}

	public HotelListDTO selectOneThumbnailBoard(int no) {
		
		SqlSession session = getSqlSession();
		
		HotelListDTO thumbnail= null;
		
		int result = HotelListDAO.incrementBoardCount(session, no);
		
		if(result > 0) {
			thumbnail = HotelListDAO.selectOneThumbnailBoard(session, no);
			
			if(thumbnail != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} else {
			session.rollback();
		}
		
		session.close();
		
		return thumbnail;
		
	}

}
