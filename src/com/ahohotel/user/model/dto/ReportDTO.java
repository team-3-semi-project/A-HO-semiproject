package com.ahohotel.user.model.dto;

public class ReportDTO {
	
	private int reportCode;
	private int userCode;
	private int reserveCode;
	private String reserveReason;
	
	public ReportDTO() {
	}

	public ReportDTO(int reportCode, int userCode, int reserveCode, String reserveReason) {
		this.reportCode = reportCode;
		this.userCode = userCode;
		this.reserveCode = reserveCode;
		this.reserveReason = reserveReason;
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

	public String getReserveReason() {
		return reserveReason;
	}

	public void setReserveReason(String reserveReason) {
		this.reserveReason = reserveReason;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportCode=" + reportCode + ", userCode=" + userCode + ", reserveCode=" + reserveCode
				+ ", reserveReason=" + reserveReason + "]";
	}
	
	
	
	

}
