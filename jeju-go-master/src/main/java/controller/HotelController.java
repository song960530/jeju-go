package controller;

import com.opencsv.CSVReader;

import logic.Final;
import logic.Hotel;
import logic.Hreserve;
import logic.JejuService;
import logic.Latlng;
import logic.Room;
import logic.Room2;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	private JejuService service;

	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new Hotel());
		return null;
	}

	@PostMapping("register")
	public ModelAndView register(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		int hno = service.regist(request, mtfRequest);
		mav.setViewName("redirect:hoteldetail.jeju?no=" + hno);
		return mav;
	}

	@RequestMapping({ "hotellist", "adminhotellist" })
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<Hotel> list = service.list();
		mav.addObject("list", list);
		return mav;
	}

	@GetMapping("hoteldetail")
	public ModelAndView detail(Integer no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("hotel/hoteldetail");
		Hotel h = service.selectOne(no);
		List<Room> r = service.roomList(no);
		h.setRoom(r);
		ArrayList<Latlng> arr = null;
		String path = request.getSession().getServletContext().getRealPath("/") + "csv/cctv.csv";
		try {
			InputStreamReader is = new InputStreamReader(new FileInputStream(path), "EUC-KR");
			CSVReader reader = new CSVReader(is);
			List<String[]> list = reader.readAll();
			arr = new ArrayList<Latlng>();

			for (String[] str : list) {
				Latlng entity = new Latlng();
				entity.setLat(str[10]);
				entity.setLng(str[11]);
				arr.add(entity);
			}
			arr.remove(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("cctv", arr);
		mav.addObject("room", r);
		mav.addObject("hotel", h);
		return mav;
	}

	@GetMapping("roomregist")
	public ModelAndView register2(Integer no, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		model.addAttribute(new Room());
		return mav;
	}

	@PostMapping("roomregister")
	public ModelAndView roomregister(Room room, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView();
		service.regist2(room, request, mtfRequest);

		mav.setViewName("redirect:hoteldetail.jeju?no=" + room.getHno());

		return mav;
	}

	@GetMapping("roomdetail")
	public ModelAndView roomdetail(Integer hno, String name) {
		ModelAndView mav = new ModelAndView();
		Room r = service.selectOne(hno, name);

		List<String> con = new ArrayList<String>();
		String[] sr = r.getConvenient().split(",");

		for (String sss : sr) {
			con.add(sss);
		}

		mav.addObject("convenient", con);
		mav.addObject("room", r);
		return mav;
	}

	@GetMapping("hreserveform")
	public ModelAndView hreserveform(Integer hno) {
		ModelAndView mav = new ModelAndView();
		List<Room2> r2 = service.selectRoom2(hno);
		for (Room2 r : r2) {
			List<String> input = new ArrayList<String>();
			String[] ss = r.getRoomnum().split(",");
			for (String ss2 : ss) {
				input.add(ss2);
			}
			r.setHno(hno);
			r.setRoomnums(input);
		}
		mav.addObject("room", r2);
		return mav;
	}

	@PostMapping("yesroom")
	public ModelAndView yesroom(Hreserve hreserve, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.yesroom(hreserve, request);
		mav.addObject("msg", "등록이 완료되었습니다.");
		mav.addObject("url", "hreserveform.jeju?hno=" + hreserve.getHno());
		mav.setViewName("alert");
		return mav;
	}

	@PostMapping("search")
	public ModelAndView serarch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Hotel> hotel = service.search(request);
		mav.addObject("list", hotel);
		mav.addObject("startday", request.getParameter("start"));
		mav.addObject("endday", request.getParameter("end"));
		mav.addObject("people", request.getParameter("people"));
		mav.setViewName("hotel/searchlist");
		return mav;
	}

	@GetMapping("searchhoteldetail")
	public ModelAndView searchhoteldetail(int no, String start, String end, int people, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Hotel hotel = service.searchselectOne(no, start, end, people);
		ArrayList<Latlng> arr = null;
		String path = request.getSession().getServletContext().getRealPath("/") + "csv/cctv.csv";
		try {
			InputStreamReader is = new InputStreamReader(new FileInputStream(path), "EUC-KR");
			CSVReader reader = new CSVReader(is);
			List<String[]> list = reader.readAll();
			arr = new ArrayList<Latlng>();

			for (String[] str : list) {
				Latlng entity = new Latlng();
				entity.setLat(str[10]);
				entity.setLng(str[11]);
				arr.add(entity);
			}
			arr.remove(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("cctv", arr);
		mav.addObject("hotel", hotel);
		mav.addObject("startday", start);
		mav.addObject("endday", end);
		mav.addObject("people", people);

		mav.setViewName("hotel/hoteldetail2");
		return mav;
	}

	@RequestMapping("searchroomdetail")
	public ModelAndView searchroomdetail(int no, String start, String end, int people, String name,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Room r = service.selectOne(no, name);

		List<String> con = new ArrayList<String>();
		String[] sr = r.getConvenient().split(",");

		for (String sss : sr) {
			con.add(sss);
		}

		Hotel hotel = service.searchselectOne(no, start, end, people);

		int count = 0;
		for (Room r2 : hotel.getRoom()) {
			if (r2.getName().equals(name))
				count = r2.getRoomcount();
		}

		mav.addObject("convenient", con);
		mav.addObject("room", r);
		mav.addObject("startday", start);
		mav.addObject("endday", end);
		mav.addObject("people", people);
		mav.addObject("name", name);
		mav.addObject("count", count);
		mav.setViewName("hotel/roomdetail2");
		return mav;
	}

	@GetMapping("reservationForm")
	public ModelAndView reservationForm(Final f1) {
		ModelAndView mav = new ModelAndView();
		Final f = service.reservation(f1);
		int countpoint = service.countPoint(f1.getUserid());
		mav.addObject("countpoint", countpoint);
		mav.addObject("f", f);
		return mav;
	}

	@PostMapping("reservation")
	public ModelAndView reservation(Final f1) {
		ModelAndView mav = new ModelAndView();
		service.subFinally(f1);
		mav.addObject("msg", "예약 신청이 완료되었습니다.");
		mav.addObject("url", "../user/main.jeju");
		mav.setViewName("alert");
		return mav;
	}
	
	@PostMapping("allfinal")
	public ModelAndView allfinal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.allFinally(request);
		mav.setViewName("redirect:../admin/acceptlist.jeju");
		return mav;
	}
}
