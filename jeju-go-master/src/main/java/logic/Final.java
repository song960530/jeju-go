package logic;

import java.util.Date;

public class Final {
	private int no;
	private int hno;
	private String name;
	private int pno;
	private int pnum;
	private String roomnum;
	private int total;
	private String userid;
	private String start;
	private String end;
	private String ehecked;
	private Date regdate;
	private int point;
	private Room room;
	private int day;
	private String username;

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

	public String getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
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

	public String getEhecked() {
		return ehecked;
	}

	public void setEhecked(String ehecked) {
		this.ehecked = ehecked;
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
		return "Finally [no=" + no + ", hno=" + hno + ", name=" + name + ", pno=" + pno + ", pnum=" + pnum
				+ ", roomnum=" + roomnum + ", total=" + total + ", userid=" + userid + ", start=" + start + ", end="
				+ end + ", ehecked=" + ehecked + ", regdate=" + regdate + ", point=" + point + "]";
	}

}
