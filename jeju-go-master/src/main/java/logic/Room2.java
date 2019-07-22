package logic;

import java.util.List;

public class Room2 {
	private int hno;
	private String hname;
	private String roomnum;
	private String name;
	private int max;
	private List<String> roomnums;

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public List<String> getRoomnums() {
		return roomnums;
	}

	public void setRoomnums(List<String> roomnums) {
		this.roomnums = roomnums;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Room2 [hno=" + hno + ", hname=" + hname + ", roomnum=" + roomnum + ", name=" + name + ", roomnums="
				+ roomnums + "]";
	}

}
