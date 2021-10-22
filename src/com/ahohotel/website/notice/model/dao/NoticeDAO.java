package com.ahohotel.website.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.website.notice.model.dto.NoticeDTO;

public class NoticeDAO {
	
	/* 공지 총 갯수 select */
	public int selectTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("NoticeDAO.selectTotalCount", searchMap);
		
	}
	
	/* 모든 공지 조회 */
	public List<NoticeDTO> selectAllNoticeList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("NoticeDAO.selectAllNoticeList", selectCriteria);
		
	}

	/* 공지 조회수 증가 */
	public int incrementNoticeCount(SqlSession session, int no) {

		return session.update("NoticeDAO.incrementNoticeCount", no);
	}

	/* 공지 세부내용 조회 */
	public NoticeDTO selectNoticeDetail(SqlSession session, int no) {

		return session.selectOne("NoticeDAO.selectNoticeDetail", no);
	}
	
public int deleteNotice(SqlSession session, String code) {
		
		return session.delete("NoticeDAO.deleteNotice", code);
	}


	public int updateNotice(SqlSession session, NoticeDTO notice) {
		
		return session.update("NoticeDAO.updateNotice" ,notice);
	}


	public int insertNotice(SqlSession session, NoticeDTO notice) {
		
		return session.insert("NoticeDAO.insertNotice", notice);
	}

}
