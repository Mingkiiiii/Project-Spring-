package com.future.my.recipe.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping; // POST 메서드에 대한 처리를 위해 추가
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ModelAttribute; // 폼 데이터를 객체로 바인딩하기 위해 추가
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.future.my.member.vo.UserVO;
import com.future.my.recipe.service.RecipeService;
import com.future.my.recipe.vo.CommentVO;
import com.future.my.recipe.vo.RecipeVO;
import com.future.my.recipe.vo.ScrapVO;

@Controller
public class RecipeController {
    @Autowired
    RecipeService recipeService;
    @RequestMapping("/chat")
    public String chat(HttpSession session, Model model, RedirectAttributes re) {
    	if(session.getAttribute("login") == null) {
    		re.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/loginView";
		}
		
    	return "chat/chatView";
	}
    @RequestMapping("/chats")
    public String chats() {
    	
		
    	return "chat/test";
	}
    	
  
    @RequestMapping("/recipeView")
    public String recipeView(Model model, HttpSession session) {
        List<RecipeVO> recipeList = recipeService.getRecipeList();
        model.addAttribute("recipeList", recipeList);
        return "recipe/recipeView";
    }
    
    @RequestMapping("/recipeWrite")
    public String recipeWrite() {
        return "recipe/recipeWrite";
    }
    
    @PostMapping("/recipeWriteDo")
    public String recipeWriteDo(@ModelAttribute RecipeVO recipeVO, 
                                @RequestParam("file") MultipartFile file, 
                                HttpSession session) throws IOException {
        // 웹 접근 가능한 경로 설정
        String webPath = "/resources/recipe/";
        // 서버 저장 폴더 경로
        String folderPath = session.getServletContext().getRealPath(webPath);

        // 파일이 업로드될 실제 경로
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
        }

        // 파일 이름 설정
        String fileName = file.getOriginalFilename();
        String filePath = folderPath + File.separator + fileName;

        // 파일 업로드
        try {
            file.transferTo(new File(filePath));
            // 파일 경로를 RecipeVO에 저장
            recipeVO.setRecipeImage(webPath + fileName);

            // 세션에서 로그인 사용자 정보 가져오기
            UserVO loginUser = (UserVO) session.getAttribute("login");
            // 로그인 사용자의 ID를 RecipeVO에 설정
            if (loginUser != null) {
                recipeVO.setUserId(loginUser.getUserId());
            } else {
                // 세션이 없거나 로그인 정보가 없는 경우 처리할 내용을 여기에 추가하십시오.
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 실패 시 예외 처리 필요
            return "errorPage";
        }

        try {
            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
            recipeService.insertRecipe(recipeVO);
            return "redirect:/recipeView";
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 필요
            return "errorPage";
        }
    }
    @RequestMapping("/recipeDetail")
	public String recipeDetail(int recipeNo, Model model) throws Exception {
		System.out.println(recipeNo);
		RecipeVO vo = recipeService.getRecipe(recipeNo);
		List<CommentVO> commentList = recipeService.getCommentList(recipeNo); //댓글
		model.addAttribute("recipe", vo);
		model.addAttribute("commentList", commentList); //댓글
		
		return "recipe/recipeDetail";
	}
    // 게시글 수정 뷰이동
    @RequestMapping(value="/recipeEdit", method=RequestMethod.POST)
	public String recipeEdit(int recipeNo, Model model) throws Exception {
		System.out.println(recipeNo);
		RecipeVO vo = recipeService.getRecipe(recipeNo);
		model.addAttribute("recipe", vo);
		
		return "recipe/recipeEdit";
	}
 // 게시글 수정
    @PostMapping("/recipeEditDo")
    public String recipeEdit(@ModelAttribute RecipeVO recipeVO, 
                             @RequestParam("file") MultipartFile file, 
                             HttpSession session) throws IOException {
        // 웹 접근 가능한 경로 설정
        String webPath = "/resources/recipe/";
        // 서버 저장 폴더 경로
        String folderPath = session.getServletContext().getRealPath(webPath);

        // 파일이 업로드될 실제 경로
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
        }

