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
	
	/* 공지의 총 갯수 조회 */
	public int selectTotalCount(Map<String, String> searchMap) {
		
		SqlSession session = getSqlSession();
		
		int totalCount = noticeDAO.selectTotalCount(session, searchMap);
		
		session.close();
		
		return totalCount;
	}

	/* 공지 목록 조회 */
	public List<NoticeDTO> selectAllNoticeList(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		
		List<NoticeDTO> noticeList = noticeDAO.selectAllNoticeList(session, selectCriteria);
		
		session.close();
		
		return noticeList;
	}

	/* 공지 세부내용 조회 */
	public NoticeDTO selectNoticeDetail(int no) {
		
		SqlSession session = getSqlSession();
		NoticeDTO noticeDetail = null;
		
		/* 공지 세부내용 조회 시 마다 공지의 조회수 +1 증가 */
		int result = noticeDAO.incrementNoticeCount(session, no);
//		System.out.println(result);
		
		if (result > 0) {
			/* 공지 세부내용 조회 */
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
	
	public boolean deleteNotice(String code) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = noticeDAO.deleteNotice(session, code);
		
		if (result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return isSuccess;
	}

	public boolean updateNotice(NoticeDTO notice) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = noticeDAO.updateNotice(session, notice);
		
		if (result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return isSuccess;
	}

	public boolean insertNotice(NoticeDTO notice) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = noticeDAO.insertNotice(session, notice);
		
		if (result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return isSuccess;
	}


}
