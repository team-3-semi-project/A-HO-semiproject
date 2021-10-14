package com.ahohotel.website.oftenQuestion.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.website.oftenQuestion.model.dto.OftenQuestionDTO;

public class OftenQuestionDAO {

	public List<OftenQuestionDTO> selectAllOQ(SqlSession session) {

		return session.selectList("OQ.selectAllOQ");
	}

}