        // 파일 이름 설정
        String fileName = file.getOriginalFilename();
        String filePath = folderPath + File.separator + fileName;

        // 파일 업로드
        try {
            file.transferTo(new File(filePath));
            // 파일 경로를 RecipeVO에 저장
            recipeVO.setRecipeImage(webPath + fileName);

            // 세션에서 로그인 사용자 정보 가져오기
            UserVO loginUser = (UserVO) session.getAttribute("login");
            // 로그인 사용자의 ID를 RecipeVO에 설정
            if (loginUser != null) {
                recipeVO.setUserId(loginUser.getUserId());
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 실패 시 예외 처리 필요
            return "errorPage";
        }

        try {
            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
            recipeService.updateRecipe(recipeVO);
            return "redirect:/recipeView";
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 필요
            return "errorPage";
        }
    }

	//게시글 삭제
	@RequestMapping(value="/recipeDel", method=RequestMethod.POST)
	public String recipeDel(int recipeNo) throws Exception {
		recipeService.deleteRecipe(recipeNo);
		return "redirect:/recipeView";
	}
	
	// 댓글등록
		
		@ResponseBody
		@PostMapping("/writeCommentDo")	
		public CommentVO writeCommentDo(@RequestBody CommentVO vo) throws Exception {
			System.out.println(vo);
			Date date = new Date();
			SimpleDateFormat sdfDateFormat = new SimpleDateFormat("yyMMddHHmmssSSS");
			String uniqu = sdfDateFormat.format(date);
			vo.setCommentNo(uniqu);
			recipeService.writeComment(vo);
			CommentVO result = recipeService.getComment(uniqu);
			return result;
		}
	
		@ResponseBody
		@RequestMapping(value="/commentDel", method=RequestMethod.POST)
		public Map<String, Object> CommentDel(@RequestBody CommentVO vo) throws Exception {
			System.out.println(vo);
			recipeService.deleteComment(vo);
		    Map<String, Object> map = new HashMap();
		    map.put("msg","s");
		    
		    return map;
		}
		
		@RequestMapping("/recipeScrap")
		public String recipeScrap(Model model, HttpSession session, RedirectAttributes re) {
		    UserVO user = (UserVO) session.getAttribute("login");
		    if (user == null) {
		        re.addFlashAttribute("msg", "로그인이 필요합니다.");
		        return "redirect:/loginView";    
		    }
		    List<ScrapVO> scrapList = recipeService.getScrapList(user.getUserId());
		    model.addAttribute("scrapList", scrapList);
		    
		    // home.jsp로도 스크랩 목록을 전달
		    model.addAttribute("scrapList", scrapList);
		    
		    return "recipe/recipeScrap";
		}

		
		@RequestMapping(value="/insertScrap")
		public String insertScrap(ScrapVO vo, Model model, HttpSession session) throws Exception {
		    // 세션에서 사용자 정보를 가져옴
		    UserVO user = (UserVO) session.getAttribute("login");
		    
		    // 사용자 정보에서 userId를 ScrapVO에 설정
		    vo.setUserId(user.getUserId());
		    
		    // 스크랩한 레시피 추가
		    recipeService.insertScrap(vo);
		    
		    // 메인 페이지로 리다이렉트
		    return "redirect:/recipeScrap";
		}
		
//		//게시글 삭제
//		@PostMapping("/delScrap")
//		public String delScrap(@RequestParam("recipeNo") int recipeNo,
//		                       @RequestParam("userId") String userId) throws Exception {
//		    recipeService.delScrap(recipeNo, userId);
//		    return "redirect:/recipeScrap";
//		}

		//스크랩 취소
		@RequestMapping(value="/scrapDel", method=RequestMethod.POST)
		public String scrapDel(ScrapVO recipeNo) throws Exception {
			recipeService.delScrap(recipeNo);
			return "redirect:/recipeScrap";
		}



}
