package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notice_VO {
	private int no;
	private String category;
	private String subject;
	private String tbody;
	private int wdate;
	@Override
	public String toString() {
		return "Notice_VO [no=" + no + ", category=" + category + ", subject=" + subject + ", tbody=" + tbody
				+ ", wdate=" + wdate + "]";
	}
	
	
}
