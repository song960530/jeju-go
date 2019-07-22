package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import logic.JejuService;
import logic.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

	@PostMapping("delete")
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

}
