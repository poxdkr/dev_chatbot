package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class T_emp_research_VO {
	private int emp_research_no;
	private String id;
	private int research_info_seq_num;
	private String __push_uid;
	private String qa_no;
	private Timestamp regdate;
	
	@Override
	public String toString() {
		return "T_emp_research_VO [emp_research_no=" + emp_research_no + ", id=" + id + ", research_info_seq_num="
				+ research_info_seq_num + ", __push_uid=" + __push_uid + ", qa_no=" + qa_no + ", regdate=" + regdate
				+ "]";
	}
	
	
}
