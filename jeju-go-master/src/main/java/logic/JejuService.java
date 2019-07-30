package logic;

import dao.*;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired
	PackageDao packagedao;
	@Autowired
	FinalDao finaldao;

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
			String originFileName = mf.getOriginalFilename();
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

	private void uploadPackPhoto(int no, String roomnum, String type, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("photoname");

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/") + "img/";
			String safeFile = path + System.currentTimeMillis() + originFileName;

			Package pack = new Package();
			pack.setPhotourl(safeFile.substring(safeFile.lastIndexOf("img/")));
			pack.setPhotoname(originFileName);

			File fpath = new File(path);
			if (!fpath.exists()) {
				fpath.mkdirs();
			}
			try {
				mf.transferTo(new File(safeFile));
				packagedao.insert(pack);
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
		if (p != null) {
			r.setPhoto(p);
		} else {
			r.setPhoto(null);
		}
		if (p.get(0).getPhotourl() != null) {
			r.setPhotourl(p.get(0).getPhotourl());
		} else {
			r.setPhotourl(null);
		}
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
			hash = md.digest(plain);
			for (byte b : hash) {
				result += String.format("%02X", b);
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
			hash = md.digest(plain);
			for (byte b : hash) {
				result += String.format("%02X", b);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		userdao.getNewPwd(result, userid);
	}

	public void update(User user) {
		userdao.update(user);
	}

	public List<User> userList(Integer pageNum, int limit, HttpServletRequest request) {
		String d = request.getParameter("delete");
		if (d == null || d.trim().equals("")) {
			d = null;
		}
		List<User> list = userdao.list(d, pageNum, limit);
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

	public String MessageDigest(String password) {
		byte[] hash = null;
		String result = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			hash = md.digest(password.getBytes());
			for (byte b : hash) {
				result += String.format("%02X", b);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void DeleteRequest(User user) {
		userdao.deleterequest(user);
	}

	public void admindelete(User user) {
		userdao.admindelete(user);
	}

	public void updatepw(User user) {
		userdao.updatepw(user);
	}

	public Final reservation(Final f) {
		Calendar calendar = Calendar.getInstance();
		Room r = selectOne(f.getHno(), f.getName());
		f.setRoom(r);
		f.setHname(selectOne(f.getHno()).getHname());
		int stmon = Integer.parseInt(f.getStart().split("-")[1]);
		int enmon = Integer.parseInt(f.getEnd().split("-")[1]);
		int startday = Integer.parseInt(f.getStart().split("-")[2]);
		int endday = Integer.parseInt(f.getEnd().split("-")[2]);
		calendar.set(Integer.parseInt(f.getStart().split("-")[0]), stmon - 1, 1);
		int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		if (stmon == enmon) {
			f.setDay(endday - startday + 1);
		} else {
			f.setDay(lastday - startday + endday + 1);
		}
		return f;
	}

	public Point getPoint(String userid) {
		return userdao.getPoint(userid);
	}

	public int countPoint(String userid) {
		return userdao.countPoint(userid);
	}

	public List<Board> boardlist(Integer pageNum, int limit, int type, int no) {
		return boarddao.boardlist(pageNum, limit, type, no);
	}

	public Board qnablist(Integer no) {
		return boarddao.qnablist(no);
	}

	public List<Board> qnalist(Integer pageNum, int limit, int type, String userid, Integer type2) {
		return boarddao.qnalist(pageNum, limit, type, userid, type2);
	}

	public int count(int type, String userid, Integer type2) {
		return boarddao.count(type, userid, type2);
	}

	public int qnacount(Integer no) {
		return boarddao.qnacount(no);
	}

	public Board qnarlist(Integer no, int reflevel) {
		return boarddao.qnarlist(no, reflevel);
	}

	public void reply(Board board, HttpServletRequest request) {
		boarddao.updaterefstep(board);
		int num = boarddao.maxnum();
		board.setNo(++num);
		board.setReflevel(board.getReflevel() + 1);
		board.setRefstep(board.getRefstep() + 1);
		boarddao.noticewrite(board);
	}

	public String getUser(String userid) {
		return boarddao.getUser(userid);
	}

	public List<Board> list(Integer pageNum, int limit, int type) {
		return boarddao.list(pageNum, limit, type);
	}

	public List<Board> adqnalist(Integer pageNum, int limit, int type, Integer type2) {
		return boarddao.adqnalist(pageNum, limit, type, type2);
	}

	public int count(int type, Integer type2) {
		return boarddao.count(type, type2);
	}

	public int packregist(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		Package pack = new Package();
		pack.setNo(packagedao.maxno() + 1);
		pack.setName(request.getParameter("name"));
		pack.setContent(request.getParameter("content"));
		pack.setPrice(Integer.parseInt(request.getParameter("price")));
		pack.setTravelday(request.getParameter("travelday"));
		pack.setStartday(request.getParameter("startday"));
		pack.setMon(Integer.parseInt(request.getParameter("mon")));
		pack.setMax(Integer.parseInt(request.getParameter("max")));
		pack.setChk(request.getParameter("chk"));
		List<MultipartFile> fileList = mtfRequest.getFiles("photoname");
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/") + "img/";
			String safeFile = path + System.currentTimeMillis() + originFileName;

			pack.setPhotourl(safeFile.substring(safeFile.lastIndexOf("img/")));
			pack.setPhotoname(originFileName);

			File fpath = new File(path);
			if (!fpath.exists()) {
				fpath.mkdirs();
			}
			try {
				mf.transferTo(new File(safeFile));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		packagedao.packregist(pack);
		return pack.getNo();
	}

	public List<Package> packlist() {
		return packagedao.packlist();
	}

	public Package getPack(Integer no) {
		return packagedao.getPack(no);
	}

	public List<Package> packday(Integer no) {
		return packagedao.packday(no);
	}

	public void wish(String userid, int no) {
		userdao.insert(userid, no);
	}

	public void replydelete(Board board) {
		boarddao.replydelete(board);
	}

	public void subFinally(Final f1) {
		f1.setNo(finaldao.maxno() + 1);
		f1.setRno(hresdao.delayRoomnum(f1));
		finaldao.insert(f1);

		Calendar calendar = Calendar.getInstance();
		int stmon = Integer.parseInt(f1.getStart().split("-")[1]);
		int enmon = Integer.parseInt(f1.getEnd().split("-")[1]);
		int startday = Integer.parseInt(f1.getStart().split("-")[2]);
		int endday = Integer.parseInt(f1.getEnd().split("-")[2]);
		calendar.set(Integer.parseInt(f1.getStart().split("-")[0]), stmon - 1, 1);
		int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		int rno = f1.getRno();

		if (stmon == enmon) {
			for (int i = startday; i <= endday; i++)
				hresdao.insertdelayRoom(rno++);
		} else {
			for (int i = stmon; i <= enmon; i++) {
				if (i == stmon) {
					for (int j = startday; j <= lastday; j++) {
						hresdao.insertdelayRoom(rno++);
					}
				} else {
					for (int j = 1; j <= endday; j++) {
						hresdao.insertdelayRoom(rno++);
					}
				}
			}
		}

		if (f1.getPoint() != 0) {
			int no = userdao.pointmaxno() + 1;
			userdao.point(no, f1.getUserid(), f1.getPoint(), "사용");
		}
	}

	public List<Final> acceptList() {
		return finaldao.acceptList();
	}

	public List<String> roomnums(Final f) {
		List<String> roomnums = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
		int stmon = Integer.parseInt(f.getStart().split("-")[1]);
		int enmon = Integer.parseInt(f.getEnd().split("-")[1]);
		int startday = Integer.parseInt(f.getStart().split("-")[2]);
		int endday = Integer.parseInt(f.getEnd().split("-")[2]);
		calendar.set(Integer.parseInt(f.getStart().split("-")[0]), stmon - 1, 1);
		int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		if (stmon == enmon) {
			roomnums = hresdao.selectRooms(f.getHno(), f.getName(), stmon, startday, endday);
		} else {
			roomnums = hresdao.selectRooms2(f.getHno(), f.getName(), stmon, startday, lastday, enmon, endday);
		}
		return roomnums;
	}

	public void allFinally(HttpServletRequest request) {
		// hno, rno, day roomnum start end
		int no = Integer.parseInt(request.getParameter("no"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		if (pno == 0) {
			int hno = Integer.parseInt(request.getParameter("hno"));
			int rno = Integer.parseInt(request.getParameter("rno"));
			int day = Integer.parseInt(request.getParameter("day"));
			int stmon = Integer.parseInt(request.getParameter("start").split("-")[1]);
			int startday = Integer.parseInt(request.getParameter("start").split("-")[2]);
			String name = request.getParameter("name");
			String roomnum = request.getParameter("roomnum").split("호")[0];
			String username = request.getParameter("username");

			for (int i = rno; i <= rno + day; i++) {
				hresdao.nullRoomnum(i);
			}

			int rno2 = hresdao.selectno(hno, roomnum, stmon, startday, name);

			for (int i = rno2; i < rno2 + day; i++) {
				hresdao.insertfinish(i, username);
			}

			finaldao.finish(no, roomnum, rno2);
			int point = (int) (finaldao.selectTotal(no) * 0.05);
			String userid = request.getParameter("userid");
			int pointno = userdao.pointmaxno() + 1;
			finaldao.setPoint(point, userid, pointno);
		} else {
			finaldao.Pfinish(no, pno);
			int point = (int) (finaldao.selectTotal(no) * 0.05);
			String userid = request.getParameter("userid");
			int pointno = userdao.pointmaxno() + 1;
			finaldao.setPoint(point, userid, pointno);
		}
	}

	public Final setFinal(Final f, HttpServletRequest request) {
		f.setNo(finaldao.maxno() + 1);
		f.setPno(Integer.parseInt(request.getParameter("pno")));
		f.setTotal(Integer.parseInt(request.getParameter("total")));
		f.setPoint(Integer.parseInt(request.getParameter("point")));
		f.setName(request.getParameter("name"));
		f.setUserid(request.getParameter("userid"));
		f.setUsername(request.getParameter("username"));
		String year = request.getParameter("year");
		String mon = request.getParameter("mon");
		if (Integer.parseInt(request.getParameter("mon")) < 10) {
			mon = 0 + request.getParameter("mon");
		} else {
			mon = request.getParameter("mon");
		}
		String start = null;
		if (Integer.parseInt(request.getParameter("startday")) < 10) {
			start = 0 + request.getParameter("startday");
		} else {
			start = request.getParameter("startday");
		}
		f.setStart(year + "-" + mon + "-" + start);
		String end = null;
		if (Integer.parseInt(request.getParameter("endday")) < 10) {
			end = 0 + request.getParameter("endday");
		} else {
			end = request.getParameter("endday");
		}
		f.setEnd(year + "-" + mon + "-" + end);
		f.setDay(Integer.parseInt(request.getParameter("travelday")));
		f.setPnum(Integer.parseInt(request.getParameter("max")));

		return f;
	}

	public void realFinal(Final fi) {
		if (fi.getPoint() != 0) {
			int no = userdao.pointmaxno() + 1;
			userdao.point(no, fi.getUserid(), fi.getPoint(), "사용");
		}
		finaldao.realFinal(fi);
	}

	public void setPoint(int point, String userid) {
		int no = userdao.pointmaxno() + 1;
		finaldao.setPoint(point, userid, no);
	}

	public void minermax(Package pack, HttpServletRequest request) {
		int pnum = Integer.parseInt(request.getParameter("people"));
		packagedao.minermax(pack, pnum);
	}

	public int getPeople(String startday, Integer no) {
		return packagedao.getPeople(startday, no);
	}

	public void packdelete(Integer no) {
		packagedao.packdelete(no);
	}

	public int finalcount(Integer no, String userid) {
		return finaldao.finalcount(no, userid);
	}

	public List<Final> reservationmanagement(Integer pageNum, int limit) {
		return finaldao.reservationmanagement(pageNum, limit);
	}

	public int reservationcount() {
		return finaldao.reservationcount();
	}

	public int deleteForm(HttpServletRequest request) {
		int hno = Integer.parseInt(request.getParameter("hno"));
		int stmon = Integer.parseInt(request.getParameter("today").split("-")[1]);
		int today = Integer.parseInt(request.getParameter("today").split("-")[2]);
		return hresdao.deleteForm(hno, stmon, today);
	}

	public void hoteldelete(HttpServletRequest request) {
		int hno = Integer.parseInt(request.getParameter("hno"));
		String name = request.getParameter("name");
		if (name == null || name.trim().equals("")) {
			hoteldao.hoteldelete(hno);
			roomdao.roomdelete(hno);
			photodao.photodelete(hno);
			hresdao.hoteldelete(hno);
		} else {
			roomdao.roomdelete2(hno, name);
			photodao.photodelete2(hno, name);
			hresdao.hoteldelete2(hno, name);
		}
	}

	public int roomdeleteForm(HttpServletRequest request) {
		int hno = Integer.parseInt(request.getParameter("hno"));
		int stmon = Integer.parseInt(request.getParameter("today").split("-")[1]);
		int today = Integer.parseInt(request.getParameter("today").split("-")[2]);
		String name = request.getParameter("name");
		return hresdao.roomdeleteForm(hno, stmon, today, name);
	}

	public String allcancle(HttpServletRequest request, HttpSession session) {
		int no = Integer.parseInt(request.getParameter("no"));
		int point = finaldao.selectPoint(no);
		Final f = finaldao.selectOne(no);
		int rno = Integer.parseInt(request.getParameter("rno"));
		int day = Integer.parseInt(request.getParameter("day"));
		User login = (User) session.getAttribute("login");

		if (login.getUserid().equals("admin")) {
			finaldao.cancle(no);

			if (rno != 0) {
				for (int i = rno; i <= rno + day - 1; i++)
					hresdao.nullRoomnum(i);
			}

			if (point != 0) {
				String userid = request.getParameter("userid");
				int pointno = userdao.pointmaxno() + 1;
				finaldao.setPoint(point, userid, pointno);
			}

			if (f.getChecked().equals("승인완료") || f.getChecked().equals("취소신청")) {
				int point2 = (int) (finaldao.selectTotal(no) * 0.05);
				String userid = request.getParameter("userid");
				int pointno = userdao.pointmaxno() + 1;
				finaldao.backPoint(point2, userid, pointno);
			}

		} else if (!login.getUserid().equals("admin") && f.getChecked().equals("승인대기")) {
			finaldao.cancle(no);
			if (rno != 0) {
				for (int i = rno; i <= rno + day - 1; i++)
					hresdao.nullRoomnum(i);
			}
			if (point != 0) {
				String userid = request.getParameter("userid");
				int pointno = userdao.pointmaxno() + 1;
				finaldao.setPoint(point, userid, pointno);
			}
		} else {
			finaldao.pleasecancle(no);
		}

		return f.getChecked();
	}

	public void wishBtn(String userid, int no) {
		userdao.insert(userid, no);
	}

	public User idchk(User user) {
		return userdao.idchk(user);
	}

	public List<Final> history(String userid) {
		return finaldao.history(userid);
	}

	public List<Final> cancellationl(String userid) {
		return finaldao.cancellationl(userid);
	}

	public List<Integer> noSelect(String userid) {
		List<Integer> no = userdao.nolist(userid);
		return no;
	}

	public List<Hotel> wihslist(List<Integer> no) {
		List<Hotel> hotel = new ArrayList<Hotel>();
		for (Integer i : no) {
			hotel.add(selectOne(i));
		}
		return hotel;
	}

	public void deletewish(String userid, int no) {
		userdao.deletewish(userid, no);
	}

	public int selctwish(String userid, Integer no) {
		return hoteldao.selectwish(userid, no);
	}

	public int usercount() {
		return userdao.usercount();
	}

	public int acceptcount() {
		return finaldao.acceptcount();
	}
}