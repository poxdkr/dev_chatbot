package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Chatting_log_keyword_VO {
	private int no;
	private int chatting_log_seq_num;
	private String gubun;
	private String user_id;
	private String keyword;
	private String pos;
	private int regdate;
	
	@Override
	public String toString() {
		return "Chatting_log_keyword_VO [no=" + no + ", chatting_log_seq_num=" + chatting_log_seq_num + ", gubun="
				+ gubun + ", user_id=" + user_id + ", keyword=" + keyword + ", pos=" + pos + ", regdate=" + regdate
				+ "]";
	}
	
	
}
