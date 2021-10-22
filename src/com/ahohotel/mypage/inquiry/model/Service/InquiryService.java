package com.ahohotel.mypage.inquiry.model.Service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.mypage.inquiry.model.dao.InquiryDAO;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
import com.ahohotel.mypage.inquiry.model.dto.InquiryFileDTO;
import com.ahohotel.mypage.inquiry.model.dto.SelectCriteriaWithUserCode;

public class InquiryService {

	public int selectInquiryTotalCount(Map<String, String> searchMap) {
		
		SqlSession session = getSqlSession();
		
		int totalCount = new InquiryDAO().selectInquiryTotalCount(session, searchMap);
		
		session.close();
		
		return totalCount;
	}

	public List<InquiryDTO> selectInquiryList(SelectCriteriaWithUserCode selectCriteriaWithUserCode) {
		
		SqlSession session = getSqlSession();
		
		List<InquiryDTO> inquiryList = new InquiryDAO().selectInquiryList(session, selectCriteriaWithUserCode);
		
		session.close();
		
		return inquiryList;
	}

	public InquiryDTO selectInquiryDetail(int no) {
		
		SqlSession session = getSqlSession();
		
		InquiryDTO inquiryDetail = new InquiryDAO().selectInquiryDetail(session, no);
		
		session.close();
		
		return inquiryDetail;
	}
	
	public InquiryDTO selectInquiryDetailWithoutFile(int no) {
		
		SqlSession session = getSqlSession();
		
		InquiryDTO inquiryDetail = new InquiryDAO().selectInquiryDetailWithoutFile(session, no);
		
		session.close();
		
		return inquiryDetail;
	}

	public int insertInquiry(InquiryDTO newInquiry) {
		
		/* Connection 생성 */
		SqlSession session = getSqlSession();
		
		/* 최종적으로 반환할 result 선언 */
		int result = 0;
		
		/* 1. QUESTION 테이블에 newInquiry 내용 insert */
		int inquiryResult = new InquiryDAO().insertInquiryWithoutFile(session, newInquiry);
		System.out.println("inquiryResult : " + inquiryResult);
			
		/* InquiryFile 리스트를 불러오기 */
		List<InquiryFileDTO> fileList = newInquiry.getInquiryFileList();
		
		/* fileList에 inquiryCode( =newInquiry.getInquiryCode() )값을 넣기 */
		for(int i = 0; i < fileList.size(); i++) {
//			System.out.println("newInquiry.getInquiryCode() : " + newInquiry.getInquiryCode());
			fileList.get(i).setInquiryCode(newInquiry.getInquiryCode());
		}
		
		/* QUESTION_PHOTO 테이블에 list의 size만큼 insert */
		int inquiryFileResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			inquiryFileResult += new InquiryDAO().insertInquiryFile(session, fileList.get(i));
		}
		
		/* 모든 결과가 성공이면 트랜젝션을 완료한다. */
		if(inquiryResult > 0 && inquiryFileResult == fileList.size()) {
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

	public int deleteInquiry(int inquiryCode) {
		SqlSession session = getSqlSession();
		
		int result = new InquiryDAO().deleteInquiry(session, inquiryCode);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}

	public int updateInquiry(InquiryDTO updateInquiryDTO) {
		SqlSession session = getSqlSession();
		
		int updateResult = new InquiryDAO().updateInquiry(session, updateInquiryDTO);
		
		if (updateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
				
		return updateResult;
	}

	public int deleteInquiryFile(int inquiryCode) {
		SqlSession session = getSqlSession();
		
		int deleteResult = new InquiryDAO().deleteInquiryFile(session, inquiryCode);
		
		if (deleteResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return deleteResult;
	}

	public int insertInquiryFile(InquiryFileDTO inquiryFileDTO) {
		SqlSession session = getSqlSession();
		
		int result = new InquiryDAO().insertInquiryFile(session, inquiryFileDTO);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}
	
	
	public int selectQuestionTotalCount(Map<String, String> searchMap) {
	 
		SqlSession session = getSqlSession();
		
		int totalCount = new InquiryDAO().selectQuestionTotalCount(session,searchMap);
		  
		session.close();
		  
		return totalCount; 
	}
	  
	public List<InquiryDTO> selectQuestionList(SelectCriteria selectCriteria) {
		
		SqlSession session = getSqlSession();
		
		List<InquiryDTO> questionList = new InquiryDAO().selectQuestionList(session, selectCriteria);
		
		session.close();
		
		return questionList;
		
	}
	 

}
