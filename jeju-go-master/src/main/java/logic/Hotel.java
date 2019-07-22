package logic;

import java.util.List;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Hotel {

	private int no;
	@Size(min = 1, max = 10, message = "숙소명은 1자 이상 10자 이하로 입력하세요")
	@NotEmpty(message = "사용자 이름은 필수 입니다.")
	private String hname;
	@NotEmpty(message = "숙소명을 입력해주세요.")
	private String address;
	@NotEmpty(message = "위도를 입력해주세요")
	private String lat;
	@NotEmpty(message = "경도를 입력해주세요")
	private String lng;
	@NotEmpty(message = "숙소 정보를 입력해주세요")
	private String content;
	@NotEmpty(message = "숙소 전화번호를 입력해주세요")
	private String tel;
	private String photourl;
	private List<Photo> photo;
	private List<Room> room;
	private int minprice=9999999;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public List<Room> getRoom() {
		return room;
	}

	public void setRoom(List<Room> room) {
		this.room = room;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

}
