package com.future.my.recipe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.future.my.recipe.vo.CommentVO;
import com.future.my.recipe.vo.RecipeVO;
import com.future.my.recipe.vo.ScrapVO;

@Mapper
public interface RecipeDAO {
		// 게시글 조회
		public List<RecipeVO> getRecipeList();
		
		// 게시글 리스트
		public List<RecipeVO> getRecipeList(RecipeVO recipeVO);

		public int insertRecipe(RecipeVO vo);
		// 게시글 조회
		public RecipeVO getRecipe(int RecipeNo);
		// 게시글 수정
		public int updateRecipe(RecipeVO vo);
		// 게시글 삭제
		public int deleteRecipe(int recipeNo);
		// 댓글 등록
		public int writeComment(CommentVO vo);
		// 댓글 조회
		public CommentVO getComment(String commentNo);
		// 댓글 리스트 조회
		public List<CommentVO> getCommentList(int commentNo);
		// 댓글 삭제
		public int deleteComment(CommentVO commentNo);
		
//		// 게시글 조회
//		public List<ScrapVO> getScrapList();
				
		// 스크랩 리스트
		public List<ScrapVO> getScrapList(String userId);
		// 스크랩
	    public void insertScrap(ScrapVO scrapVO) throws Exception;
	 // 스크랩 취소
		public int delScrap(ScrapVO recipeNo);
	 // 스크랩 취소
//	    public int delScrap(@Param("recipeNo") int recipeNo, @Param("userId") String userId);



}
