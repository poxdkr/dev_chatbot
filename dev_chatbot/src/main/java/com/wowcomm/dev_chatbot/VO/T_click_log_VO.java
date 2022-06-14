package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class T_click_log_VO {
	private int seq_num;
	private String user_id;
	private String link;
	private String gubun;
	private int regdate;
	
	public T_click_log_VO(int seq_num, String user_id, String link, String gubun, int regdate) {
		super();
		this.seq_num = seq_num;
		this.user_id = user_id;
		this.link = link;
		this.gubun = gubun;
		this.regdate = regdate;
	}
	
	
}
