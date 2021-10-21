package com.ahohotel.book.model.dto;

import java.io.Serializable;

public class AhoUserAndVipDTO implements Serializable {

	private int userCode;
	private int vipCode;
	private String userName;
	private String userPhone;
	private int point;
	private String grade;
	private int vipSale;
	private int gradestandard;
	
	public AhoUserAndVipDTO() {
	}
	public AhoUserAndVipDTO(int userCode, int vipCode, String userName, String userPhone, int point, String grade,
			int vipSale, int gradestandard) {
		this.userCode = userCode;
		this.vipCode = vipCode;
		this.userName = userName;
		this.userPhone = userPhone;
		this.point = point;
		this.grade = grade;
		this.vipSale = vipSale;
		this.gradestandard = gradestandard;
	}
	
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getVipCode() {
		return vipCode;
	}
	public void setVipCode(int vipCode) {
		this.vipCode = vipCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getVipSale() {
		return vipSale;
	}
	public void setVipSale(int vipSale) {
		this.vipSale = vipSale;
	}
	public int getGradestandard() {
		return gradestandard;
	}
	public void setGradestandard(int gradestandard) {
		this.gradestandard = gradestandard;
	}
	
	@Override
	public String toString() {
		return "AhoUserAndVipDTO [userCode=" + userCode + ", vipCode=" + vipCode + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", point=" + point + ", grade=" + grade + ", vipSale=" + vipSale
				+ ", gradestandard=" + gradestandard + "]";
	}
}
