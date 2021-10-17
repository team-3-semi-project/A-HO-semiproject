package com.ahohotel.user.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class AhoUserDTO implements Serializable {
	
	private static final long serialVersionUID = -8007965077447433943L;
	
	private int code;
	private int vipCode;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Date birth;
	private String gender;
	private int point;
	private Date joinDate;
	private Date outDate;
	private String outYN;
	private String blackListYN;
	private String blackListReason;
	private String grade;
	private List<ReserveAndReportDTO> reserve;
	private List<ReportDTO> report;
	
	public AhoUserDTO() {
	}

	public AhoUserDTO(int code, int vipCode, String id, String pw, String name, String email, String phone, Date birth,
			String gender, int point, Date joinDate, Date outDate, String outYN, String blackListYN,
			String blackListReason, String grade, List<ReserveAndReportDTO> reserve, List<ReportDTO> report) {
		this.code = code;
		this.vipCode = vipCode;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.point = point;
		this.joinDate = joinDate;
		this.outDate = outDate;
		this.outYN = outYN;
		this.blackListYN = blackListYN;
		this.blackListReason = blackListReason;
		this.grade = grade;
		this.reserve = reserve;
		this.report = report;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getVipCode() {
		return vipCode;
	}

	public void setVipCode(int vipCode) {
		this.vipCode = vipCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	public String getOutYN() {
		return outYN;
	}

	public void setOutYN(String outYN) {
		this.outYN = outYN;
	}

	public String getBlackListYN() {
		return blackListYN;
	}

	public void setBlackListYN(String blackListYN) {
		this.blackListYN = blackListYN;
	}

	public String getBlackListReason() {
		return blackListReason;
	}

	public void setBlackListReason(String blackListReason) {
		this.blackListReason = blackListReason;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public List<ReserveAndReportDTO> getReserve() {
		return reserve;
	}

	public void setReserve(List<ReserveAndReportDTO> reserve) {
		this.reserve = reserve;
	}

	public List<ReportDTO> getReport() {
		return report;
	}

	public void setReport(List<ReportDTO> report) {
		this.report = report;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AhoUserDTO [code=" + code + ", vipCode=" + vipCode + ", id=" + id + ", pw=" + pw + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", birth=" + birth + ", gender=" + gender + ", point="
				+ point + ", joinDate=" + joinDate + ", outDate=" + outDate + ", outYN=" + outYN + ", blackListYN="
				+ blackListYN + ", blackListReason=" + blackListReason + ", grade=" + grade + ", reserve=" + reserve
				+ ", report=" + report + "]";
	}
	
}