package com.ahohotel.mypage.inquiry.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class InquiryDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1802443305529879560L;
	
	private int inquiryCode;
	private int rowNum;
	private int userCode;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryAnswer;
	private Date inquiryDate;
	private String inquiryCategory;
	private List<InquiryFileDTO> inquiryFileList;
	
	public InquiryDTO() {
	}
	public InquiryDTO(int inquiryCode, int rowNum, int userCode, String inquiryTitle, String inquiryContent,
			String inquiryAnswer, Date inquiryDate, String inquiryCategory, List<InquiryFileDTO> inquiryFileList) {
		this.inquiryCode = inquiryCode;
		this.rowNum = rowNum;
		this.userCode = userCode;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryAnswer = inquiryAnswer;
		this.inquiryDate = inquiryDate;
		this.inquiryCategory = inquiryCategory;
		this.inquiryFileList = inquiryFileList;
	}
	
	public int getInquiryCode() {
		return inquiryCode;
	}
	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getInquiryAnswer() {
		return inquiryAnswer;
	}
	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}
	public Date getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public String getInquiryCategory() {
		return inquiryCategory;
	}
	public void setInquiryCategory(String inquiryCategory) {
		this.inquiryCategory = inquiryCategory;
	}
	public List<InquiryFileDTO> getInquiryFileList() {
		return inquiryFileList;
	}
	public void setInquiryFileList(List<InquiryFileDTO> inquiryFileList) {
		this.inquiryFileList = inquiryFileList;
	}
	
	@Override
	public String toString() {
		return "InquiryDTO [inquiryCode=" + inquiryCode + ", rowNum=" + rowNum + ", userCode=" + userCode
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent + ", inquiryAnswer="
				+ inquiryAnswer + ", inquiryDate=" + inquiryDate + ", inquiryCategory=" + inquiryCategory
				+ ", inquiryFileList=" + inquiryFileList + "]";
	}
}
