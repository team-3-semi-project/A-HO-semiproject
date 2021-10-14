package com.ahohotel.website.oftenQuestion.model.service;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.website.oftenQuestion.model.dao.OftenQuestionDAO;
import com.ahohotel.website.oftenQuestion.model.dto.OftenQuestionDTO;

public class OftenQuestionService {

	private final OftenQuestionDAO oqDAO;
	
	public OftenQuestionService(){
		oqDAO = new OftenQuestionDAO();
	}

	public List<OftenQuestionDTO> selectAllOq() {
		
		SqlSession session = getSqlSession();
		
		List<OftenQuestionDTO> oqList = oqDAO.selectAllOQ(session);
		
		session.close();
		
		return oqList;
	}
}
