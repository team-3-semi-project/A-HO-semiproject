package com.ahohotel.mypage.useraccount.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.user.model.dto.AhoUserDTO;

public class UserAccountDAO {

	/* 회원 탈퇴 */
	public int deleteUserAccount(SqlSession session, int userCode) {
		
		return session.update("UserAccountDAO.deleteUserAccount", userCode);
	}

	/* 회원 정보 수정 */
	public int updateUserAccount(SqlSession session, AhoUserDTO updateUserDTO) {

		return session.update("UserAccountDAO.updateUserAccount", updateUserDTO);
	}

	/* 회원 정보 조회 (mypage) */
	public AhoUserDTO selectUserAccount(SqlSession session, int userCode) {

		return session.selectOne("UserAccountDAO.selectUserAccount", userCode);
	}

}
