package com.ahohotel.mypage.inquiry.model.dto;

import com.ahohotel.common.paging.SelectCriteria;

public class SelectCriteriaWithUserCode implements java.io.Serializable {
	
	private SelectCriteria selectCriteria;
	private int userCode;
	
	public SelectCriteriaWithUserCode() {
	}
	public SelectCriteriaWithUserCode(SelectCriteria selectCriteria, int userCode) {
		this.selectCriteria = selectCriteria;
		this.userCode = userCode;
	}

	public SelectCriteria getSelectCriteria() {
		return selectCriteria;
	}
	public void setSelectCriteria(SelectCriteria selectCriteria) {
		this.selectCriteria = selectCriteria;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "SelectCriteriaWithUserCode [selectCriteria=" + selectCriteria + ", userCode=" + userCode + "]";
	}
}