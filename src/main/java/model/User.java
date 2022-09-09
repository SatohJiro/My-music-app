package model;

import java.sql.Date;
import java.util.List;

public class User {
	private String nameUser;
	private String password;
	private String email;
	private boolean gender;
	private Date birthday;
	private String phone;
	private String address;
	private String name;
	private String avatar;
	private boolean role;
	private List<Playlist> playlists;

	public User(String nameUser, String password, String email, boolean gender, Date birthday, String phone,
			String address, String name, String avatar, boolean role) {
		this.nameUser = nameUser;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.name = name;
		this.avatar = avatar;
		this.role = role;
	}

	public User() {
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public String getBirthdayS() {
		return getBirthday().toString();
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public List<Playlist> getPlaylists() {
		return playlists;
	}

	public void setPlaylists(List<Playlist> playlists) {
		this.playlists = playlists;
	}

	public boolean isRole() {
		return role;
	}

	public String getStringRole() {
		if (role)
			return "true";
		else
			return "false";
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [nameUser=" + nameUser + ", password=" + password + ", email=" + email + ", gender=" + gender
				+ ", birthday=" + birthday + ", phone=" + phone + ", address=" + address + ", name=" + name
				+ ", avatar=" + avatar + ", role=" + role + ", playlists=" + playlists + "]";
	}

}
