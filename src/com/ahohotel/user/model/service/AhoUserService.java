package com.ahohotel.user.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ahohotel.common.paging.SelectCriteria;
import com.ahohotel.user.model.dao.AhoUserDAO;
import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.dto.ReportDTO;
import com.ahohotel.user.model.dto.ReportListDTO;

import static com.ahohotel.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

public class AhoUserService {
	
	private final AhoUserDAO userDAO;
	
	public AhoUserService() {
		userDAO = new AhoUserDAO();
	}

	public AhoUserDTO login(AhoUserDTO userDto) {
		
		SqlSession session = getSqlSession();
		AhoUserDTO loginUser = null;
		
		String encPw = userDAO.selectEncryptedPw(session, userDto);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		/* matches 메소드를 통해 입력한 pw와 암호화된 pw와 일치하는지 확인 하고 일치하면 회원 정보를 조회하도록 */
		if(passwordEncoder.matches(userDto.getPw(), encPw)) {
			loginUser = userDAO.selectLoginUser(session, userDto);
		}
	
		session.close();
		
		return loginUser;
	}

	public boolean signUp(AhoUserDTO signupDTO) {
		SqlSession session = getSqlSession();
		boolean isTrue;
		
		int result = userDAO.insertNewUser(session, signupDTO);
		
		System.out.println(result);
		
		if(result > 0) {
			isTrue = true;
			session.commit();
		} else {
			isTrue = false;
			session.rollback();
		}
		
		session.close();
		
		return isTrue;
	}

	public String idCheck(String id) {
		SqlSession session = getSqlSession();
		String result = null;
		
		String checkid = userDAO.selectCheckId(session, id);
		
		if(checkid == null) {
			result = "사용 가능한 아이디입니다.";
		} else {
			result = "이미 사용중인 아이디입니다.";
		}
		
		return result;
	}

	public String findId(String mail) {
		SqlSession session = getSqlSession();
		
		String result = userDAO.findId(session, mail);
		
		return result;
	}

	public String findEmailById(String id) {
		SqlSession session = getSqlSession();
		
		String result = userDAO.findEmailById(session, id);
		
		return result;
	}

	public boolean resetPw(AhoUserDTO resetPw) {
		SqlSession session = getSqlSession();
		boolean isTrue;
		
		int result = userDAO.resetPw(session, resetPw);
		
		if(result > 0) {
			isTrue = true;
			session.commit();
		} else {
			isTrue = false;
			session.rollback();
		}
		
		session.close();
		
		return isTrue;
	}

	public int selectUserTotalCount(Map<String, String> searchMap) {
		SqlSession session = getSqlSession();
		
		int result = userDAO.selectUserTotalCount(session, searchMap);
		
		session.close();
		
		return result;
	}

	public List<AhoUserDTO> selectUserList(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		
		List<AhoUserDTO> userList = userDAO.selectUserList(session, selectCriteria);
		
		session.close();
		
		return userList;
	}

	public AhoUserDTO selectUserDetail(String code) {
		SqlSession session = getSqlSession();
		
		AhoUserDTO userDetail = userDAO.selectUserDetail(session, code);
		
		session.close();
		
		return userDetail;
	}

	public int selectReportTotalCount(Map<String, String> searchMap) {
		
		SqlSession session = getSqlSession();
		
		int result = userDAO.selectReportTotalCount(session, searchMap);
		
		session.close();
		
		return result;
	}

	public List<ReportListDTO> selectReporList(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		
		List<ReportListDTO> reportList = userDAO.selectReporList(session, selectCriteria);
		
		session.close();
		
		return reportList;
	}

	public boolean checkReport(String managerCheck, Map<String, String> reportMap) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = userDAO.checkReport(session, reportMap);
		
		if(result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return isSuccess;
	}

	public boolean updateBlackList(Map<String, String> blackListMap) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = userDAO.updateBlackList(session, blackListMap);
		
		if(result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return isSuccess;
	}

	public boolean blackListCancle(String blacklistcancle) {
		SqlSession session = getSqlSession();
		boolean isSuccess = false;
		
		int result = userDAO.blackListCancle(session, blacklistcancle);
		
		if(result > 0) {
			isSuccess = true;
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return isSuccess;
	}

}
