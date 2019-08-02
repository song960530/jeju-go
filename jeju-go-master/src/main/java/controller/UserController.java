package controller;

import java.io.PrintStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import logic.Final;
import logic.Hotel;
import logic.JejuService;
import logic.Point;
import logic.Review;
import logic.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.JejuException;
import exception.LogInException;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private JejuService service;

	@RequestMapping("*")
	public ModelAndView Home(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("redirect:main.jeju");
			mav.addObject("user", user);
		} catch (DataIntegrityViolationException e) {
			bindResult.reject("error.duplicate.user");
		} catch (Exception e) {
			throw new LogInException("ȸ������ �� ������ �߻��Ͽ����ϴ�.", "main.jeju");
		}
		return mav;
	}

	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			User dbUser = service.userSelect(user.getUserid());
			if (dbUser == null) {
				mav.addObject("msg", "���̵� �ٽ� �Է����ּ���");
				mav.addObject("url", "main.jeju");
				mav.setViewName("alert");
				return mav;
			} else if (!dbUser.getPassword().equals(service.messageDigest(user.getPassword()))) {
				mav.addObject("msg", "��й�ȣ�� �ٽ� �Է����ּ���");
				mav.addObject("url", "main.jeju");
				mav.setViewName("alert");
				return mav;
			} else {
				session.setAttribute("login", dbUser);
				mav.setViewName("redirect:main.jeju");
			}
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			bindResult.reject("error.login.id");
		} catch (Exception e) {
			throw new LogInException("�α��� �� ������ �߻��Ͽ����ϴ�", "main.jeju");
		}
		return mav;
	}

	@RequestMapping("logout")
	public ModelAndView lchecklogout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:main.jeju");
		return mav;
	}

	@PostMapping("userSearch")
	public ModelAndView userSearch(User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.userSelect(user.getUserid());
		if (user.getUsername() != null && user.getUsername().length() != 0 && user.getPhone() != null
				&& user.getPhone().length() != 0) {
			dbUser = service.useridcheck(user);
			if (dbUser != null) {
				mav.addObject("url", "main.jeju");
				mav.addObject("msg", "���̵� : " + dbUser.getUserid());
				mav.setViewName("alert");
			} else {
				mav.addObject("url", "main.jeju");
				mav.addObject("msg", "�ش� ������ ��ϵ� ȸ���� �������� �ʽ��ϴ�.");
				mav.setViewName("alert");
			}
		} else {
			mav.addObject("msg", "�̸��� ��ȭ��ȣ�� �Է��� �ּ���");
			mav.addObject("url", "main.jeju");
			mav.setViewName("alert");
		}
		return mav;
	}

	@PostMapping("passSearch")
	public ModelAndView passSearch(User user, BindingResult bindResult, HttpServletRequest request)
			throws AddressException, MessagingException {
		ModelAndView mav = new ModelAndView();
		try {
			User dbUser = service.userSelect(user.getUserid());
			if (user.getUserid() != null && user.getUserid().length() != 0) {
				String ran = service.random();
				dbUser = service.userSelect(user.getUserid());
				request.setAttribute("random", ran);
				if (dbUser != null) {
					mailSender(ran, dbUser.getUserid());
					mav.addObject("msg", "�ӽú�й�ȣ�� �߼� �Ǿ����ϴ�.");
					mav.addObject("url", "main.jeju");
					mav.setViewName("alert");
				} else {
					mav.addObject("url", "main.jeju");
					mav.addObject("msg", "�ش� ������ ��ϵ� ȸ���� �������� �ʽ��ϴ�.");
					mav.setViewName("alert");
				}
			} else {
				mav.addObject("msg", "���̵� Ȯ���� �ּ���");
				mav.addObject("url", "main.jeju");
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			throw new LogInException("��й�ȣ ã�� �� ������ �߻��Ͽ����ϴ�.", "main.jeju");
		}
		return mav;
	}

	public void mailSender(String ran, String email) throws AddressException, MessagingException {
		String host = "smtp.naver.com";
		final String username = "htn314@naver.com";
		final String password = "��й�ȣ�� �ñ��ϳ���?";
		int port = 465;
		String subject = "�ȳ��ϼ��� ����Go �Դϴ�(�ӽú�й�ȣ).";
		String body = "�ӽ÷� �߱� �帰 ��й�ȣ��  " + ran + " �̸� �α��� �� �������������� ��й�ȣ�� �������ֽø� �˴ϴ�.";
		service.getNewPwd(ran, email);
		Properties props = System.getProperties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);

		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("htn314@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
	}

	@RequestMapping("mypage")
	public ModelAndView lcheckmypage(String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(userid);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("updatemypage")
	public ModelAndView lcheckupdatemypage(User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			User loginUser = (User) session.getAttribute("loginUser");
			User dbUser = (User) session.getAttribute("login");
			service.update(user);
			mav.addObject("msg", "���� ���� �Ϸ�");
			mav.addObject("url", "mypage.jeju?userid=" + user.getUserid());
			if (dbUser.getUserid().equals("admin")) {
				mav.addObject("msg", "���� ���� �Ϸ�");
				mav.addObject("url", "../admin/list.jeju");
			}
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new LogInException("���� ������ ������ �߻��Ͽ����ϴ�", "mypage.jeju?userid=" + user.getUserid());
		}
		return mav;
	}

	@PostMapping("withdrawal")
	public ModelAndView lcheckdelete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("login");
		String password = service.MessageDigest(user.getPassword());
		if (!dbUser.getPassword().equals(password)) {
			throw new LogInException("��й�ȣ�� Ʋ���ϴ�.", "withdrawal.jeju");
		}
		try {
			service.DeleteRequest(user);
			if (dbUser.getUserid().equals("admin")) {
				mav.setViewName("redirect:../admin/deletelist.jeju");
			} else if (!dbUser.getUserid().equals("admin")) {
				session.invalidate();
				mav.addObject("msg", "Ż�� ��û�Ǿ����ϴ�.");
				mav.addObject("url", "main.jeju");
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new LogInException("Ż�����", "delete.shop?id=" + dbUser.getUserid());
		}
		return mav;
	}

	@PostMapping("updatepw")
	public ModelAndView lcheckupdatepw(User user, BindingResult bindResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.userSelect(user.getUserid());
		String password = service.messageDigest(user.getPassword());
		String newpassword = service.messageDigest(request.getParameter("newpassword"));
		if (!dbUser.getPassword().equals(password)) {
			mav.addObject("msg", "��й�ȣ�� Ʋ���ϴ�.");
			mav.addObject("url", "updatepw.jeju?userid=" + user.getUserid());
			mav.setViewName("alert");
			return mav;
		}
		try {
			user.setPassword(newpassword);
			service.updatepw(user);
			mav.addObject("msg", "��й�ȣ ������ �Ϸ�Ǿ����ϴ�.");
			mav.addObject("url", "updatepw.jeju?userid=" + user.getUserid());
			mav.setViewName("alert");
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.user.update");
		}
		return mav;
	}

	@RequestMapping(value = "idchk", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView idchk(String userid) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.userSelect(userid);
		if (userid.trim().equals("")) {
			mav.addObject("msg", "���̵� �Է��ϼ���");
		} else if (dbUser == null) {
			mav.addObject("msg", "��ϰ����� ���̵� �Դϴ�.");
		} else {
			mav.addObject("msg", "�����ϴ� ���̵� �Դϴ�.");
		}
		return mav;
	}

	@RequestMapping(value = "adminpasschk", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView simpleWithObject(String inputpass) {
		ModelAndView mav = new ModelAndView();
		String dbpass = service.userSelect("admin").getPassword();
		String pass = service.messageDigest(inputpass);
		if (dbpass.equals(pass)) {
			mav.addObject("msg", "��й�ȣ�� ��ġ�մϴ�");
		} else {
			mav.addObject("msg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		return mav;
	}

	@GetMapping("history")
	public ModelAndView lcheckacceptlist(String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Final> list = service.history(userid);
			mav.addObject("list", list);
		} catch (Exception e) {
			throw new JejuException("�������� ȣ���ϴ� �� ������ �߻��Ͽ����ϴ�", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping("wish")
	public ModelAndView lcheckwishBtn(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		String userid = request.getParameter("userid");
		service.wish(userid, no);
		mav.addObject("msg", "���ã�� ��ϵǾ����ϴ�.");
		mav.addObject("url", "../hotel/hoteldetail.jeju?no=" + no);
		mav.setViewName("alert");
		return mav;
	}

	@RequestMapping("deletewish")
	public ModelAndView lcheckdeletewish(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		String userid = request.getParameter("userid");
		service.deletewish(userid, no);
		mav.addObject("msg", "���ã�� �����Ǿ����ϴ�.");
		mav.addObject("url", "../hotel/hoteldetail.jeju?no=" + no);
		mav.setViewName("alert");
		return mav;
	}

	@RequestMapping("wishlist")
	public ModelAndView lcheckdetail(String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(userid);
		List<Integer> no = service.noSelect(userid);
		List<Hotel> list = service.wihslist(no);
		mav.addObject("list", list);
		mav.addObject("no", no);
		return mav;
	}

	@RequestMapping("reviewForm")
	public ModelAndView lcheckreviewForm(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		Final f = service.selectFinal(no);

		mav.addObject("f", f);
		return mav;
	}

	@PostMapping("writereview")
	public ModelAndView lcheckwrietreview(Review review, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			service.writeReview(review);
			service.reviewOk(review.getNo());
			mav.addObject("msg", "���䰡 ��ϵǾ����ϴ�.");
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("���� �ۼ��� �����Ͽ����ϴ�", "../user/history?userid=" + review.getUserid());
		}
		return mav;
	}

	@RequestMapping("mypoint")
	public ModelAndView lcheckmypoint(Integer pageNum, String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (pageNum == null || pageNum.toString().equals(""))
			pageNum = 1;
		int limit = 10;
		try {
			List<Point> list = service.mypoint(pageNum, limit, userid);
			int count = service.mypointcount(userid);
			int maxpage = (int) ((double) count / limit + 0.95);
			int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1);
			int endpage = startpage + 9;
			if (endpage > maxpage)
				endpage = maxpage;
			int pointno = count - (pageNum - 1) * limit;
			int mypointsum=service.mypointsum(userid);
			mav.addObject("mypointsum", mypointsum);
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("pointno", pointno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
