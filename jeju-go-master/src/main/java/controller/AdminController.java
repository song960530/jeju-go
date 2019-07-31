package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import logic.Board;
import logic.Final;
import logic.JejuService;
import logic.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.JejuException;
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
	public ModelAndView adchecklist(Integer pageNum, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals(""))
			pageNum = 1;
		int limit = 10;
		List<User> list = service.userList(pageNum, limit, request);
		int count = service.usercount();
		int maxpage = (int) ((double) count / limit + 0.95);
		int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int endpage = startpage + 9;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		int userno = count - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("userno", userno);
		return mav;
	}

	@RequestMapping("delete")
	public ModelAndView adcheckdelete(String[] idchks, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			for (String id : idchks) {
				service.Delete(id);
			}
			mav.addObject("msg", "탈퇴 승인 되었습니다.");
			mav.addObject("url", "deletelist.jeju");
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new LogInException("탈퇴 승인에 실패하였습니다.", "deletelist.jeju");
		}
		return mav;
	}

	@RequestMapping("qnalist")
	public ModelAndView adcheckqnalist(Integer pageNum, Integer type2, String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;
		if (type2 == null || type2.toString().equals("")) {
			type2 = null;
		}
		int count = service.count(3, type2);
		List<Board> list = service.adqnalist(pageNum, limit, 3, type2);
		int maxpage = (int) ((double) count / limit + 0.95);
		int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int endpage = startpage + 9;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		int boardno = count - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("boardno", boardno);
		return mav;
	}

	@RequestMapping("admindelete")
	public ModelAndView adcheckadmindelete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("login");
		String password = service.MessageDigest(user.getPassword());
		if (!dbUser.getPassword().equals(password)) {
			throw new LogInException("비밀번호가 틀립니다.", "list.jeju");
		}
		try {
			service.admindelete(user);
			if (dbUser.getUserid().equals("admin")) {
//	            mav.setViewName("redirect:../admin/list.jeju");
				mav.addObject("msg", "탈퇴 처리 되었습니다.");
				mav.addObject("url", "list.jeju");
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new LogInException("탈퇴실패", "list.jeju");
		}
		return mav;
	}

	@GetMapping("acceptlist")
	public ModelAndView adcheckacceptlist(Integer pageNum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			if (pageNum == null || pageNum.toString().equals(""))
				pageNum = 1;
			int limit = 10;
			List<Final> list = service.acceptList();
			for (Final f : list) {
				f.setRoomnums(service.roomnums(f));
			}
			int count = service.acceptcount();
			int maxpage = (int) ((double) count / limit + 0.95);
			int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
			int endpage = startpage + 9;
			if (endpage > maxpage)
				endpage = maxpage;
			int reserveno = count - (pageNum - 1) * limit;
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("reserveno", reserveno);
			mav.addObject("list", list);
		} catch (Exception e) {
			throw new JejuException("페이지를 호출하던 중 오류가 발생하였습니다", "../user/main.jeju");
		}
		return mav;
	}

	@GetMapping("reservationmanagement")
	public ModelAndView adcheckreservationmanagement(Integer pageNum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals(""))
			pageNum = 1;
		int limit = 10;
		try {
			List<Final> list = service.reservationmanagement(pageNum, limit);
			int count = service.reservationcount();
			int maxpage = (int) ((double) count / limit + 0.95);
			int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
			int endpage = startpage + 9;
			if (endpage > maxpage)
				endpage = maxpage;
			int reserveno = count - (pageNum - 1) * limit;
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("reserveno", reserveno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}