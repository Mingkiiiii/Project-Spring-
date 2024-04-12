package com.future.my.cooktip.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.future.my.cooktip.service.CooktipService;
import com.future.my.cooktip.vo.CooktipVO;
import com.future.my.member.vo.UserVO;

@Controller
public class CooktipController {
	
	@Autowired
	CooktipService cooktipService;
	
	@RequestMapping("/cooktipView")
	public String cooktipView(Model model, HttpSession session) {
		List<CooktipVO> cooktipList = cooktipService.getCooktipList();
		model.addAttribute("cooktipList", cooktipList);
		return "cooktip/cooktipView";
	}
	@RequestMapping("/cooktipWriteView")
	public String boardWriteView(HttpSession session) {
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "cooktip/cooktipWriteView";
	}
	@RequestMapping("/cooktipWriteDo")
	public String cooktipWriteDo(HttpSession session, CooktipVO cooktip) throws Exception {
		UserVO vo = (UserVO) session.getAttribute("login");
		cooktip.setUserId(vo.getUserId());
		cooktipService.writeCooktip(cooktip);
		return "redirect:/cooktipView";
	}
	@RequestMapping("/cooktipDetailView")
	public String cooktipDetailView(int cooktipNo, Model model) throws Exception {
		System.out.println(cooktipNo);
		CooktipVO vo = cooktipService.getCooktip(cooktipNo);
//		List<ReplyVO> replyList = boardService.getReplyList(boardNo); //댓글
		model.addAttribute("cooktip", vo);
//		model.addAttribute("replyList", replyList); //댓글
		
		return "cooktip/cooktipDetailView";
	}
	@RequestMapping(value="/cooktipEditView", method=RequestMethod.POST)
	public String cooktipEditView(int cooktipNo, Model model) throws Exception {
		System.out.println(cooktipNo);
		CooktipVO vo = cooktipService.getCooktip(cooktipNo);
		model.addAttribute("cooktip", vo);
		
		return "cooktip/cooktipEditView";
	}
	// 게시글 수정
	@RequestMapping(value="/cooktipEditDo")
	public String cooktipEditView(CooktipVO vo, Model model) throws Exception {
		cooktipService.updateCooktip(vo);
		return "redirect:/cooktipView";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/cooktipDel", method=RequestMethod.POST)
	public String cooktipDel(int cooktipNo) throws Exception {
		cooktipService.deleteCooktip(cooktipNo);
		return "redirect:/cooktipView";
	}
}
