package controller;

import com.opencsv.CSVReader;

import exception.JejuException;
import logic.Final;
import logic.Hotel;
import logic.Hreserve;
import logic.JejuService;
import logic.Latlng;
import logic.Room;
import logic.Room2;
import logic.User;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.*;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		try {
			int hno = service.regist(request, mtfRequest);
			mav.setViewName("redirect:hoteldetail.jeju?no=" + hno);
		} catch (Exception e) {
			throw new JejuException("����� ������ �߻��߽��ϴ�.", "regist.jeju");
		}
		return mav;
	}

	@RequestMapping("hotellist")
	public ModelAndView hotellist() {
		ModelAndView mav = new ModelAndView();
		try {
			List<Hotel> list = service.list();
			mav.addObject("list", list);
		} catch (Exception e) {
			throw new JejuException("����Ʈ �ҷ����⸦ �����Ͽ����ϴ�", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping("adminhotellist")
	public ModelAndView adminhotellist() {
		ModelAndView mav = new ModelAndView();
		try {
			List<Hotel> list = service.list();
			mav.addObject("list", list);
		} catch (Exception e) {
			throw new JejuException("����Ʈ �ҷ����⸦ �����Ͽ����ϴ�", "../user/main.jeju");
		}
		return mav;
	}

	@GetMapping("hoteldetail")
	public ModelAndView detail(Integer no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("hotel/hoteldetail");
		try {
			if ((User) session.getAttribute("login") != null) {
				User user = (User) session.getAttribute("login");
				int w = service.selctwish(user.getUserid(), no);
				mav.addObject("w", w);
			}
			Hotel h = service.selectOne(no);
			List<Room> r = service.roomList(no);
			h.setRoom(r);
			ArrayList<Latlng> arr = null;
			String path = request.getSession().getServletContext().getRealPath("/") + "csv/cctv.csv";
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
			mav.addObject("cctv", arr);
			mav.addObject("room", r);
			mav.addObject("hotel", h);
		} catch (Exception e) {
			throw new JejuException("���������� �ҷ����⿡ �����Ͽ����ϴ�.", "../user/main.jeju");
		}
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
		try {
			service.regist2(room, request, mtfRequest);
			mav.setViewName("redirect:hoteldetail.jeju?no=" + room.getHno());
		} catch (Exception e) {
			throw new JejuException("�� ��Ͽ� �����Ͽ����ϴ�.", "roomregist.jeju");
		}
		return mav;
	}

	@GetMapping("roomdetail")
	public ModelAndView roomdetail(Integer hno, String name) {
		ModelAndView mav = new ModelAndView();
		try {
			Room r = service.selectOne(hno, name);

			List<String> con = new ArrayList<String>();
			String[] sr = r.getConvenient().split(",");

			for (String sss : sr) {
				con.add(sss);
			}

			mav.addObject("convenient", con);
			mav.addObject("room", r);
		} catch (Exception e) {
			throw new JejuException("�� �󼼺��� �������� �ҷ������� ������ �߻��Ͽ����ϴ�.", "hoteldetail.jeju?no=" + hno);
		}
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
		try {
			service.yesroom(hreserve, request);
			mav.addObject("msg", "����� �Ϸ�Ǿ����ϴ�.");
			mav.addObject("url", "hreserveform.jeju?hno=" + hreserve.getHno());
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("���డ�ɹ� ����� ������ �߻��Ͽ����ϴ�.", "hreserveform.jeju?hno=" + hreserve.getHno());
		}
		return mav;
	}

	@PostMapping("search")
	public ModelAndView serarch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Hotel> hotel = service.search(request);
			mav.addObject("list", hotel);
			mav.addObject("startday", request.getParameter("start"));
			mav.addObject("endday", request.getParameter("end"));
			mav.addObject("people", request.getParameter("people"));
			mav.setViewName("hotel/searchlist");
		} catch (Exception e) {
			throw new JejuException("�˻� ���� ������ �߻��Ͽ����ϴ�.", "../user/main.jeju");
		}
		return mav;
	}

	@GetMapping("searchhoteldetail")
	public ModelAndView searchhoteldetail(int no, String start, String end, int people, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			Hotel hotel = service.searchselectOne(no, start, end, people);
			ArrayList<Latlng> arr = null;
			String path = request.getSession().getServletContext().getRealPath("/") + "csv/cctv.csv";
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
			mav.addObject("cctv", arr);
			mav.addObject("hotel", hotel);
			mav.addObject("startday", start);
			mav.addObject("endday", end);
			mav.addObject("people", people);

			mav.setViewName("hotel/hoteldetail2");
		} catch (Exception e) {
			throw new JejuException("ȣ�� �󼼺��⸦ �ҷ����� �� ������ �߻��Ͽ����ϴ�.", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping("searchroomdetail")
	public ModelAndView searchroomdetail(int no, String start, String end, int people, String name,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
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
		} catch (Exception e) {
			throw new JejuException("�� �󼼺��� �������� �ҷ����� �� ������ �߻��Ͽ����ϴ�.",
					"searchhoteldetail.jeju?no=" + no + "&start=" + start + "&end=" + end + "&people=" + people);
		}
		return mav;
	}

	@GetMapping("reservationForm")
	public ModelAndView lcheckreservationForm(Final f1, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			Final f = service.reservation(f1);
			int countpoint = service.countPoint(f1.getUserid());
			mav.addObject("countpoint", countpoint);
			mav.addObject("f", f);
		} catch (Exception e) {
			throw new JejuException("������������ �ҷ����� �� ������ �߻��Ͽ����ϴ�.", "searchroomdetail.jeju?no=" + f1.getHno() + "&start="
					+ f1.getStart() + "&end=" + f1.getEnd() + "&people=" + f1.getPnum() + "&name=" + f1.getName());
		}
		return mav;
	}

	@PostMapping("reservation")
	public ModelAndView lcheckreservation(Final f1, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			service.subFinally(f1);
			mav.addObject("msg", "���� ��û�� �Ϸ�Ǿ����ϴ�.");
			mav.addObject("url", "../user/main.jeju");
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("���� ��û�� ������ �߻��Ͽ����ϴ�.", "searchroomdetail.jeju?no=" + f1.getHno() + "&start="
					+ f1.getStart() + "&end=" + f1.getEnd() + "&people=" + f1.getPnum() + "&name=" + f1.getName());
		}
		return mav;
	}

	@RequestMapping("allfinal")
	public ModelAndView allfinal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			service.allFinally(request);
			mav.setViewName("redirect:../admin/acceptlist.jeju");
		} catch (Exception e) {
			throw new JejuException("���� ������ ������ �߻��Ͽ����ϴ�.", "../admin/acceptlist.jeju");
		}
		return mav;
	}

	@RequestMapping("deleteForm")
	public ModelAndView deleteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			String name = request.getParameter("name");
			int hno = Integer.parseInt(request.getParameter("hno"));
			int count;
			if (name == null || name.trim().equals("")) {
				count = service.deleteForm(request);
			} else {
				count = service.roomdeleteForm(request);
				mav.addObject("name", request.getParameter("name"));

			}
			if (count != 0) {
				mav.addObject("msg", request.getParameter("today") + "����<br> ����� ������ ��ȸ�Ǿ� ������ �Ұ����մϴ�.");
			}
			mav.addObject("today", request.getParameter("today"));
			mav.addObject("hno", hno);
		} catch (Exception e) {
			throw new JejuException("ȣ�� ������ ������ �߻��Ͽ����ϴ�.", "../admin/adminhotellist.jeju");
		}
		return mav;
	}

	@RequestMapping("hoteldelete")
	public ModelAndView hoteldelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String name = request.getParameter("name");
		try {
			service.hoteldelete(request);
			if (name == null || name.trim().equals("")) {
				mav.addObject("msg", "���Ұ� ���������� �����Ǿ����ϴ�.");
				mav.addObject("url", "adminhotellist.jeju");
			} else {
				mav.addObject("msg", "���� ���������� �����Ǿ����ϴ�.");
				mav.addObject("url", "roomdeleteForm.jeju?no=" + Integer.parseInt(request.getParameter("hno")));
			}
			mav.setViewName("alert");
		} catch (Exception e) {
			throw new JejuException("ȣ�� ������ ������ �߻��Ͽ����ϴ�.", "adminhotellist.jeju");
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

	@GetMapping("roomdeleteForm")
	public ModelAndView roomdeleteForm(Integer no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			Hotel h = service.selectOne(no);
			List<Room> r = service.roomList(no);
			h.setRoom(r);
			mav.addObject("room", r);
			mav.addObject("hotel", h);
		} catch (Exception e) {
			throw new JejuException("���������� �ҷ����⿡ �����Ͽ����ϴ�.", "../user/main.jeju");
		}
		return mav;
	}

	@RequestMapping("allcancle")
	public ModelAndView allcancle(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User login = (User) session.getAttribute("login");
		try {
			String checked = service.allcancle(request, session);
			if (!login.getUserid().equals("admin")) {
				if (checked.equals("���δ��")) {
					mav.addObject("msg", "��Ұ� �Ϸ� �Ǿ����ϴ�.");
				} else if (checked.equals("���οϷ�")) {
					mav.addObject("msg", "�ش��ǰ ��� ��û�� �Ǿ����ϴ�.");
				}
				mav.addObject("url", "../user/history.jeju?userid=" + request.getParameter("userid"));
			} else {
				mav.addObject("msg", "��Ұ� �Ϸ� �Ǿ����ϴ�.");
				mav.addObject("url", "../admin/acceptlist.jeju");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new JejuException("��������� ������ �߻��Ͽ����ϴ�", "../admin/acceptlist.jeju");
		}
		mav.setViewName("alert");
		return mav;
	}

}