package com.kh.jd.account;

public class Manager {
	private int manager_number;
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;

	

	@Override
	public String toString() {
		return "Manager [manager_number=" + manager_number + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public int getManager_number() {
		return manager_number;
	}

	public void setManager_number(int manager_number) {
		this.manager_number = manager_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
