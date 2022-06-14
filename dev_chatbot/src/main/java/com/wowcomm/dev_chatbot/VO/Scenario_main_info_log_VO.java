package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Scenario_main_info_log_VO {
	private int seq_num;
	private String scn_code;
	private int q_type;
	private String sname;
	private String id_name;
	private String displayName;
	private String viewQust;
	private int state;
	private int updatedate;
	private int regdate;
	
	@Override
	public String toString() {
		return "Scenario_main_info_log_VO [seq_num=" + seq_num + ", scn_code=" + scn_code + ", q_type=" + q_type
				+ ", sname=" + sname + ", id_name=" + id_name + ", displayName=" + displayName + ", viewQust="
				+ viewQust + ", state=" + state + ", updatedate=" + updatedate + ", regdate=" + regdate + "]";
	}
	
	
}
