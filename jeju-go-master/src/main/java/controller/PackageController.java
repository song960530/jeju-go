package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import logic.JejuService;
import logic.Package;
import logic.Room;
import logic.Room2;

@Controller
@RequestMapping("package")
public class PackageController {
	@Autowired
	private JejuService service;
	
	@RequestMapping("*")
	public ModelAndView packlist(Integer no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Package pack = service.getPack(no);
		mav.addObject("pack", pack);
		return mav;
	}
	@PostMapping("packregist")
	public ModelAndView packregist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		int no = service.packregist(request, mtfRequest);
		mav.setViewName("redirect:packdetail.jeju?no="+no);
		return mav;
	}
			
	@RequestMapping("imgupload")
	public String imgupload (MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getSession().getServletContext().getRealPath("/") + "package/imgfile/";
		File f = new File(path);
		if(!f.exists()) {f.mkdirs();}
		if(!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file);
			} catch(Exception e) {
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
		mav.addObject("packlist", packlist);
		return mav;
	}
	
	@GetMapping("packdetail")
	public ModelAndView packdetail(Integer no) {
		ModelAndView mav = new ModelAndView();
		List<Package> pack1 = service.packday(no);
		for (Package p : pack1) {
			List<String> input = new ArrayList<String>();
			String[] ss = p.getStartday().split(",");
			for (String ss2 : ss) {
				input.add(ss2);
			}
			p.setNo(no);
			p.setStartdays(input);
		}
		mav.addObject("pack1", pack1);
		return mav;
	}
}
