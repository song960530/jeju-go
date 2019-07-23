package logic;

import java.util.Date;

public class Point {
	private String userid;
	private int point;
	private Date regdate;
	private String type;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Point [userid=" + userid + ", point=" + point + ", regdate=" + regdate + ", type=" + type + "]";
	}

}
