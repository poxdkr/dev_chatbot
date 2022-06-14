package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Engine_log_VO {
	private int seq_num;
	private int kind;
	private int domain_seq_num;
	private int engine_status;
	private String engine_name;
	private String engine_msg;
	private String admin_id;
	private int sdate;
	private int ndate;
	private int edate;
	private int regdate;
	
	@Override
	public String toString() {
		return "Engine_log_VO [seq_num=" + seq_num + ", kind=" + kind + ", domain_seq_num=" + domain_seq_num
				+ ", engine_status=" + engine_status + ", engine_name=" + engine_name + ", engine_msg=" + engine_msg
				+ ", admin_id=" + admin_id + ", sdate=" + sdate + ", ndate=" + ndate + ", edate=" + edate + ", regdate="
				+ regdate + "]";
	}
	
	
}
