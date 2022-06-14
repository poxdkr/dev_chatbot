package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Counselling_info_VO {
	private int seq_num;
	private String id_name;
	private int q_type;
	private int ci_status;
	private int ci_type;
	private String ci_question;
	private String ci_disp_name;
	private String ci_depth1_id;
	private String ci_depth2_id;
	private String ci_depth3_id;
	private String ci_depth4_id;
	private String ci_session1_id;
	private String ci_session2_id;
	private String ci_session3_id;
	private String ci_session4_id;
	private String disp_link1;
	private String disp_link2;
	private String disp_link3;
	private String disp_link4;
	private String disp_link5;
	private String link1;
	private String link2;
	private String link3;
	private String link4;
	private String link5;
	private String link1_msg;
	private String link2_msg;
	private String link3_msg;
	private String link4_msg;
	private String link5_msg;
	private String ci_answer0;
	private String more_txt;
	private String more_contents;
	private String img_file1;
	private int ci_reg_date;
	private int ci_mod_date;
	private String ci_ans_sre;
	private String ci_ans_sre_keyword;
	private int state;
	
	@Override
	public String toString() {
		return "Counselling_info_VO [seq_num=" + seq_num + ", id_name=" + id_name + ", q_type=" + q_type
				+ ", ci_status=" + ci_status + ", ci_type=" + ci_type + ", ci_question=" + ci_question
				+ ", ci_disp_name=" + ci_disp_name + ", ci_depth1_id=" + ci_depth1_id + ", ci_depth2_id=" + ci_depth2_id
				+ ", ci_depth3_id=" + ci_depth3_id + ", ci_depth4_id=" + ci_depth4_id + ", ci_session1_id="
				+ ci_session1_id + ", ci_session2_id=" + ci_session2_id + ", ci_session3_id=" + ci_session3_id
				+ ", ci_session4_id=" + ci_session4_id + ", disp_link1=" + disp_link1 + ", disp_link2=" + disp_link2
				+ ", disp_link3=" + disp_link3 + ", disp_link4=" + disp_link4 + ", disp_link5=" + disp_link5
				+ ", link1=" + link1 + ", link2=" + link2 + ", link3=" + link3 + ", link4=" + link4 + ", link5=" + link5
				+ ", link1_msg=" + link1_msg + ", link2_msg=" + link2_msg + ", link3_msg=" + link3_msg + ", link4_msg="
				+ link4_msg + ", link5_msg=" + link5_msg + ", ci_answer0=" + ci_answer0 + ", more_txt=" + more_txt
				+ ", more_contents=" + more_contents + ", img_file1=" + img_file1 + ", ci_reg_date=" + ci_reg_date
				+ ", ci_mod_date=" + ci_mod_date + ", ci_ans_sre=" + ci_ans_sre + ", ci_ans_sre_keyword="
				+ ci_ans_sre_keyword + ", state=" + state + "]";
	}
	
	
}
