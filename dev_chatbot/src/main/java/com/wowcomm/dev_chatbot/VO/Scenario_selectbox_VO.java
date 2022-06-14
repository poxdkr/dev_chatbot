package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Scenario_selectbox_VO {
	private int seq_num;
	private String name;
	private String value;
	private int gubun;
	@Override
	public String toString() {
		return "Scenario_selectbox_VO [seq_num=" + seq_num + ", name=" + name + ", value=" + value + ", gubun=" + gubun
				+ "]";
	}
	
	
	
}
