package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Research_info_VO {
	private int seq_num;
	private int engine_no;
	private int rs_no;
	private int qa_no;
	private int rs_type;
	private String rs_question;
	private String rs_answerYN;
	private int reg_date;
	
	@Override
	public String toString() {
		return "Research_info_VO [seq_num=" + seq_num + ", engine_no=" + engine_no + ", rs_no=" + rs_no + ", qa_no="
				+ qa_no + ", rs_type=" + rs_type + ", rs_question=" + rs_question + ", rs_answerYN=" + rs_answerYN
				+ ", reg_date=" + reg_date + "]";
	}
	
	
}
