package com.ahohotel.mypage.reserve.model.dto;

import java.io.Serializable;

public class HotelPhotoDTO implements Serializable{

	private static final long serialVersionUID = -5594183886426522406L;

	private int photoCode;
	private int hotelCode;
	private String originFile;
	private String fileName;
	private String file;
	private String thumbnail;
	
	public HotelPhotoDTO() {
	}

	public HotelPhotoDTO(int photoCode, int hotelCode, String originFile, String fileName, String file,
			String thumbnail) {
		this.photoCode = photoCode;
		this.hotelCode = hotelCode;
		this.originFile = originFile;
		this.fileName = fileName;
		this.file = file;
		this.thumbnail = thumbnail;
	}

	public int getPhotoCode() {
		return photoCode;
	}

	public void setPhotoCode(int photoCode) {
		this.photoCode = photoCode;
	}

	public int getHotelCode() {
		return hotelCode;
	}

	public void setHotelCode(int hotelCode) {
		this.hotelCode = hotelCode;
	}

	public String getOriginFile() {
		return originFile;
	}

	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "HotelPhotoDTO [photoCode=" + photoCode + ", hotelCode=" + hotelCode + ", originFile=" + originFile
				+ ", fileName=" + fileName + ", file=" + file + ", thumbnail=" + thumbnail + "]";
	}
	
	
	
}
