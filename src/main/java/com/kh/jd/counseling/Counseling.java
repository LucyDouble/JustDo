package com.kh.jd.counseling;

import java.util.Arrays;

import org.springframework.stereotype.Component;


@Component
public class Counseling {

	private int counseling_no;
	private int manager_number;
	private String manager_name;
	private String counseling_name;
	private String counseling_phone;
	private String counseling_email;
	private String counseling_date;
	private String clock;
	private int [] cnoList;
	private int rnum;
	
	@Override
	public String toString() {
		return "Counseling [counseling_no=" + counseling_no + ", manager_number=" + manager_number + ", manager_name="
				+ manager_name + ", counseling_name=" + counseling_name + ", counseling_phone=" + counseling_phone
				+ ", counseling_email=" + counseling_email + ", counseling_date=" + counseling_date + ", clock=" + clock
				+ ", cnoList=" + Arrays.toString(cnoList) + ", rnum=" + rnum + "]";
	}
	public int getCounseling_no() {
		return counseling_no;
	}
	public void setCounseling_no(int counseling_no) {
		this.counseling_no = counseling_no;
	}
	public int getManager_number() {
		return manager_number;
	}
	public void setManager_number(int manager_number) {
		this.manager_number = manager_number;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getCounseling_name() {
		return counseling_name;
	}
	public void setCounseling_name(String counseling_name) {
		this.counseling_name = counseling_name;
	}
	public String getCounseling_phone() {
		return counseling_phone;
	}
	public void setCounseling_phone(String counseling_phone) {
		this.counseling_phone = counseling_phone;
	}
	public String getCounseling_email() {
		return counseling_email;
	}
	public void setCounseling_email(String counseling_email) {
		this.counseling_email = counseling_email;
	}
	public String getCounseling_date() {
		return counseling_date;
	}
	public void setCounseling_date(String counseling_date) {
		this.counseling_date = counseling_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getClock() {
		return clock;
	}
	public void setClock(String clock) {
		this.clock = clock;
	}
	public int[] getCnoList() {
		return cnoList;
	}
	public void setCnoList(int[] cnoList) {
		this.cnoList = cnoList;
	}
}
