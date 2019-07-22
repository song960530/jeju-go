package controller;

import java.io.PrintStream;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import logic.JejuService;
import logic.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
			System.out.println(bindResult.toString());
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("redirect:main.jeju");
			mav.addObject("user", user);
		} catch (DataIntegrityViolationException e) {
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}

	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		if (bindResult.hasErrors()) {
//			bindResult.reject("error.input.user");
//			mav.getModel().putAll(bindResult.getModel());
//			return mav;
//		}
		try {
			User dbUser = service.userSelect(user.getUserid());
			if (dbUser == null) {
				mav.addObject("msg", "���̵� �ٽ� �Է����ּ���");
				mav.addObject("url", "main.jeju");
				mav.setViewName("../alert");
				return mav;
			} else if (!dbUser.getPassword().equals(service.messageDigest(user.getPassword()))) {
				bindResult.reject("error.login.password");
				return mav;
			} else {
				session.setAttribute("login", dbUser);
				mav.setViewName("redirect:main.jeju");
			}
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			bindResult.reject("error.login.id");
		}
		return mav;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:main.jeju");
		return mav;
	}

	@PostMapping("userSearch")
	public ModelAndView userSearch(User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = null;
		if (user.getUsername() != null && user.getUsername().length() != 0 && user.getPhone() != null
				&& user.getPhone().length() != 0) {
			dbUser = service.useridcheck(user);
			if (user.getUsername().equals(dbUser.getUsername()) && user.getPhone().equals(dbUser.getPhone())) {
				mav.addObject("url", "main.jeju");
				mav.addObject("msg", "���̵� : " + dbUser.getUserid());
				mav.setViewName("alert");
			}
		} else if (!dbUser.getUsername().equals(user.getUsername()) || !dbUser.getPhone().equals(user.getPhone())) {
			mav.addObject("msg", "�̸��� �ٽ� �Է����ּ���");
			mav.addObject("url", "main.jeju");
			mav.setViewName("alert");
		}
		return mav;
	}

	@PostMapping("passSearch")
	public ModelAndView passSearch(User user, BindingResult bindResult, HttpServletRequest request ) throws AddressException, MessagingException {
		ModelAndView mav = new ModelAndView();
		User dbUser = null;
		if(user.getUserid() != null && user.getUserid().length() != 0) {
			dbUser = service.userSelect(user.getUserid());				
			String ran = service.random();
			request.setAttribute("random", ran);
			mailSender(ran,dbUser.getUserid());
			mav.addObject("url","main.jeju");
			mav.addObject("msg","�ӽú�й�ȣ�� �߼� �Ǿ����ϴ�.");
			mav.setViewName("alert");
			
	}else if(dbUser == null) {
		mav.addObject("url","main.jeju");
		mav.addObject("msg","�Է��Ͻ� ���̵�� ��ϵ� ���̵� �ƴմϴ�.");
		mav.setViewName("alert");
	}
		return mav;
}	

	public void mailSender(String ran,String email) throws AddressException, MessagingException {
		String host = "smtp.naver.com";
		final String username = "htn314@naver.com";
		final String password = "!smc2007077!";
		int port = 465;
		String subject = "�ȳ��ϼ��� ����Go �Դϴ�(�ӽú�й�ȣ).";
		String body = "�ӽ÷� �߱� �帰 ��й�ȣ��  " + ran + " �̸� �α��� �� �������������� ��й�ȣ�� �������ֽø� �˴ϴ�.";
		service.getNewPwd(ran,email);
		System.out.println(body);
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",port);
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.ssl.enable","true");
		props.put("mail.smtp.ssl.trust",host);

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
	public ModelAndView mypage(String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(userid);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("updatemypage")
	public ModelAndView updatemypage( User user, BindingResult bindResult, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			User loginUser = (User)session.getAttribute("loginUser");
			service.update(user);
			System.out.println(user.getUserid());
			mav.addObject("msg","���� ���� �Ϸ�");
			mav.addObject("url","mypage.jeju?userid="+user.getUserid());
			mav.setViewName("alert");
			return mav;
		}
	
	@PostMapping("withdrawal")
	   public ModelAndView delete(User user, HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      User dbUser = (User)session.getAttribute("login");
	      System.out.println(dbUser);
		  String password = service.MessageDigest(user.getPassword());
		  System.out.println(password);
	      if(!dbUser.getPassword().equals(password)) {
	         throw new LogInException("��й�ȣ�� Ʋ���ϴ�.","withdrawal.jeju?id=" + user.getUserid());
	      }
	      try {
	         service.DeleteRequest(user);
	         if (dbUser.getUserid().equals("admin")) {
	            mav.setViewName("redirect:../admin/deletelist.jeju");
	         } else if (!dbUser.getUserid().equals("admin")) {
	            session.invalidate();
	            mav.addObject("msg","Ż�� ��û�Ǿ����ϴ�.");
	            mav.addObject("url","main.jeju");
	            mav.setViewName("alert");
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	         throw new LogInException("Ż�����", "delete.shop?id=" + dbUser.getUserid());
	      }
	      return mav;
	   }
}
