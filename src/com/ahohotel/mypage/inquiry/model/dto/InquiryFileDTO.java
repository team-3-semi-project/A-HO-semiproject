package com.ahohotel.mypage.inquiry.model.dto;

import java.io.Serializable;

public class InquiryFileDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4811083771901101375L;
	
	private int qPhotoCode;
	private int inquiryCode;
	private String qOriginalFile;
	private String qFileName;
	private String qFile;
	
	public InquiryFileDTO() {
	}
	public InquiryFileDTO(int qPhotoCode, int inquiryCode, String qOriginalFile, String qFileName, String qFile) {
		this.qPhotoCode = qPhotoCode;
		this.inquiryCode = inquiryCode;
		this.qOriginalFile = qOriginalFile;
		this.qFileName = qFileName;
		this.qFile = qFile;
	}
	
	public int getqPhotoCode() {
		return qPhotoCode;
	}
	public void setqPhotoCode(int qPhotoCode) {
		this.qPhotoCode = qPhotoCode;
	}
	public int getInquiryCode() {
		return inquiryCode;
	}
	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}
	public String getqOriginalFile() {
		return qOriginalFile;
	}
	public void setqOriginalFile(String qOriginalFile) {
		this.qOriginalFile = qOriginalFile;
	}
	public String getqFileName() {
		return qFileName;
	}
	public void setqFileName(String qFileName) {
		this.qFileName = qFileName;
	}
	public String getqFile() {
		return qFile;
	}
	public void setqFile(String qFile) {
		this.qFile = qFile;
	}
	
	@Override
	public String toString() {
		return "InquiryFileDTO [qPhotoCode=" + qPhotoCode + ", inquiryCode=" + inquiryCode + ", qOriginalFile="
				+ qOriginalFile + ", qFileName=" + qFileName + ", qFile=" + qFile + "]";
	}
}
