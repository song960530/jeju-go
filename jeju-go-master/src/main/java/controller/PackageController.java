package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import exception.JejuException;
import logic.User;
import logic.Final;
import logic.Hotel;
import logic.JejuService;
import logic.Package;
import logic.Room;
import logic.Room2;

@Controller
@RequestMapping("package")
public class PackageController {
	@Autowired
	private JejuService service;

	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new Hotel());
		return null;
	}

	@PostMapping("packregist")
	public ModelAndView adcheckpackregist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int no2 = 0;
		try {
			int no = service.packregist(request, mtfRequest);
			no2 = no;
			mav.setViewName("redirect:packdetail.jeju?no=" + no);
		} catch (Exception e) {
			throw new JejuException("페이지 오류발생.", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getSession().getServletContext().getRealPath("/") + "package/imgfile/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		if (!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = "/jeju-go-master/package/imgfile/" + upload.getOriginalFilename();
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckeditor";
	}

	@RequestMapping("packlist")
	public ModelAndView packlist() {
		ModelAndView mav = new ModelAndView();
		try {
			List<Package> packlist = service.packlist();
			mav.addObject("packlist", packlist);
		} catch (Exception e) {
			throw new JejuException("페이지 오류발생.", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping({ "packdetail", "packreserve" })
	public ModelAndView packdetail(Integer no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Package> packlist = service.packday(no);
			List<String> startday = new ArrayList<String>();
			List<String> endday = new ArrayList<String>();
			String end = null;
			int num = 0;
			Package pack = new Package();
			pack = service.getPack(no);
			for (Package p : packlist) {
				String startdays[] = p.getStartday().split(",");
				List<String> startday2 = new ArrayList<String>();
				for (String s : startdays) {
					startday2.add(s);
				}
				p.setStartdays(startday2);
				startday.addAll(p.getStartdays());
				for (String ss : startday) {
					num = Integer.parseInt(ss) + 7;
					end = num + "";
					endday.add(end);
				}
			}
			mav.addObject("pack", pack);
			mav.addObject("start", startday);
			mav.addObject("end", endday);
		} catch (Exception e) {
			throw new JejuException("페이지 오류발생.", "packlist.jeju");
		}
		return mav;
	}

	@PostMapping("packreserve")
	public ModelAndView lcheckreservepack(Integer no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = request.getParameter("userid");
		int people = Integer.parseInt(request.getParameter("people"));
		try {
			Package pack = service.getPack(no);
			String year = request.getParameter("year");
			String mon = null;
			String start = null;
			if (Integer.parseInt(request.getParameter("mon")) < 10) {
				mon = 0 + request.getParameter("mon");
			} else {
				mon = request.getParameter("mon");
			}
			if (Integer.parseInt(request.getParameter("startday")) < 10) {
				start = 0 + request.getParameter("startday");
			} else {
				start = request.getParameter("startday");
			}
			String startday = year + "-" + mon + "-" + start;
			int reservechk = service.getPeople(startday, no);
			int chk = pack.getMax() - reservechk;
			if (reservechk <= pack.getMax() && pack.getMax() - reservechk >= people) {
				mav.addObject("msg", "예약페이지로 이동합니다.");
				mav.addObject("url", "../package/packreservechk.jeju?no=" + no + "&userid=" + userid + "&people="
						+ people + "&startday=" + request.getParameter("startday"));
				mav.setViewName("alert");
			} else {
				mav.addObject("msg", "예약가능한 인원은 " + chk + "명 입니다");
				mav.addObject("url", "../package/packreserve.jeju?no=" + no + "&userid=" + userid);
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			throw new JejuException("페이지 오류발생.", "packdetail.jeju?no=" + no + "&userid=" + userid);
		}
		return mav;
	}

	@RequestMapping("packreservechk")
	public ModelAndView lcheckpackreservechk(Integer no, String userid, int people, String startday,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			Package pack = service.getPack(no);
			int countpoint = service.countPoint(userid);
			mav.addObject("countpoint", countpoint);
			mav.addObject("startday", startday);
			mav.addObject("people", people);
			mav.addObject("pack", pack);
		} catch (Exception e) {
			throw new JejuException("페이지 오류발생.", "packdetail.jeju?no=" + no + "&userid=" + userid);
		}
		return mav;
	}

	@PostMapping("packreservation")
	public ModelAndView lcheckreservation(Package pack, Final f, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			Final fi = service.setFinal(f, request);
			fi.setPnum(Integer.parseInt(request.getParameter("people")));
			service.realFinal(fi);
			mav.addObject("msg", "예약이 완료되었습니다.");
			mav.addObject("url", "../user/main.jeju");
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("패키지 예약을 실패하였습니다.",
					"packdetail.jeju?no=" + pack.getNo() + "&userid=" + f.getUserid());
		}
		return mav;
	}

	@PostMapping("packdelete")
	public ModelAndView adcheckpackdelete(Integer no, String userid, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			if (service.finalcount(no) == 0) {
				service.packdelete(no);
				mav.addObject("msg", "삭제 완료.");
				mav.addObject("url", "../package/packlist.jeju");
				mav.setViewName("alert");
			} else {
				mav.addObject("msg", "해당 상품은 예약이 있습니다.");
				mav.addObject("url", "../package/packdetail.jeju?no=" + no);
				mav.setViewName("alert");
			}
		} catch (Exception e) {
			throw new JejuException("패키지 삭제를 실패하였습니다","../package/packdetail.jeju?no=" + no);
		}
		return mav;
	}
}