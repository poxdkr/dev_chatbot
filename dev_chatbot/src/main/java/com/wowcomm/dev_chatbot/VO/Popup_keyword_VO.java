package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Popup_keyword_VO {
	private int seq_num;
	private String folder;
	private String keyword;
	private int regdate;
	@Override
	public String toString() {
		return "Popup_keyword_VO [seq_num=" + seq_num + ", folder=" + folder + ", keyword=" + keyword + ", regdate="
				+ regdate + "]";
	}
	
	
}
