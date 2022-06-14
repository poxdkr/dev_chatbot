package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Counselling_contents_VO {
	private int seq_num;
	private int counselling_id;
	private String descriptions;
	private String question_txt;
	private String images;
	private String links;
	private int sort;
	private int regdate;
	
	@Override
	public String toString() {
		return "Counselling_contents_VO [seq_num=" + seq_num + ", counselling_id=" + counselling_id + ", descriptions="
				+ descriptions + ", question_txt=" + question_txt + ", images=" + images + ", links=" + links
				+ ", sort=" + sort + ", regdate=" + regdate + "]";
	}
	
	
}
