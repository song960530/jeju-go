package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.JejuService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private JejuService service;
	
	@GetMapping("*")
	public ModelAndView getBoard(Integer no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(no != null) {
			board = service.getBoard(no, request);
		}
		mav.addObject("board", board);
		return mav;
	}
	@RequestMapping("csboard")
	public ModelAndView notice(Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {pageNum = 1;}
		int limit = 10;
		int noticecount = service.boardcount(1);
		int qnacount = service.boardcount(2);
		List<Board> noticelist = service.boardlist(pageNum, limit, 1);
		List<Board> qnalist = service.boardlist(pageNum, limit, 2);
		int maxpage = (int)((double)noticecount/limit + 0.95);
		int startpage = ((int)((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int endpage = startpage + 9;
		if(endpage > maxpage) {endpage = maxpage;}
		int boardno = noticecount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("noticecount", noticecount);
		mav.addObject("qnacount", qnacount);
		mav.addObject("noticelist", noticelist);
		mav.addObject("qnalist", qnalist);
		mav.addObject("boardno", boardno);
		return mav;
	}
	@PostMapping("cswrite")
	public ModelAndView noticewrite(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			service.noticewrite(board, request);
			mav.setViewName("redirect:csboard.jeju");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@PostMapping("csupdate")
	public ModelAndView csupdate(Board board) {
		ModelAndView mav = new ModelAndView();
		try {
			service.noticeupdate(board);
			mav.setViewName("redirect:csdetail.jeju?no=" + board.getNo());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("csdetail")
	public ModelAndView csdetail(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			service.noticedelete(board);
			mav.setViewName("redirect:csboard.jeju");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
