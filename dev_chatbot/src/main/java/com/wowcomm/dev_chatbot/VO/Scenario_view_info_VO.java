package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Scenario_view_info_VO {
	private int seq_num;
	private int q_type;
	private String scn_code;
	private String scenario_id;
	private String stype;
	private String source;
	private String target;
	private String viewdata_id;
	private String xPosi;
	private String yPosi;
	private String 	ansTxt;
	private String qustTxt;
	private String qustId1;
	private String qustId2;
	private String qustId3;
	private String qustType;
	private String stats;
	private String cal;
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
	private String img_file1;
	private String img_file2;
	private String img_display;
	private String select_msg;
	private char select_yn;
	private String talkText_check;
	private String alias;
	private String qna_find;
	private int regdate;
	@Override
	public String toString() {
		return "Scenario_view_info_VO [seq_num=" + seq_num + ", q_type=" + q_type + ", scn_code=" + scn_code
				+ ", scenario_id=" + scenario_id + ", stype=" + stype + ", source=" + source + ", target=" + target
				+ ", viewdata_id=" + viewdata_id + ", xPosi=" + xPosi + ", yPosi=" + yPosi + ", ansTxt=" + ansTxt
				+ ", qustTxt=" + qustTxt + ", qustId1=" + qustId1 + ", qustId2=" + qustId2 + ", qustId3=" + qustId3
				+ ", qustType=" + qustType + ", stats=" + stats + ", cal=" + cal + ", disp_link1=" + disp_link1
				+ ", disp_link2=" + disp_link2 + ", disp_link3=" + disp_link3 + ", disp_link4=" + disp_link4
				+ ", disp_link5=" + disp_link5 + ", link1=" + link1 + ", link2=" + link2 + ", link3=" + link3
				+ ", link4=" + link4 + ", link5=" + link5 + ", img_file1=" + img_file1 + ", img_file2=" + img_file2
				+ ", img_display=" + img_display + ", select_msg=" + select_msg + ", select_yn=" + select_yn
				+ ", talkText_check=" + talkText_check + ", alias=" + alias + ", qna_find=" + qna_find + ", regdate="
				+ regdate + "]";
	}
	
	
}
