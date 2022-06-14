package com.wowcomm.dev_chatbot.VO;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer_info_VO {
	private int customer_no;
	private String gubun;
	private String user_id;
	private String mobile;
	private String company_name;
	private String name;
	private String email;
	private Date last_regdate;
	private Date end_time;
	private String chatting_YN;
	private Timestamp chatting_last_regdate;
	private Timestamp regdate;
	private int dayofweek;
	
	@Override
	public String toString() {
		return "Customer_info_VO [customer_no=" + customer_no + ", gubun=" + gubun + ", user_id=" + user_id
				+ ", mobile=" + mobile + ", company_name=" + company_name + ", name=" + name + ", email=" + email
				+ ", last_regdate=" + last_regdate + ", end_time=" + end_time + ", chatting_YN=" + chatting_YN
				+ ", chatting_last_regdate=" + chatting_last_regdate + ", regdate=" + regdate + ", dayofweek="
				+ dayofweek + "]";
	}
	
	
}
