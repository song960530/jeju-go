package logic;

import java.util.List;

public class Room {
	private int hno;
	private String roomnum;
	private String name;
	private int price;
	private String convenient;
	private String bed;
	private int bedcount;
	private int max;
	List<Photo> photo;
	private String photourl;
	private int roomcount;

	public int getRoomcount() {
		return roomcount;
	}

	public void setRoomcount(int roomcount) {
		this.roomcount = roomcount;
	}

	public String getPhotourl() {
		return photourl;
	}

	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}

	public List<Photo> getPhoto() {
		return photo;
	}

	public void setPhoto(List<Photo> photo) {
		this.photo = photo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getConvenient() {
		return convenient;
	}

	public void setConvenient(String convenient) {
		this.convenient = convenient;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public int getBedcount() {
		return bedcount;
	}

	public void setBedcount(int bedcount) {
		this.bedcount = bedcount;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public String getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}

	@Override
	public String toString() {
		return "Room [hno=" + hno + ", roomnum=" + roomnum + ", name=" + name + ", price=" + price + ", convenient="
				+ convenient + ", bed=" + bed + ", bedcount=" + bedcount + ", max=" + max + ", photo=" + photo
				+ ", photourl=" + photourl + ", roomcount=" + roomcount + "]";
	}

}
