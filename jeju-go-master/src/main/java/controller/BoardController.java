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

import exception.JejuException;
import logic.Board;
import logic.JejuService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private JejuService service;

	@GetMapping("*")
	public ModelAndView getBoard(Integer no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if (no != null) {
			board = service.getBoard(no, request);
		}
		mav.addObject("board", board);
		return mav;
	}

	@RequestMapping("csboard")
	public ModelAndView notice(Integer notpageNum, Integer qnapageNum) {
		ModelAndView mav = new ModelAndView();

		if (notpageNum == null || notpageNum.toString().equals("")) {
			notpageNum = 1;
		}
		int limit = 10;
		int noticecount = service.boardcount(1);
		List<Board> noticelist = service.list(notpageNum, limit, 1);
		int notmaxpage = (int) ((double) noticecount / limit + 0.95);
		int notstartpage = ((int) ((notpageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int notendpage = notstartpage + 9;
		if (notendpage > notmaxpage) {
			notendpage = notmaxpage;
		}
		int notboardno = noticecount - (notpageNum - 1) * limit;

		if (qnapageNum == null || qnapageNum.toString().equals("")) {
			qnapageNum = 1;
		}
		int qnacount = service.boardcount(2);
		int qnamaxpage = (int) ((double) qnacount / limit + 0.95);
		int qnastartpage = ((int) ((qnapageNum / 10.0 + 0.9) - 1) * 10 + 1);
		int qnaendpage = qnastartpage + 9;
		if (qnaendpage > qnamaxpage) {
			qnaendpage = qnamaxpage;
		}
		List<Board> qnalist = service.list(qnapageNum, limit, 2);
		int qnaboardno = qnacount - (qnapageNum - 1) * limit;

		mav.addObject("notpageNum", notpageNum);
		mav.addObject("notmaxpage", notmaxpage);
		mav.addObject("notstartpage", notstartpage);
		mav.addObject("notendpage", notendpage);
		mav.addObject("noticecount", noticecount);
		mav.addObject("noticelist", noticelist);
		mav.addObject("notboardno", notboardno);

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
	public ModelAndView lchecknoticewrite(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			service.noticewrite(board, request);
			mav.setViewName("redirect:csboard.jeju");
		} catch (Exception e) {
			throw new JejuException("글등록에 실패하였습니다", "csboard.jeju");
		}
		return mav;
	}

	@RequestMapping("qnalist")
	public ModelAndView qnalist(Integer pageNum, Integer type2, String userid) {
		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;
		int count = service.count(3, userid, type2);
		List<Board> list = service.qnalist(pageNum, limit, 3, userid, type2);
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

	@PostMapping("qnawrite")
	public ModelAndView lcheckqnawrite(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = service.getUser(request.getParameter("userid"));
		try {
			service.noticewrite(board, request);
			mav.setViewName("redirect:qnalist.jeju?userid=" + userid);
		} catch (Exception e) {
			throw new JejuException("문의글 등록을 실패하였습니다.", "csboard.jeju");
		}
		return mav;
	}

	@PostMapping("csupdate")
	public ModelAndView lcheckcsupdate(Board board, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			service.noticeupdate(board);
			mav.setViewName("redirect:csdetail.jeju?no=" + board.getNo());
		} catch (Exception e) {
			throw new JejuException("게시글 수정에 실패하였습니다.", "csdetail.jeju?no=" + board.getNo());
		}
		return mav;
	}

	@PostMapping("csdelete")
	public ModelAndView lcheckcsdelete(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int count = Integer.parseInt(request.getParameter("count"));
		try {
			User user = (User) session.getAttribute("login");
			if (user.getUserid().equals("admin")) {
				service.noticedelete(board);
				if (board.getType().equals("3")) {
					mav.setViewName("redirect:../admin/qnalist.jeju");
				} else {
					mav.setViewName("redirect:../board/csboard.jeju");
				}
			} else {
				if (count > 1) {
					mav.addObject("msg", "답글이 달린 글은 삭제가 불가능 합니다.");
					mav.addObject("url", "../board/csdetail.jeju?no=" + (board.getNo() - 1));
					mav.setViewName("alert");
				} else {
					service.noticedelete(board);
					mav.setViewName("redirect:board/qnalist.jeju?userid=" + user.getUserid());
				}
			}
		} catch (Exception e) {
			throw new JejuException("게시글 삭제에 실패하였습니다", "csdetail.jeju?no=" + (board.getNo() - 1));
		}
		return mav;
	}

	@PostMapping("qnareply")
	public ModelAndView reply(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			service.reply(board, request);
			mav.addObject("msg", "답글 작성완료");
//	         mav.addObject("url", "../board/csdetail.jeju?no=" + (board.getNo() - 1) + "&type=" + (board.getType()) + ",&type2=" + board.getType2());
			mav.addObject("url", "../board/csdetail.jeju?no=" + board.getRef() + "&type=" + board.getType() + "&type2="
					+ board.getType2());
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("답글 등록을 실패하였습니다",
					"csdetail.jeju?no=" + board.getRef() + "&type=" + board.getType() + "&type2=" + board.getType2());
		}
		return mav;
	}

	@RequestMapping("csdetail")
	public ModelAndView csdetail(Integer no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			int count = service.qnacount(no);
			Board bdetail = service.qnablist(no);
			Board rdetail = service.qnarlist(no, 1);
			mav.addObject("bdetail", bdetail); // 원글 정보
			mav.addObject("rdetail", rdetail); // 답글 정보
			mav.addObject("count", count);
		} catch (Exception e) {
			throw new JejuException("게시글을 불러오는데 실패하였습니다.", "csboard.jeju");
		}
		return mav;
	}

	@PostMapping("replydelete")
	public ModelAndView replydelete(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			service.replydelete(board);
			mav.addObject("msg", "답글 삭제완료");
			mav.addObject("url", "../board/csdetail.jeju?no=" + board.getRef() + "&type=" + board.getType() + "&type2="
					+ board.getType2());
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("답글 삭제를 실패하였습니다",
					"csdetail.jeju?no=" + board.getRef() + "&type=" + board.getType() + "&type2=" + board.getType2());
		}
		return mav;
	}
}
