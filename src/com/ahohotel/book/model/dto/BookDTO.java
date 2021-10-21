package com.ahohotel.book.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class BookDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 370280888681822329L;
	
	private int bookCode;  //RESERVE_CODE
	private int userCode;
	private int roomCode;
	private String reserveName;
	private String reservePhone;
	private Date startDate;
	private Date endDate;
	private int personNum;
	private String roomOption;
	private Date paymentDate;
	private int usePoint;
	private int price;
	private String review;
	private int score;
	private Date reviewDate;
	
	public BookDTO() {
	}
	public BookDTO(int bookCode, int userCode, int roomCode, String reserveName, String reservePhone, Date startDate,
			Date endDate, int personNum, String roomOption, Date paymentDate, int usePoint, int price, String review,
			int score, Date reviewDate) {
		this.bookCode = bookCode;
		this.userCode = userCode;
		this.roomCode = roomCode;
		this.reserveName = reserveName;
		this.reservePhone = reservePhone;
		this.startDate = startDate;
		this.endDate = endDate;
		this.personNum = personNum;
		this.roomOption = roomOption;
		this.paymentDate = paymentDate;
		this.usePoint = usePoint;
		this.price = price;
		this.review = review;
		this.score = score;
		this.reviewDate = reviewDate;
	}
	
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
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
	public String getReserveName() {
		return reserveName;
	}
	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}
	public String getReservePhone() {
		return reservePhone;
	}
	public void setReservePhone(String reservePhone) {
		this.reservePhone = reservePhone;
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
	public int getPersonNum() {
		return personNum;
	}
	public void setPersonNum(int personNum) {
		this.personNum = personNum;
	}
	public String getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
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
	
	@Override
	public String toString() {
		return "BookDTO [bookCode=" + bookCode + ", userCode=" + userCode + ", roomCode=" + roomCode + ", reserveName="
				+ reserveName + ", reservePhone=" + reservePhone + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", personNum=" + personNum + ", roomOption=" + roomOption + ", paymentDate=" + paymentDate
				+ ", usePoint=" + usePoint + ", price=" + price + ", review=" + review + ", score=" + score
				+ ", reviewDate=" + reviewDate + "]";
	}
}
