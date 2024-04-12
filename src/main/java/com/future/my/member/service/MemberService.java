package com.future.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.future.my.member.dao.IMemberDAO;
import com.future.my.member.vo.UserVO;

@Service
public class MemberService {
	// Autowired 이노테이션은 자동 의존성 주입을 위해 사용
	// 클래스 필드, 생성자, 메소드에 이노테이션을 표시함으로써 스프링에게
	// 해당 타입을 자동으로 주입하도록 지시
	@Autowired
	IMemberDAO dao; // new를 하지 않아도 사용 가능
	
	// 회원가입
	public void registMember(UserVO vo) throws Exception {
		int result = dao.registUser(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 로그인
	public UserVO loginMember(UserVO vo) {
		return dao.loginUser(vo);
	}
	// 업데이트
	public void updateMember(UserVO vo) throws Exception {
	    int result = dao.updateMember(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 회원 프로필이미지 저장 및 DB경로 저장
	public String uploadProfile(UserVO vo, String uploadDir, String webPath
								, MultipartFile file) throws Exception {
		String originFileName = file.getOriginalFilename();
		// 서버에 저장되는 파일명(중복을 방지하기 위해 유니크한 이름생성)
		String storedFileName = UUID.randomUUID().toString() + "_" + originFileName;
		// db저장 경로(마이페이지에서 사용할 경로)
		String dbFilePath = webPath + storedFileName;
		Path filePath = Paths.get(uploadDir, storedFileName);
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("file to save the file", e);
		}
		vo.setUserImage(dbFilePath);
		int result = dao.profileUpload(vo);
		if(result == 0) {
			throw new Exception();
		}
		return dbFilePath;
	}

	
}
