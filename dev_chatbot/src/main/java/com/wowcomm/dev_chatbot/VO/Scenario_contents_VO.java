package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Scenario_contents_VO {
	private int seq_num;
	private String scn_code;
	private String scenario_id;
	private String descriptions;
	private String question_txt;
	private String images;
	private String links;
	private int sort;
	private int regdate;
	@Override
	public String toString() {
		return "Scenario_contents_VO [seq_num=" + seq_num + ", scn_code=" + scn_code + ", scenario_id=" + scenario_id
				+ ", descriptions=" + descriptions + ", question_txt=" + question_txt + ", images=" + images
				+ ", links=" + links + ", sort=" + sort + ", regdate=" + regdate + "]";
	}
	
	
}
