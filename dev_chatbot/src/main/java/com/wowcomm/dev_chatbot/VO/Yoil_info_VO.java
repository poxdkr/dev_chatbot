package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Yoil_info_VO {
	private String num;
	private String dayofweek;
	@Override
	public String toString() {
		return "Yoil_info_VO [num=" + num + ", dayofweek=" + dayofweek + "]";
	}
	
}
