package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Polling_chat_VO {
	private int no;
	private String name;
	private String msg;
	private Timestamp date;
	@Override
	public String toString() {
		return "Polling_chat_VO [no=" + no + ", name=" + name + ", msg=" + msg + ", date=" + date + "]";
	}
	
	
}
