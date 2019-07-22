package logic;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	@NotEmpty(message = "사용자 아이디는 필수 입니다.")
	private String userid;
	@NotEmpty(message = "사용자 이름은 필수 입니다.")
	private String username;
	@NotEmpty(message = "비밀번호를 입력해주세요.")
	private String password;
	@NotEmpty(message = "핸드폰번호를 입력해주세요")
	private String phone;
	private String deleterequest;
	public String getDeleterequest() {
		return deleterequest;
	}

	public void setDeleterequest(String deleterequest) {
		this.deleterequest = deleterequest;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", deleterequest=" + deleterequest + "]";
	}

}
