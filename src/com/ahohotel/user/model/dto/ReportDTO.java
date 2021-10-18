package com.ahohotel.user.model.dto;

import java.util.List;

public class ReportDTO {
	
	private int reportCode;
	private int userCode;
	private int reserveCode;
	private String reportCheck;
	private String reportReason;

	public ReportDTO() {
	}

	public ReportDTO(int reportCode, int userCode, int reserveCode, String reportCheck, String reportReason) {
		this.reportCode = reportCode;
		this.userCode = userCode;
		this.reserveCode = reserveCode;
		this.reportCheck = reportCheck;
		this.reportReason = reportReason;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public String getReportCheck() {
		return reportCheck;
	}

	public void setReportCheck(String reportCheck) {
		this.reportCheck = reportCheck;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportCode=" + reportCode + ", userCode=" + userCode + ", reserveCode=" + reserveCode
				+ ", reportCheck=" + reportCheck + ", reportReason=" + reportReason + "]";
	}
	
	

	

	

}
