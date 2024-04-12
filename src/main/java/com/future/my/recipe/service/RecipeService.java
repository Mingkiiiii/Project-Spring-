package com.future.my.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.recipe.dao.RecipeDAO;
import com.future.my.recipe.vo.CommentVO;
import com.future.my.recipe.vo.RecipeVO;
import com.future.my.recipe.vo.ScrapVO;

@Service
public class RecipeService {
    @Autowired
    RecipeDAO dao;
    
    public List<RecipeVO> getRecipeList() {
        return dao.getRecipeList();
    }
    
    public void insertRecipe(RecipeVO vo) throws Exception {
        int result = dao.insertRecipe(vo);
        if(result == 0) {
            throw new Exception();
        }
    }
    
    public RecipeVO getRecipe(int RecipeNo) throws Exception {
		RecipeVO result = dao.getRecipe(RecipeNo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
    
    // 게시글 수정
 	public void updateRecipe(RecipeVO vo) throws Exception {
 		int result = dao.updateRecipe(vo);
 		if(result == 0) {
 			throw new Exception();
 		}
 	}
 	// 게시글 삭제
 	public void deleteRecipe(int recipeNo) throws Exception {
 		int result = dao.deleteRecipe(recipeNo);
 		if(result == 0) {
 			throw new Exception();
 		}
 	}
 	
 // 댓글 등록
 	public void writeComment(CommentVO vo) throws Exception {
 	    int result = dao.writeComment(vo);
 	    if (result == 0) {
 	        throw new Exception();
 	    }
 	}

 		// 댓글 조회
 	public CommentVO getComment(String commentNo) throws Exception {
 		CommentVO result = dao.getComment(commentNo);
 		if(result == null) throw new Exception();
 		return result;
 	}
 	// 댓글 리스트 조회
 	public List<CommentVO> getCommentList(int commentNo) throws Exception{
 		List<CommentVO> result = dao.getCommentList(commentNo);
 		if(result == null) throw new Exception();
 		return result;
 	}
 // 댓글 삭제
   	public void deleteComment(CommentVO vo) throws Exception {
   		int result = dao.deleteComment(vo);
   		if(result == 0) {
   			throw new Exception();
   		}
   	}	
   	public List<ScrapVO> getScrapList(String userId) {
        return dao.getScrapList(userId);
    }
   	public void insertScrap(ScrapVO scrapVO) throws Exception {
        dao.insertScrap(scrapVO);
    }
 // 스크랩 취소
//   	public void delScrap(int recipeNo, String userId) throws Exception {
//   	    int result = dao.delScrap(recipeNo, userId);
//   	    if(result == 0) {
//   	        throw new Exception("스크랩 취소에 실패했습니다.");
//   	    }

  
 // 스크랩취소
  	public void delScrap(ScrapVO recipeNo) throws Exception {
  		int result = dao.delScrap(recipeNo);
  		if(result == 0) {
  			throw new Exception();
  		}
  	}
}

