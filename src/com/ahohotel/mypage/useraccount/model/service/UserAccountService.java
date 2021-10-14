package com.ahohotel.mypage.useraccount.model.service;

import org.apache.ibatis.session.SqlSession;

import com.ahohotel.mypage.useraccount.model.dao.UserAccountDAO;
import com.ahohotel.user.model.dto.AhoUserDTO;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

public class UserAccountService {

	public int deleteUserAccount(int userCode) {

		SqlSession session = getSqlSession();
		
		int result = new UserAccountDAO().deleteUserAccount(session, userCode);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}

	public int updateUserAccount(AhoUserDTO updateUserDTO) {

		SqlSession session = getSqlSession();
		
		int result = new UserAccountDAO().updateUserAccount(session, updateUserDTO);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}

	public AhoUserDTO selectUserAccount(int userCode) {
		
		SqlSession session = getSqlSession();
		
		AhoUserDTO userDTO = new UserAccountDAO().selectUserAccount(session, userCode);
		
		session.close();
		
		return userDTO;
	}

}
