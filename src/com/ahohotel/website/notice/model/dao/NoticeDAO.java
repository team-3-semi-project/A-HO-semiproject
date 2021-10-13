package com.ahohotel.website.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.website.notice.model.dto.NoticeDTO;

public class NoticeDAO {
	
	public int selectTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("NoticeDAO.selectTotalCount", searchMap);
		
	}
	
	
	public List<NoticeDTO> selectAllNoticeList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("NoticeDAO.selectAllNoticeList", selectCriteria);
		
	}


	public int incrementNoticeCount(SqlSession session, int no) {

		return session.update("NoticeDAO.incrementNoticeCount", no);
	}

	public NoticeDTO selectNoticeDetail(SqlSession session, int no) {

		return session.selectOne("NoticeDAO.selectNoticeDetail", no);
	}

}