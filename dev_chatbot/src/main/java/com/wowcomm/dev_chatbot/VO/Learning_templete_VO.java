package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

public class Learning_templete_VO {
	private int seq_num;
	private String excel_template_name;
	private Timestamp regdate;
	@Override
	public String toString() {
		return "Learning_templete_VO [seq_num=" + seq_num + ", excel_template_name=" + excel_template_name
				+ ", regdate=" + regdate + "]";
	}
}
