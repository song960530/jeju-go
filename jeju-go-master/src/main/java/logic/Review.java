package logic;

public class Review {
	private int no;
	private int hno;
	private String roomnum;
	private int pno;
	private String userid;
	private String name;
	private String content;
	private int sepoint;

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

	public String getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSepoint() {
		return sepoint;
	}

	public void setSepoint(int sepoint) {
		this.sepoint = sepoint;
	}

	@Override
	public String toString() {
		return "Review [hno=" + hno + ", roomnum=" + roomnum + ", pno=" + pno + ", userid=" + userid + ", name=" + name
				+ ", content=" + content + ", sepoint=" + sepoint + "]";
	}

}
