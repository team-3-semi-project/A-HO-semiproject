package com.ahohotel.user.model.dto;

public class ReportListDTO {
	
	private int reportCode;
	private int reserveCode;
	private String reviewerId;
	private String repoterId;
	private String review;
	private String reportReason;
	private String reportCheck;
	
	public ReportListDTO() {
	}

	public ReportListDTO(int reportCode, int reserveCode, String reviewerId, String repoterId, String review,
			String reportReason, String reportCheck) {
		this.reportCode = reportCode;
		this.reserveCode = reserveCode;
		this.reviewerId = reviewerId;
		this.repoterId = repoterId;
		this.review = review;
		this.reportReason = reportReason;
		this.reportCheck = reportCheck;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public String getReviewerId() {
		return reviewerId;
	}

	public void setReviewerId(String reviewerId) {
		this.reviewerId = reviewerId;
	}

	public String getRepoterId() {
		return repoterId;
	}

	public void setRepoterId(String repoterId) {
		this.repoterId = repoterId;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getReportCheck() {
		return reportCheck;
	}

	public void setReportCheck(String reportCheck) {
		this.reportCheck = reportCheck;
	}

	@Override
	public String toString() {
		return "ReportListDTO [reportCode=" + reportCode + ", reserveCode=" + reserveCode + ", reviewerId=" + reviewerId
				+ ", repoterId=" + repoterId + ", review=" + review + ", reportReason=" + reportReason
				+ ", reportCheck=" + reportCheck + "]";
	}
	
	
	
	

}
