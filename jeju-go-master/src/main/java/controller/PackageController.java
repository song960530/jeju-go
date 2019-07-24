package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import logic.JejuService;
import logic.Package;

@Controller
@RequestMapping("package")
public class PackageController {
	@Autowired
	private JejuService service;
	
	@RequestMapping("*")
	public ModelAndView packlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Package pack = new Package();
		mav.addObject("pack", pack);
		return mav;
	}
	@PostMapping("packregist")
	public ModelAndView packregist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		int no = service.packregist(request, mtfRequest);
		mav.setViewName("redirect:hoteldetail.jeju?no=" + no);
		return mav;
	}
}
