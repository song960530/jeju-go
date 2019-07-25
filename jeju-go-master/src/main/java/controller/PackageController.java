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
	public ModelAndView packregist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		int no = service.packregist(request, mtfRequest);
		mav.setViewName("redirect:packdetail.jeju?no=" + no);
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
		List<Package> packlist = service.packlist();
//		for(Package p : packlist) {
//			String startdays[] = p.getStartday().split(",");
//			List<String> startday2 = new ArrayList<String>();
//			for(String s : startdays) {
//				startday2.add(s);
//			}
//			p.setStartdays(startday2);
//		}
		mav.addObject("packlist", packlist);
		return mav;
	}

	@RequestMapping({"packdetail","packreserve"})
	public ModelAndView packdetail(Integer no) {
		ModelAndView mav = new ModelAndView();
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
				end = num+"";
				endday.add(end);
			}
		}
		mav.addObject("pack", pack);
		mav.addObject("start", startday);
		mav.addObject("end", endday);
		return mav;
	}
	@PostMapping("packreservechk")
	public ModelAndView reservepack(Integer no, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Package pack = service.getPack(no);
		String userid = request.getParameter("userid");
		int countpoint = service.countPoint(userid);
		int people = Integer.parseInt(request.getParameter("people"));
		String startday = request.getParameter("startday");
		mav.addObject("countpoint", countpoint);
		mav.addObject("startday", startday);
		mav.addObject("people", people);
		mav.addObject("pack", pack);
		return mav;
	}
}
