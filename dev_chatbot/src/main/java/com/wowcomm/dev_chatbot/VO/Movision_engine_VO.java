package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

public class Movision_engine_VO {
	private int no;
	private String engine_name;
	private String engine_src;
	private Timestamp engine_day;
	private String engine_time;
	private String engine_yoil;
	private Timestamp test_eday;
	private String engine_body;
	private String wecome_msg;
	private int engine_last;
	private String engine_group;
	private int engine_type;
	private int engine_status;
	private String engine_msg;
	private String cron_check;
	private String cron_edu_check;
	private int check_time;
	private String admin_id;
	private int status;
	private int status_edu;
	private String push_checkno;
	private String push_title;
	private String push_link;
	private String scn_code;
	private int test_score;
	private String jeongdab;
	private String director_cd;
	private String team_cd;
	private String part_cd;
	private String store_cd;
	private String emp_cd;
	private int director_ty;
	private int team_ty;
	private int part_ty;
	private String excel_file;
	private String video_file;
	private String video_url;
	private String image_file;
	private String image2_file;
	private String dcode_excel_file;
	private int excelUid;
	private String icon_img;
	private char qa_YN;
	@Override
	public String toString() {
		return "Movision_engine_VO [no=" + no + ", engine_name=" + engine_name + ", engine_src=" + engine_src
				+ ", engine_day=" + engine_day + ", engine_time=" + engine_time + ", engine_yoil=" + engine_yoil
				+ ", test_eday=" + test_eday + ", engine_body=" + engine_body + ", wecome_msg=" + wecome_msg
				+ ", engine_last=" + engine_last + ", engine_group=" + engine_group + ", engine_type=" + engine_type
				+ ", engine_status=" + engine_status + ", engine_msg=" + engine_msg + ", cron_check=" + cron_check
				+ ", cron_edu_check=" + cron_edu_check + ", check_time=" + check_time + ", admin_id=" + admin_id
				+ ", status=" + status + ", status_edu=" + status_edu + ", push_checkno=" + push_checkno
				+ ", push_title=" + push_title + ", push_link=" + push_link + ", scn_code=" + scn_code + ", test_score="
				+ test_score + ", jeongdab=" + jeongdab + ", director_cd=" + director_cd + ", team_cd=" + team_cd
				+ ", part_cd=" + part_cd + ", store_cd=" + store_cd + ", emp_cd=" + emp_cd + ", director_ty="
				+ director_ty + ", team_ty=" + team_ty + ", part_ty=" + part_ty + ", excel_file=" + excel_file
				+ ", video_file=" + video_file + ", video_url=" + video_url + ", image_file=" + image_file
				+ ", image2_file=" + image2_file + ", dcode_excel_file=" + dcode_excel_file + ", excelUid=" + excelUid
				+ ", icon_img=" + icon_img + ", qa_YN=" + qa_YN + "]";
	}
}
