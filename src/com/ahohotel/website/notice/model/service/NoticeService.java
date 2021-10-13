package com.ahohotel.website.notice.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.website.notice.model.dao.NoticeDAO;
import com.ahohotel.website.notice.model.dto.NoticeDTO;

public class NoticeService {
	
	private final NoticeDAO noticeDAO;
	
	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}
	
	public int selectTotalCount(Map<String, String> searchMap) {
		
		SqlSession session = getSqlSession();
		
		int totalCount = noticeDAO.selectTotalCount(session, searchMap);
		
		session.close();
		
		return totalCount;
	}

	
	public List<NoticeDTO> selectAllNoticeList(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		
		List<NoticeDTO> noticeList = noticeDAO.selectAllNoticeList(session, selectCriteria);
		
		session.close();
		
		return noticeList;
	}


	public NoticeDTO selectNoticeDetail(int no) {
		
		SqlSession session = getSqlSession();
		NoticeDTO noticeDetail = null;
		
		int result = noticeDAO.incrementNoticeCount(session, no);
		System.out.println(result);
		
		if (result > 0) {
			noticeDetail = noticeDAO.selectNoticeDetail(session, no);
			
			if (noticeDetail != null) {
				session.commit();
			} else {
				session.rollback();
			} 
		} else {
			session.rollback();
		}
		
		session.close();
		
		return noticeDetail;
	}


}
