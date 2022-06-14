package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Scenario_question_info_VO {
	private int seq_num;
	private String scn_code;
	private int kind;
	private int q_type;
	private String ci_question;
	private String ci_depth1_id;
	private String ci_depth2_id;
	private String ci_depth3_id;
	private String ci_depth4_id;
	private int regdate;
	@Override
	public String toString() {
		return "Scenario_question_info_VO [seq_num=" + seq_num + ", scn_code=" + scn_code + ", kind=" + kind
				+ ", q_type=" + q_type + ", ci_question=" + ci_question + ", ci_depth1_id=" + ci_depth1_id
				+ ", ci_depth2_id=" + ci_depth2_id + ", ci_depth3_id=" + ci_depth3_id + ", ci_depth4_id=" + ci_depth4_id
				+ ", regdate=" + regdate + "]";
	}
	
	
}
