package com.ahohotel.mypage.reserve.model.dto;

import java.io.Serializable;
import java.util.Date;

public class ReserveAndReviewDTO implements Serializable{

	private static final long serialVersionUID = -5301074341926655206L;
	
	private int reserveCode;
	private int userCode;
	private int roomCode;
	private java.util.Date paymentDate;
	private int usePoint;
	private int price;
	private java.util.Date startDate;
	private java.util.Date endDate;
	private String review;
	private int score;
	private java.util.Date reviewDate;
	private String option;
	private ReviewPhotoDTO photo;
	
	public ReserveAndReviewDTO() {
	}

	public ReserveAndReviewDTO(int reserveCode, int userCode, int roomCode, Date paymentDate, int usePoint, int price,
			Date startDate, Date endDate, String review, int score, Date reviewDate, String option,
			ReviewPhotoDTO photo) {
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
		this.option = option;
		this.photo = photo;
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

	public java.util.Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(java.util.Date paymentDate) {
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

	public java.util.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.util.Date endDate) {
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

	public java.util.Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(java.util.Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public ReviewPhotoDTO getPhoto() {
		return photo;
	}

	public void setPhoto(ReviewPhotoDTO photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "ReserveAndReviewDTO [reserveCode=" + reserveCode + ", userCode=" + userCode + ", roomCode=" + roomCode
				+ ", paymentDate=" + paymentDate + ", usePoint=" + usePoint + ", price=" + price + ", startDate="
				+ startDate + ", endDate=" + endDate + ", review=" + review + ", score=" + score + ", reviewDate="
				+ reviewDate + ", option=" + option + ", photo=" + photo + "]";
	}
	
	
}