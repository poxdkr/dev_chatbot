package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Auth_member_VO {
	
	private int seq_num;
	private String mb_id;
	private String admin;
	private String statistics;
	private String log;
	private String chatbot;
	private String customer;
	private String pds;
	private int modidate;
	private int regdate;
	
	@Override
	public String toString() {
		return "Auth_member_VO [seq_num=" + seq_num + ", mb_id=" + mb_id + ", admin=" + admin + ", statistics="
				+ statistics + ", log=" + log + ", chatbot=" + chatbot + ", customer=" + customer + ", pds=" + pds
				+ ", modidate=" + modidate + ", regdate=" + regdate + "]";
	}
	
	
}
