package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class T_push_log_VO {
	private int pushlog_uid;
	private int origin_pushlog_uid;
	private String push_uid;
	private String push_gubun;
	private int engine_no;
	private String id;
	private String tkn;
	private String title;
	private String title2;
	private String body;
	private String url;
	private int status;
	private String scn_code;
	private String error_log;
	private char click_yn;
	private char re_push;
	private int re_push_cnt;
	private int score;
	private char test_yn;
	private char push_info_yn;
	private char test_result;
	private char jaesiheom_yn;
	private char jaesiheom_check_yn;
	private int re_test_push_cnt;
	private Timestamp regdate;
	private Timestamp re_push_regdate;
	private Timestamp re_test_push_regdate;
	private Timestamp click_regdate;
	private Timestamp push_info_regdate;
	private Timestamp push_info_ok_regdate;
	private int holiday_yn;
	@Override
	public String toString() {
		return "T_push_log_VO [pushlog_uid=" + pushlog_uid + ", origin_pushlog_uid=" + origin_pushlog_uid
				+ ", push_uid=" + push_uid + ", push_gubun=" + push_gubun + ", engine_no=" + engine_no + ", id=" + id
				+ ", tkn=" + tkn + ", title=" + title + ", title2=" + title2 + ", body=" + body + ", url=" + url
				+ ", status=" + status + ", scn_code=" + scn_code + ", error_log=" + error_log + ", click_yn="
				+ click_yn + ", re_push=" + re_push + ", re_push_cnt=" + re_push_cnt + ", score=" + score + ", test_yn="
				+ test_yn + ", push_info_yn=" + push_info_yn + ", test_result=" + test_result + ", jaesiheom_yn="
				+ jaesiheom_yn + ", jaesiheom_check_yn=" + jaesiheom_check_yn + ", re_test_push_cnt=" + re_test_push_cnt
				+ ", regdate=" + regdate + ", re_push_regdate=" + re_push_regdate + ", re_test_push_regdate="
				+ re_test_push_regdate + ", click_regdate=" + click_regdate + ", push_info_regdate=" + push_info_regdate
				+ ", push_info_ok_regdate=" + push_info_ok_regdate + ", holiday_yn=" + holiday_yn + "]";
	}
	
}
