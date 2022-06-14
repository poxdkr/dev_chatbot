package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Learning_templete_data_VO {
	private int seq_num;
	private int templete_seq_num;
	private String question;
	private Timestamp regdate;
	@Override
	public String toString() {
		return "Learning_templete_data_VO [seq_num=" + seq_num + ", templete_seq_num=" + templete_seq_num
				+ ", question=" + question + ", regdate=" + regdate + "]";
	}
	
	
}
