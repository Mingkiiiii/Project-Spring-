package com.future.my;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.future.my.member.vo.UserVO;
import com.future.my.recipe.service.RecipeService;
import com.future.my.recipe.vo.ScrapVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	RecipeService recipeService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
	    logger.info("어서 오세요! 클라이언트 로캘은 {}입니다.", locale);
	    
	    Date date = new Date();
	    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	    
	    String formattedDate = dateFormat.format(date);
	    
	    // 세션에 사용자 객체가 저장되어 있다고 가정합니다.
	    // 사용자 정보가 어떻게 저장되는지에 따라 이 부분을 조정해야 합니다.
	    UserVO user = (UserVO) session.getAttribute("login");
	    if (user != null) {
	        List<ScrapVO> scrapList = recipeService.getScrapList(user.getUserId());
	        model.addAttribute("scrapList", scrapList);
	    }
	    
	    model.addAttribute("serverTime", formattedDate);
	    
	    return "home";
	}

	
	
}
