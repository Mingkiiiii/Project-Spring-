package com.future.my.cooktip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.cooktip.dao.CooktipDAO;
import com.future.my.cooktip.vo.CooktipVO;

@Service
public class CooktipService {
	@Autowired
	CooktipDAO dao;

	// 게시글 조회
	public List<CooktipVO> getCooktipList() {
		List<CooktipVO> result = dao.getcooktipList();
		return result;
	}

	//게시글 등록
	public void writeCooktip(CooktipVO vo) throws Exception {
		int result = dao.writeCooktip(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	public CooktipVO getCooktip(int cooktipNo) throws Exception {
		CooktipVO result = dao.getCooktip(cooktipNo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	
	// 게시글 수정
	public void updateCooktip(CooktipVO vo) throws Exception {
		int result = dao.updateCooktip(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	// 게시글 삭제
	public void deleteCooktip(int cooktipNo) throws Exception {
		int result = dao.deleteCooktip(cooktipNo);
		if(result == 0) {
			throw new Exception();
		}
	}

		
}
