package com.ahohotel.user.model.dto;

import java.sql.Date;
import java.util.List;

public class ReserveAndReportDTO {
	
	private int reserveCode;
	private int userCode;
	private int roomCode;
	private Date paymentDate;
	private int usePoint;
	private int price;
	private Date startDate;
	private Date endDate;
	private String review;
	private int score;
	private Date reviewDate;
	private List<ReportDTO> report;
	private int reportCount;
	private String latelyReportReason;
	
	public ReserveAndReportDTO() {
	}

	public ReserveAndReportDTO(int reserveCode, int userCode, int roomCode, Date paymentDate, int usePoint, int price,
			Date startDate, Date endDate, String review, int score, Date reviewDate, List<ReportDTO> report,
			int reportCount, String latelyReportReason) {
		this.reserveCode = reserveCode;
		this.userCode = userCode;
		this.roomCode = roomCode;
		this.paymentDate = paymentDate;
		this.usePoint = usePoint;
		this.price = price;
		this.startDate = startDate;
		this.endDate = endDate;
		this.review = review;
		this.score = score;
		this.reviewDate = reviewDate;
		this.report = report;
		this.reportCount = reportCount;
		this.latelyReportReason = latelyReportReason;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public List<ReportDTO> getReport() {
		return report;
	}

	public void setReport(List<ReportDTO> report) {
		this.report = report;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getLatelyReportReason() {
		return latelyReportReason;
	}

	public void setLatelyReportReason(String latelyReportReason) {
		this.latelyReportReason = latelyReportReason;
	}

	@Override
	public String toString() {
		return "ReserveAndReportDTO [reserveCode=" + reserveCode + ", userCode=" + userCode + ", roomCode=" + roomCode
				+ ", paymentDate=" + paymentDate + ", usePoint=" + usePoint + ", price=" + price + ", startDate="
				+ startDate + ", endDate=" + endDate + ", review=" + review + ", score=" + score + ", reviewDate="
				+ reviewDate + ", report=" + report + ", reportCount=" + reportCount + ", latelyReportReason="
				+ latelyReportReason + "]";
	}

	
	

	
	

}
