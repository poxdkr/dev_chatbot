package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer_info_visit_time_VO {
	private int customer_vt_no;
	private String visit_id;
	private String gubun;
	private String user_id;
	private Timestamp sdate;
	private Timestamp edate;
	private int visit_time;
	
	@Override
	public String toString() {
		return "Customer_info_visit_time_VO [customer_vt_no=" + customer_vt_no + ", visit_id=" + visit_id + ", gubun="
				+ gubun + ", user_id=" + user_id + ", sdate=" + sdate + ", edate=" + edate + ", visit_time="
				+ visit_time + "]";
	}
	
	
}
