package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Auth_mobile_VO {
	
	private int seq_num;
	private String user_id;
	private String number;
	private int regdate;
	
	@Override
	public String toString() {
		return "Auth_mobile_VO [seq_num=" + seq_num + ", user_id=" + user_id + ", number=" + number + ", regdate="
				+ regdate + "]";
	}
	
	
}
