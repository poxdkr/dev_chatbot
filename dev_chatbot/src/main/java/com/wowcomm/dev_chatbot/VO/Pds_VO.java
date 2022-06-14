package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pds_VO {
	
	private int no;
	private String category;
	private String subject;
	private String tbody;
	private String file1;
	private int wdate;
	@Override
	public String toString() {
		return "Pds_VO [no=" + no + ", category=" + category + ", subject=" + subject + ", tbody=" + tbody + ", file1="
				+ file1 + ", wdate=" + wdate + "]";
	}
	
	
}
