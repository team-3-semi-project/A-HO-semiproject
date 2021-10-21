package com.ahohotel.book.model.dto;

import java.io.Serializable;

public class PetDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6900199583772584745L;
	
	private int petCode;
	private int bookCode;
	private String petKinds;
	private String petSize;
	private String petIssue;
	
	public PetDTO() {
	}
	public PetDTO(int petCode, int bookCode, String petKinds, String petSize, String petIssue) {
		this.petCode = petCode;
		this.bookCode = bookCode;
		this.petKinds = petKinds;
		this.petSize = petSize;
		this.petIssue = petIssue;
	}
	
	public int getPetCode() {
		return petCode;
	}
	public void setPetCode(int petCode) {
		this.petCode = petCode;
	}
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
	public String getPetKinds() {
		return petKinds;
	}
	public void setPetKinds(String petKinds) {
		this.petKinds = petKinds;
	}
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	public String getPetIssue() {
		return petIssue;
	}
	public void setPetIssue(String petIssue) {
		this.petIssue = petIssue;
	}
	
	@Override
	public String toString() {
		return "PetDTO [petCode=" + petCode + ", bookCode=" + bookCode + ", petKinds=" + petKinds + ", petSize="
				+ petSize + ", petIssue=" + petIssue + "]";
	}
}
