package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import logic.JejuService;
import logic.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private JejuService service;

	@RequestMapping("*")
	public ModelAndView all() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping("main")
	public ModelAndView Home() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping({ "list", "deletelist" })
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<User> list = service.userList(request);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("delete")
	public ModelAndView delete(String[] idchks) {
		ModelAndView mav = new ModelAndView();
		for (String id : idchks) {
			service.Delete(id);
		}
		mav.addObject("msg", "Å»Åð ½ÂÀÎ µÇ¾ú½À´Ï´Ù.");
		mav.addObject("url", "deletelist.jeju");
		mav.setViewName("alert");
		return mav;
	}
	
	@RequestMapping("admindelete")
	public ModelAndView admindelete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
	      User dbUser = (User)session.getAttribute("login");
		  String password = service.MessageDigest(user.getPassword());
	      if(!dbUser.getPassword().equals(password)) {
	         throw new LogInException("ºñ¹Ð¹øÈ£°¡ Æ²¸³´Ï´Ù.","list.jeju");
	      }
	      try {
	         service.admindelete(user);
	         if (dbUser.getUserid().equals("admin")) {
//	            mav.setViewName("redirect:../admin/list.jeju");
	        	mav.addObject("msg", "Å»Åð Ã³¸® µÇ¾ú½À´Ï´Ù.");
	     		mav.addObject("url", "list.jeju");
	     		mav.setViewName("alert");
	         } 
	      } catch(Exception e) {
	         e.printStackTrace();
	         throw new LogInException("Å»Åð½ÇÆÐ", "list.jeju");
	      }
	      return mav;
	}
}
