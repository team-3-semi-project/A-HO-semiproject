package com.ahohotel.mypage.inquiry.model.Service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.inquiry.model.dao.InquiryDAO;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
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



}
