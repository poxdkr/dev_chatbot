package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer_qa_comment_VO {
	private int comment_no;
	private String gubun;
	private String user_id;
	private String scn_code;
	private int q_type;
	private String comment;
	private String adm_comment;
	private int state;
	private Timestamp complete_regdate;
	private Timestamp regdate;
	
	@Override
	public String toString() {
		return "Customer_qa_comment_VO [comment_no=" + comment_no + ", gubun=" + gubun + ", user_id=" + user_id
				+ ", scn_code=" + scn_code + ", q_type=" + q_type + ", comment=" + comment + ", adm_comment="
				+ adm_comment + ", state=" + state + ", complete_regdate=" + complete_regdate + ", regdate=" + regdate
				+ "]";
	}
	
	
}
