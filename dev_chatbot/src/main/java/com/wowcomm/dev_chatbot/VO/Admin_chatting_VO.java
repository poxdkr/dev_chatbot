package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Admin_chatting_VO {
	private int seq_num;
	private String gubun;
	private String mb_id;
	private String user_id;
	private int state;
	private int regdate;
	
	
	@Override
	public String toString() {
		return "Admin_chatting_VO [seq_num=" + seq_num + ", gubun=" + gubun + ", mb_id=" + mb_id + ", user_id="
				+ user_id + ", state=" + state + ", regdate=" + regdate + "]";
	}

	
}
