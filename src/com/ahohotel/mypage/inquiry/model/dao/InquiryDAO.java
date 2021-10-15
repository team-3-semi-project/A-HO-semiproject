package com.ahohotel.mypage.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
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


}
