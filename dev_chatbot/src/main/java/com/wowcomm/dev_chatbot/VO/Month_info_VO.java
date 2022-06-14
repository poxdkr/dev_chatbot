package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Month_info_VO {
	private String month_data;

	@Override
	public String toString() {
		return "Month_info_VO [month_data=" + month_data + "]";
	}
	
	
}
