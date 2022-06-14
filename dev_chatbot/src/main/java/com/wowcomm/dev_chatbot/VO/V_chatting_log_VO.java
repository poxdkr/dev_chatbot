package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class V_chatting_log_VO {
	private int seq_num;
	private String gubun;
	private String user_id;
	private int kind;
	private int msg_t;
	private String msg_m;
	private String msg_m_txt;
	private String msg_s1;
	private String msg_s2;
	private String msg_s3;
	private String msg_s4;
	private String entity_data0;
	private String entity_data1;
	private String entity_data2;
	private String entity_data3;
	private String entity_data4;
	private String entity_data5;
	private String entity_data6;
	private String entity_data7;
	private String entity_data8;
	private String entity_data9;
	private int ai_percent;
	private String ai_msg;
	private String ai_msg_img;
	private String ai_msg_find;
	private String scenario_id;
	private String scn_code;
	private int state;
	private int msg_state;
	private char isview;
	private int keyword_check;
	private int regdate;
	private Timestamp sysdate;
	private int dayofweek;
	
	@Override
	public String toString() {
		return "V_chatting_log_VO [seq_num=" + seq_num + ", gubun=" + gubun + ", user_id=" + user_id + ", kind=" + kind
				+ ", msg_t=" + msg_t + ", msg_m=" + msg_m + ", msg_m_txt=" + msg_m_txt + ", msg_s1=" + msg_s1
				+ ", msg_s2=" + msg_s2 + ", msg_s3=" + msg_s3 + ", msg_s4=" + msg_s4 + ", entity_data0=" + entity_data0
				+ ", entity_data1=" + entity_data1 + ", entity_data2=" + entity_data2 + ", entity_data3=" + entity_data3
				+ ", entity_data4=" + entity_data4 + ", entity_data5=" + entity_data5 + ", entity_data6=" + entity_data6
				+ ", entity_data7=" + entity_data7 + ", entity_data8=" + entity_data8 + ", entity_data9=" + entity_data9
				+ ", ai_percent=" + ai_percent + ", ai_msg=" + ai_msg + ", ai_msg_img=" + ai_msg_img + ", ai_msg_find="
				+ ai_msg_find + ", scenario_id=" + scenario_id + ", scn_code=" + scn_code + ", state=" + state
				+ ", msg_state=" + msg_state + ", isview=" + isview + ", keyword_check=" + keyword_check + ", regdate="
				+ regdate + ", sysdate=" + sysdate + ", dayofweek=" + dayofweek + "]";
	}
	
	
}
