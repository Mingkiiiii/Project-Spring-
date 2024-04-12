package com.future.my.recipe.vo;

public class CommentVO {
	private String commentNo;
	private Integer recipeNo;
	private String userId;
	private String userName;
	private String commentText;
	private String commentDate;
	private String userImage;
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public Integer getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
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
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", recipeNo=" + recipeNo + ", userId=" + userId + ", userName="
				+ userName + ", commentText=" + commentText + ", commentDate=" + commentDate + ", userImage="
				+ userImage + "]";
	}
	
	
	
}
