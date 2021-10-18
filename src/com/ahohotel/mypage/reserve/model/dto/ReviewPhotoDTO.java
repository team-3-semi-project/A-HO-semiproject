package com.ahohotel.mypage.reserve.model.dto;

import java.io.Serializable;

public class ReviewPhotoDTO implements Serializable {

	private static final long serialVersionUID = 285920243783705153L;

	private int reservePCode;
	private int reserveCode;
	private String originalFile;
	private String fileName;
	private String filePath;

	public ReviewPhotoDTO() {
	}

	public ReviewPhotoDTO(int reservePCode, int reserveCode, String originalFile, String fileName, String filePath) {
		this.reservePCode = reservePCode;
		this.reserveCode = reserveCode;
		this.originalFile = originalFile;
		this.fileName = fileName;
		this.filePath = filePath;
	}

	public int getReservePCode() {
		return reservePCode;
	}

	public void setReservePCode(int reservePCode) {
		this.reservePCode = reservePCode;
	}

	public int getReservecode() {
		return reserveCode;
	}

	public void setReservecode(int reservecode) {
		this.reserveCode = reservecode;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ReviewPhotoDTO [reservePCode=" + reservePCode + ", reservecode=" + reserveCode + ", originalFile="
				+ originalFile + ", fileName=" + fileName + ", filePath=" + filePath + "]";
	}

}
