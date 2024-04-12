package com.future.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.member.vo.UserVO;



@Mapper
public interface IMemberDAO {
	
	// 회원가입
	public int registUser(UserVO vo);
	// 회원조회(로그인)
	public UserVO loginUser(UserVO vo);
	//업데이트
	public int updateMember(UserVO vo);
	// 프로필 이미지 경로 저장
	public int profileUpload(UserVO vo);
	
}
