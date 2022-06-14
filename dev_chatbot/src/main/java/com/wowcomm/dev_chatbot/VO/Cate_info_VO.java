package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cate_info_VO {
	private int seq_num;
	private int q_type;
	private String q_disp_name;
	private int state;
	private int regdate;
	
	@Override
	public String toString() {
		return "Cate_info_VO [seq_num=" + seq_num + ", q_type=" + q_type + ", q_disp_name=" + q_disp_name + ", state="
				+ state + ", regdate=" + regdate + "]";
	}
	
	
}
