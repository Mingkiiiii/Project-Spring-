package com.future.my.cooktip.vo;

public class CooktipVO {
	private Integer cooktipNo;
	private String cooktipTitle;
	private String cooktipContent;
	private String userId;
	private String userName;
	private String cooktipDate;
	public Integer getCooktipNo() {
		return cooktipNo;
	}
	public void setCooktipNo(Integer cooktipNo) {
		this.cooktipNo = cooktipNo;
	}
	public String getCooktipTitle() {
		return cooktipTitle;
	}
	public void setCooktipTitle(String cooktipTitle) {
		this.cooktipTitle = cooktipTitle;
	}
	public String getCooktipContent() {
		return cooktipContent;
	}
	public void setCooktipContent(String cooktipContent) {
		this.cooktipContent = cooktipContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCooktipDate() {
		return cooktipDate;
	}
	public void setCooktipDate(String cooktipDate) {
		this.cooktipDate = cooktipDate;
	}
	@Override
	public String toString() {
		return "CooktipVO [cooktipNo=" + cooktipNo + ", cooktipTitle=" + cooktipTitle + ", cooktipContent="
				+ cooktipContent + ", userId=" + userId + ", userName=" + userName + ", cooktipDate=" + cooktipDate
				+ "]";
	}
	
	
}
