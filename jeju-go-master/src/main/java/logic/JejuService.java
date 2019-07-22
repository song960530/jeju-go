package logic;

import dao.*;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class JejuService {
	@Autowired
	HotelDao hoteldao;
	@Autowired
	PhotoDao photodao;
	@Autowired
	RoomDao roomdao;
	@Autowired
	UserDao userdao;
	@Autowired
	HreserveDao hresdao;
	@Autowired
	BoardDao boarddao;

	public int regist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		Hotel h = new Hotel();
		String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-"
				+ request.getParameter("tel3");
		h.setNo(hoteldao.maxno() + 1);
		h.setAddress(request.getParameter("address"));
		h.setLat(request.getParameter("lat"));
		h.setLng(request.getParameter("lng"));
		h.setHname(request.getParameter("hname"));
		h.setTel(tel);
		h.setContent(request.getParameter("contents"));
		if (hoteldao.insert(h)) {
			uploadPhoto(h.getNo(), "0", "", request, mtfRequest);
		}
		return h.getNo();
	}

	private void uploadPhoto(int hno, String roomnum, String type, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("photoname");

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			String path = request.getServletContext().getRealPath("/") + "img/";
			String safeFile = path + System.currentTimeMillis() + originFileName;

			Photo p = new Photo();
			p.setNo(photodao.maxno() + 1);
			p.setHno(hno);
			p.setRoomnum(roomnum);
			p.setType(type);
			p.setPhotourl(safeFile.substring(safeFile.lastIndexOf("img/")));
			p.setPhotoname(originFileName);

			File fpath = new File(path);
			if (!fpath.exists()) {
				fpath.mkdirs();
			}
			try {
				mf.transferTo(new File(safeFile));
				photodao.insert(p);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public List<Hotel> list() {
		List<Hotel> hotel = new ArrayList<Hotel>();
		List<Integer> no = hoteldao.nolist();

		for (Integer i : no) {
			hotel.add(selectOne(i));
		}
		return hotel;
	}

	public Hotel selectOne(Integer i) {
		Hotel h = hoteldao.selectOne(i);
		List<Photo> p = photodao.selectOne2(i, "0");
		h.setPhotourl(p.get(0).getPhotourl());
		h.setPhoto(p);
		return h;
	}

	public void regist2(Room room, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		if (roomdao.insert(room)) {
			uploadPhoto(room.getHno(), room.getRoomnum(), room.getName(), request, mtfRequest);
		}
	}

	public List<Room> roomList(Integer no) {
		List<Room> room = new ArrayList<Room>();
		List<Room> r = roomdao.selectList(no);

		for (Room i : r) {
			room.add(selectOne(i.getHno(), i.getName()));
		}

		return room;
	}

	public Room selectOne(Integer hno, String name) {
		Room r = roomdao.selectOne(hno, name);
		List<Photo> p = photodao.selectOne3(hno, name);
		r.setPhoto(p);
		r.setPhotourl(p.get(0).getPhotourl());
		return r;
	}

	public void userCreate(User user) {
		String password = messageDigest(user.getPassword());
		user.setPassword(password);
		// user.setEmail(encrypt(user.getEmail(),user.getPassword()));
		userdao.insert(user);
	}

	public String messageDigest(String password) {
		byte[] plain = password.getBytes();
		byte[] hash = null;
		String result = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			hash = md.digest(plain);// 해쉬암호 생성
			for (byte b : hash) {
				result += String.format("%02X", b); // 핵사값으로 출력(16진수)
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User userSelect(String userId) {
		return userdao.selectOne(userId);
	}

	public User useridcheck(User user) {
		return userdao.useridcheck(user);
	}

	public String random() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		while (sb.toString().length() < 6) {
			num = ran.nextInt(75) + 48; // 48 ~ 122
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			}
		}
		return sb.toString();
	}

	public void getNewPwd(String ran, String userid) {
		byte[] plain = ran.getBytes();
		byte[] hash = null;
		String result = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			hash = md.digest(plain);// 해쉬암호 생성
			for (byte b : hash) {
				result += String.format("%02X", b); // 핵사값으로 출력(16진수)
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		userdao.getNewPwd(result, userid);
	}

	public void update(User user) {
		userdao.update(user);
	}

	public List<User> userList(HttpServletRequest request) {
		String d = request.getParameter("delete");
		if (d == null || d.trim().equals("")) {
			d = null;
		}
		List<User> list = userdao.list(d);
		return list;
	}

	public void Delete(String id) {
		userdao.delete(id);
	}

	public List<Room2> selectRoom2(Integer hno) {
		return roomdao.selectRoom2(hno);
	}

	public void yesroom(Hreserve hreserve, HttpServletRequest request) {
		Calendar calendar = Calendar.getInstance();

		String starts[] = request.getParameter("startday").split("-");
		String ends[] = request.getParameter("endday").split("-");
		int year = Integer.parseInt(request.getParameter("startday").split("-")[0]);
		int stmon = Integer.parseInt(starts[1]);
		int enmon = Integer.parseInt(ends[1]);
		int start = Integer.parseInt(starts[2]);
		int end = Integer.parseInt(ends[2]);
		int max = Integer.parseInt(request.getParameter("max"));
		int month = stmon - 1;
		calendar.set(year, month, 1);
		int lastday;

		if (stmon == enmon) {
			for (int i = start; i <= end; i++) {
				hreserve.setNo(hresdao.maxno() + 1);
				hreserve.setMon(stmon);
				hreserve.setDay(i);
				hreserve.setMax(max);
				hresdao.insert(hreserve);
			}
		} else {
			for (int i = stmon; i <= enmon; i++)
				if (i == stmon) {
					calendar.set(year, i - 1, 1);
					lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
					for (int j = start; j <= lastday; j++) {
						hreserve.setNo(hresdao.maxno() + 1);
						hreserve.setMon(i);
						hreserve.setDay(j);
						hreserve.setMax(max);
						hresdao.insert(hreserve);
					}

				} else if (i != enmon) {
					calendar.set(year, i - 1, 1);
					lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
					for (int j = 1; j <= lastday; j++) {
						hreserve.setNo(hresdao.maxno() + 1);
						hreserve.setMon(i);
						hreserve.setDay(j);
						hreserve.setMax(max);
						hresdao.insert(hreserve);
					}

				} else if (i == enmon) {
					for (int j = 1; j < end; j++) {
						hreserve.setNo(hresdao.maxno() + 1);
						hreserve.setMon(i);
						hreserve.setDay(j);
						hreserve.setMax(max);
						hresdao.insert(hreserve);
					}

				}

		}
	}

	public List<Hotel> search(HttpServletRequest request) {
		Calendar calendar = Calendar.getInstance();

		int year = Integer.parseInt(request.getParameter("start").split("-")[0]);
		int stmon = Integer.parseInt(request.getParameter("start").split("-")[1]);
		int enmon = Integer.parseInt(request.getParameter("end").split("-")[1]);
		int month = stmon - 1;
		calendar.set(year, month, 1);
		int startday = Integer.parseInt(request.getParameter("start").split("-")[2]);
		int endday = Integer.parseInt(request.getParameter("end").split("-")[2]);
		int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int countday;
		int countday2;

		int people = Integer.parseInt(request.getParameter("people"));
		List<Hreserve> hr = null;
		List<Hotel> h = new ArrayList<Hotel>();
		Set<Integer> s = new HashSet<Integer>();
		if (stmon == enmon) {
			countday = (endday - startday + 1);
			hr = hresdao.searchroom(stmon, startday, endday, countday, people);
		} else {
			countday = lastday - startday + 1;
			countday2 = endday;
			hr = hresdao.searchroom2(stmon, enmon, startday, lastday, endday, countday, countday2, people);
		}

		for (Hreserve hr2 : hr) {
			s.add(hr2.getHno());
		}
		for (Integer s2 : s) {
			h.add(selectOne(s2));
		}
		for (Hotel h2 : h) {
			for (Hreserve hr2 : hr) {
				if (h2.getNo() == hr2.getHno()) {
					Room r = selectOne(hr2.getHno(), hr2.getName());
					if (h2.getMinprice() > r.getPrice())
						h2.setMinprice(r.getPrice());
				}
			}
		}
		return h;
	}

	public Hotel searchselectOne(Integer hno, String start, String end, Integer people1) {
		Calendar calendar = Calendar.getInstance();
		Hotel h = selectOne(hno);
		h.setRoom(roomList(hno));

		int year = Integer.parseInt(start.split("-")[0]);
		int stmon = Integer.parseInt(start.split("-")[1]);
		int enmon = Integer.parseInt(end.split("-")[1]);
		int month = stmon - 1;
		calendar.set(year, month, 1);
		int startday = Integer.parseInt(start.split("-")[2]);
		int endday = Integer.parseInt(end.split("-")[2]);
		int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int countday;
		int countday2;
		int people = people1;

		List<Hreserve> hr;
		if (stmon == enmon) {
			countday = (endday - startday + 1);
			hr = hresdao.searchroom(stmon, startday, endday, countday, people);
		} else {
			countday = lastday - startday + 1;
			countday2 = endday;
			hr = hresdao.searchroom2(stmon, enmon, startday, lastday, endday, countday, countday2, people);
		}

		for (Room r2 : h.getRoom()) {
			for (Hreserve hr2 : hr) {
				if (r2.getHno() == hr2.getHno() && r2.getName().equals(hr2.getName()))
					r2.setRoomcount(r2.getRoomcount() + 1);
			}
		}
		return h;
	}

	public User check(User user) {
		return userdao.check(user);
	}

	public int boardcount(int type) {
		return boarddao.boardcount(type);
	}

	public List<Board> boardlist(Integer pageNum, int limit, int type) {
		return boarddao.boardlist(pageNum, limit, type);
	}

	public Board getBoard(Integer No, HttpServletRequest request) {
		return boarddao.selectone(No);
	}

	public void noticewrite(Board board, HttpServletRequest request) {
		int num = boarddao.maxnum();
		board.setNo(++num);
		board.setRef(num);
		boarddao.noticewrite(board);
	}

	public void noticeupdate(Board board) {
		boarddao.noticeupdate(board);
	}

	public void noticedelete(Board board) {
		boarddao.noticedelete(board);
	}
}
