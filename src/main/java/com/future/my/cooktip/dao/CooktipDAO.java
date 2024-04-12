package com.future.my.cooktip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.cooktip.vo.CooktipVO;


@Mapper
public interface CooktipDAO {
	// 게시글 조회
	public List<CooktipVO> getcooktipList();
	// 게시글 등록
	public int writeCooktip (CooktipVO vo);
	// 게시글 상세조회
	public CooktipVO getCooktip(int cooktipNo);
	// 게시글 수정
	public int updateCooktip(CooktipVO vo);
	// 게시글 삭제
	public int deleteCooktip(int cooktipNo);
}
