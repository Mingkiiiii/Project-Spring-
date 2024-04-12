package com.future.my.recipe.vo;

public class ScrapVO {
	private Integer recipeNo;
	private String recipeName;
	private String recipeYoutube;
	private String recipeText;
	private String recipeImage;
	private String userId;
	private String userName;
	private String writeDate;
	private Integer scarapId;
	private String scrapYn;
	private String scrapCount;
	
	public Integer getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getRecipeYoutube() {
		return recipeYoutube;
	}
	public void setRecipeYoutube(String recipeYoutube) {
		this.recipeYoutube = recipeYoutube;
	}
	public String getRecipeText() {
		return recipeText;
	}
	public void setRecipeText(String recipeText) {
		this.recipeText = recipeText;
	}
	public String getRecipeImage() {
		return recipeImage;
	}
	public void setRecipeImage(String recipeImage) {
		this.recipeImage = recipeImage;
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
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public Integer getScarapId() {
		return scarapId;
	}
	public void setScarapId(Integer scarapId) {
		this.scarapId = scarapId;
	}
	public String getScrapYn() {
		return scrapYn;
	}
	public void setScrapYn(String scrapYn) {
		this.scrapYn = scrapYn;
	}
	public String getScrapCount() {
		return scrapCount;
	}
	public void setScrapCount(String scrapCount) {
		this.scrapCount = scrapCount;
	}
	@Override
	public String toString() {
		return "ScrapVO [recipeNo=" + recipeNo + ", recipeName=" + recipeName + ", recipeYoutube=" + recipeYoutube
				+ ", recipeText=" + recipeText + ", recipeImage=" + recipeImage + ", userId=" + userId + ", userName="
				+ userName + ", writeDate=" + writeDate + ", scarapId=" + scarapId + ", scrapYn=" + scrapYn
				+ ", scrapCount=" + scrapCount + "]";
	}

	
	
	
}
