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
	public ModelAndView notice(Integer notpageNum, Integer qnapageNum) {
		ModelAndView mav = new ModelAndView();
		if(notpageNum == null || notpageNum.toString().equals("")) {notpageNum = 1;}
		int notlimit = 10;
		int noticecount = service.boardcount(1);
		List<Board> noticelist = service.boardlist(notpageNum, notlimit, 1);
		int notmaxpage = (int)((double)noticecount/notlimit + 0.95);
		int notstartpage = ((int)((notpageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int notendpage = notstartpage + 9;
		if(notendpage > notmaxpage) {notendpage = notmaxpage;}
		int notboardno = noticecount - (notpageNum - 1) * notlimit;
		
//벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽//
		
		int qnalimit = 10;
		int qnacount = service.boardcount(2);
		List<Board> qnalist = service.boardlist(qnapageNum, qnalimit, 2);
		int qnamaxpage = (int)((double)noticecount/qnalimit + 0.95);
		int qnastartpage = ((int)((qnapageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int qnaendpage = qnastartpage + 9;
		if(qnaendpage > qnamaxpage) {qnaendpage = qnamaxpage;}
		int qnaboardno = noticecount - (qnapageNum - 1) * qnalimit;
		
//벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽//		
		
		mav.addObject("notpageNum", notpageNum);
		mav.addObject("notmaxpage", notmaxpage);
		mav.addObject("notstartpage", notstartpage);
		mav.addObject("notendpage", notendpage);
		mav.addObject("noticecount", noticecount);
		mav.addObject("noticelist", noticelist);
		mav.addObject("notboardno", notboardno);

//벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽벽//		
		
		mav.addObject("qnapageNum", qnapageNum);
		mav.addObject("qnamaxpage", qnamaxpage);
		mav.addObject("qnastartpage", qnastartpage);
		mav.addObject("qnaendpage", qnaendpage);
		mav.addObject("qnacount", qnacount);
		mav.addObject("qnalist", qnalist);
		mav.addObject("qnaboardno", qnaboardno);
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
	@RequestMapping("csdelete")
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
