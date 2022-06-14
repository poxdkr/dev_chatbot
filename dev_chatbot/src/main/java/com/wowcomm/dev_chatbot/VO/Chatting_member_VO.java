package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Chatting_member_VO {
	private int seq_num;
	private String user_id;
	private String cid;
	private String gubun;
	private int visit_time;
	private int state;
	private int regdate;
	private String user_id_str;
	
	@Override
	public String toString() {
		return "Chatting_member_VO [seq_num=" + seq_num + ", user_id=" + user_id + ", cid=" + cid + ", gubun=" + gubun
				+ ", visit_time=" + visit_time + ", state=" + state + ", regdate=" + regdate + ", user_id_str="
				+ user_id_str + "]";
	}
	
	
	
}
