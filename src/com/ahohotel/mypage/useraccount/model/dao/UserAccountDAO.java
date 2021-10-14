package com.ahohotel.mypage.useraccount.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.user.model.dto.AhoUserDTO;

public class UserAccountDAO {

	public int deleteUserAccount(SqlSession session, int userCode) {
		
		return session.update("UserAccountDAO.deleteUserAccount", userCode);
		
	}

	public int updateUserAccount(SqlSession session, AhoUserDTO updateUserDTO) {

		return session.update("UserAccountDAO.updateUserAccount", updateUserDTO);
	}

	public AhoUserDTO selectUserAccount(SqlSession session, int userCode) {

		return session.selectOne("UserAccountDAO.selectUserAccount", userCode);
	}

}
