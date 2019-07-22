package logic;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	@NotEmpty(message = "����� ���̵�� �ʼ� �Դϴ�.")
	private String userid;
	@NotEmpty(message = "����� �̸��� �ʼ� �Դϴ�.")
	private String username;
	@NotEmpty(message = "��й�ȣ�� �Է����ּ���.")
	private String password;
	@NotEmpty(message = "�ڵ�����ȣ�� �Է����ּ���")
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
