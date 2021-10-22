package com.ahohotel.mypage.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
import com.ahohotel.mypage.inquiry.model.dto.InquiryFileDTO;
import com.ahohotel.mypage.inquiry.model.dto.SelectCriteriaWithUserCode;

public class InquiryDAO {

	public int selectInquiryTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("InquiryDAO.selectInquiryTotalCount", searchMap);
	}

	public List<InquiryDTO> selectInquiryList(SqlSession session, SelectCriteriaWithUserCode selectCriteriaWithUserCode) {
		
		return session.selectList("InquiryDAO.selectInquiryList", selectCriteriaWithUserCode);
	}

	public InquiryDTO selectInquiryDetail(SqlSession session, int no) {
		
		return session.selectOne("InquiryDAO.selectInquiryDetail", no);	
	}
	
	public InquiryDTO selectInquiryDetailWithoutFile(SqlSession session, int no) {
		
		return session.selectOne("InquiryDAO.selectInquiryDetailWithoutFile", no);
	}

	public int insertInquiryWithoutFile(SqlSession session, InquiryDTO newInquiry) {

		return session.insert("InquiryDAO.insertInquiryWithoutFile", newInquiry);
	}

	public int insertInquiryFile(SqlSession session, InquiryFileDTO file) {
		
		return session.insert("InquiryDAO.insertInquiryFile", file);
	}

	public int deleteInquiry(SqlSession session, int inquiryCode) {
		
		return session.delete("InquiryDAO.deleteInquiry", inquiryCode);
	}

	public int updateInquiry(SqlSession session, InquiryDTO updateInquiryDTO) {
		
		return session.update("InquiryDAO.updateInquiry", updateInquiryDTO);
	}

	public int deleteInquiryFile(SqlSession session, int inquiryCode) {

		return session.delete("InquiryDAO.deleteInquiryFile", inquiryCode);
	}
	
	public int selectQuestionTotalCount(SqlSession session, Map<String, String> searchMap) {
	 
		return session.selectOne("InquiryDAO.selectQuestionTotalCount", searchMap); 
	}
	
	public List<InquiryDTO> selectQuestionList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("InquiryDAO.selectQuestionList", selectCriteria);
	}
	 
}
