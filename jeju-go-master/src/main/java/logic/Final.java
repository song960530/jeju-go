package logic;

import java.util.Date;
import java.util.List;

public class Final {
	private int no;
	private int hno;
	private String name;
	private int pno;
	private int pnum;
	private int rno;
	private int total;
	private String userid;
	private String start;
	private String end;
	private String checked;
	private Date regdate;
	private int point;
	private Room room;
	private int day;
	private String username;
	private String hname;
	private String roomnum;
	private List<String> roomnums;
	private String reviewchk;

	public String getReviewchk() {
		return reviewchk;
	}

	public void setReviewchk(String reviewchk) {
		this.reviewchk = reviewchk;
	}

	public List<String> getRoomnums() {
		return roomnums;
	}

	public void setRoomnums(List<String> roomnums) {
		this.roomnums = roomnums;
	}

	public String getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Final [no=" + no + ", hno=" + hno + ", name=" + name + ", pno=" + pno + ", pnum=" + pnum + ", rno="
				+ rno + ", total=" + total + ", userid=" + userid + ", start=" + start + ", end=" + end + ", checked="
				+ checked + ", regdate=" + regdate + ", point=" + point + ", room=" + room + ", day=" + day
				+ ", username=" + username + ", hname=" + hname + ", roomnum=" + roomnum + "]";
	}

}
