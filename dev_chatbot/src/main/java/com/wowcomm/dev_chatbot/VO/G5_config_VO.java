package com.wowcomm.dev_chatbot.VO;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class G5_config_VO {
	private String cf_title;
	private String cf_theme;
	private String cf_admin;
	private String cf_admin_email;
	private String cf_admin_email_name;
	private int cf_add_script;
	private int cf_use_point;
	private int cf_point_term;
	private int cf_use_copy_log;
	private int cf_use_email_certify;
	private int cf_login_point;
	private int cf_cut_name;
	private int cf_nick_modify;
	private String cf_new_skin;
	private int cf_new_rows;
	private String cf_search_skin;
	private String cf_connect_skin;
	private String cf_faq_skin;
	private int cf_read_point;
	private int cf_write_point;
	private int cf_comment_point;
	private int cf_download_point;
	private int cf_write_pages;
	private int cf_mobile_pages;
	private String cf_link_target;
	private int cf_delay_sec;
	private int cf_filter;
	private int cf_possible_ip;
	private int cf_intercept_ip;
	private int cf_analytics;
	private int cf_add_meta;
	private String cf_member_skin;
	private int cf_use_homepage;
	private int cf_req_homepage;
	private int cf_use_tel;
	private int cf_req_tel;
	private int cf_use_hp;
	private int cf_req_hp;
	private int cf_use_addr;
	private int cf_req_addr;
	private int cf_use_signature;
	private int cf_req_signature;
	private int cf_use_profile;
	private int cf_req_profile;
	private int cf_register_level;
	private int cf_register_point;
	private int cf_icon_level;
	private int cf_use_recommend;
	private int cf_recommend_point;
	private int cf_leave_day;
	private int cf_search_part;
	private int cf_email_use;
	private int cf_email_wr_super_admin;
	private int cf_email_wr_group_admin;
	private int cf_email_wr_board_admin;
	private int cf_email_wr_write;
	private int cf_email_wr_comment_all;
	private int cf_email_mb_super_admin;
	private int cf_email_mb_member;
	private int cf_email_po_super_admin;
	private String cf_prohibit_id;
	private String cf_prohibit_email;
	private int cf_new_del;
	private int cf_memo_del;
	private int cf_visit_del;
	private int cf_popular_del;
	private Timestamp cf_optimize_date;
	private int cf_use_member_icon;
	private int 	cf_member_icon_size;
	private int cf_member_icon_width;
	private int cf_member_icon_height;
	private int cf_login_minutes;
	private String cf_image_extension;
	private String cf_flash_extension;
	private String cf_movie_extension;
	private int cf_formmail_is_member;
	private int cf_page_rows;
	private int cf_mobile_page_rows;
	private String cf_visit;
	private int cf_max_po_id;
	private int cf_stipulation;
	private int cf_privacy;
	private int cf_open_modify;
	private int cf_memo_send_point;
	private String cf_mobile_new_skin;
	private String cf_mobile_search_skin;
	private String cf_mobile_connect_skin;
	private String cf_mobile_faq_skin;
	private String cf_mobile_member_skin;
	private String cf_captcha_mp3;
	private String cf_editor;
	private int cf_cert_use;
	private String cf_cert_ipin;
	private String cf_cert_hp;
	private String cf_cert_kcb_cd;
	private String cf_cert_kcp_cd;
	private String cf_lg_mid;
	private String cf_lg_mert_key;
	private int cf_cert_limit;
	private int cf_cert_req;
	private String cf_sms_use;
	private String cf_sms_type;
	private String cf_icode_id;
	private String cf_icode_pw;
	private String cf_icode_server_ip;
	private String cf_icode_server_port;
	private String cf_googl_shorturl_apikey;
	private String cf_facebook_appid;
	private String cf_facebook_secret;
	private String cf_twitter_key;
	private String cf_twitter_secret;
	private String cf_kakao_js_apikey;
	private String cf_1_subj;
	private String cf_2_subj;
	private String cf_3_subj;
	private String cf_4_subj;
	private String cf_5_subj;
	private String cf_6_subj;
	private String cf_7_subj;
	private String cf_8_subj;
	private String cf_9_subj;
	private String cf_10_subj;
	private String cf_1;
	private String cf_2;
	private String cf_3;
	private String cf_4;
	private String cf_5;
	private String cf_6;
	private String cf_7;
	private String 	cf_8;
	private String 	cf_9;
	private String cf_10;
	@Override
	public String toString() {
		return "g5_config [cf_title=" + cf_title + ", cf_theme=" + cf_theme + ", cf_admin=" + cf_admin
				+ ", cf_admin_email=" + cf_admin_email + ", cf_admin_email_name=" + cf_admin_email_name
				+ ", cf_add_script=" + cf_add_script + ", cf_use_point=" + cf_use_point + ", cf_point_term="
				+ cf_point_term + ", cf_use_copy_log=" + cf_use_copy_log + ", cf_use_email_certify="
				+ cf_use_email_certify + ", cf_login_point=" + cf_login_point + ", cf_cut_name=" + cf_cut_name
				+ ", cf_nick_modify=" + cf_nick_modify + ", cf_new_skin=" + cf_new_skin + ", cf_new_rows=" + cf_new_rows
				+ ", cf_search_skin=" + cf_search_skin + ", cf_connect_skin=" + cf_connect_skin + ", cf_faq_skin="
				+ cf_faq_skin + ", cf_read_point=" + cf_read_point + ", cf_write_point=" + cf_write_point
				+ ", cf_comment_point=" + cf_comment_point + ", cf_download_point=" + cf_download_point
				+ ", cf_write_pages=" + cf_write_pages + ", cf_mobile_pages=" + cf_mobile_pages + ", cf_link_target="
				+ cf_link_target + ", cf_delay_sec=" + cf_delay_sec + ", cf_filter=" + cf_filter + ", cf_possible_ip="
				+ cf_possible_ip + ", cf_intercept_ip=" + cf_intercept_ip + ", cf_analytics=" + cf_analytics
				+ ", cf_add_meta=" + cf_add_meta + ", cf_member_skin=" + cf_member_skin + ", cf_use_homepage="
				+ cf_use_homepage + ", cf_req_homepage=" + cf_req_homepage + ", cf_use_tel=" + cf_use_tel
				+ ", cf_req_tel=" + cf_req_tel + ", cf_use_hp=" + cf_use_hp + ", cf_req_hp=" + cf_req_hp
				+ ", cf_use_addr=" + cf_use_addr + ", cf_req_addr=" + cf_req_addr + ", cf_use_signature="
				+ cf_use_signature + ", cf_req_signature=" + cf_req_signature + ", cf_use_profile=" + cf_use_profile
				+ ", cf_req_profile=" + cf_req_profile + ", cf_register_level=" + cf_register_level
				+ ", cf_register_point=" + cf_register_point + ", cf_icon_level=" + cf_icon_level
				+ ", cf_use_recommend=" + cf_use_recommend + ", cf_recommend_point=" + cf_recommend_point
				+ ", cf_leave_day=" + cf_leave_day + ", cf_search_part=" + cf_search_part + ", cf_email_use="
				+ cf_email_use + ", cf_email_wr_super_admin=" + cf_email_wr_super_admin + ", cf_email_wr_group_admin="
				+ cf_email_wr_group_admin + ", cf_email_wr_board_admin=" + cf_email_wr_board_admin
				+ ", cf_email_wr_write=" + cf_email_wr_write + ", cf_email_wr_comment_all=" + cf_email_wr_comment_all
				+ ", cf_email_mb_super_admin=" + cf_email_mb_super_admin + ", cf_email_mb_member=" + cf_email_mb_member
				+ ", cf_email_po_super_admin=" + cf_email_po_super_admin + ", cf_prohibit_id=" + cf_prohibit_id
				+ ", cf_prohibit_email=" + cf_prohibit_email + ", cf_new_del=" + cf_new_del + ", cf_memo_del="
				+ cf_memo_del + ", cf_visit_del=" + cf_visit_del + ", cf_popular_del=" + cf_popular_del
				+ ", cf_optimize_date=" + cf_optimize_date + ", cf_use_member_icon=" + cf_use_member_icon
				+ ", cf_member_icon_size=" + cf_member_icon_size + ", cf_member_icon_width=" + cf_member_icon_width
				+ ", cf_member_icon_height=" + cf_member_icon_height + ", cf_login_minutes=" + cf_login_minutes
				+ ", cf_image_extension=" + cf_image_extension + ", cf_flash_extension=" + cf_flash_extension
				+ ", cf_movie_extension=" + cf_movie_extension + ", cf_formmail_is_member=" + cf_formmail_is_member
				+ ", cf_page_rows=" + cf_page_rows + ", cf_mobile_page_rows=" + cf_mobile_page_rows + ", cf_visit="
				+ cf_visit + ", cf_max_po_id=" + cf_max_po_id + ", cf_stipulation=" + cf_stipulation + ", cf_privacy="
				+ cf_privacy + ", cf_open_modify=" + cf_open_modify + ", cf_memo_send_point=" + cf_memo_send_point
				+ ", cf_mobile_new_skin=" + cf_mobile_new_skin + ", cf_mobile_search_skin=" + cf_mobile_search_skin
				+ ", cf_mobile_connect_skin=" + cf_mobile_connect_skin + ", cf_mobile_faq_skin=" + cf_mobile_faq_skin
				+ ", cf_mobile_member_skin=" + cf_mobile_member_skin + ", cf_captcha_mp3=" + cf_captcha_mp3
				+ ", cf_editor=" + cf_editor + ", cf_cert_use=" + cf_cert_use + ", cf_cert_ipin=" + cf_cert_ipin
				+ ", cf_cert_hp=" + cf_cert_hp + ", cf_cert_kcb_cd=" + cf_cert_kcb_cd + ", cf_cert_kcp_cd="
				+ cf_cert_kcp_cd + ", cf_lg_mid=" + cf_lg_mid + ", cf_lg_mert_key=" + cf_lg_mert_key
				+ ", cf_cert_limit=" + cf_cert_limit + ", cf_cert_req=" + cf_cert_req + ", cf_sms_use=" + cf_sms_use
				+ ", cf_sms_type=" + cf_sms_type + ", cf_icode_id=" + cf_icode_id + ", cf_icode_pw=" + cf_icode_pw
				+ ", cf_icode_server_ip=" + cf_icode_server_ip + ", cf_icode_server_port=" + cf_icode_server_port
				+ ", cf_googl_shorturl_apikey=" + cf_googl_shorturl_apikey + ", cf_facebook_appid=" + cf_facebook_appid
				+ ", cf_facebook_secret=" + cf_facebook_secret + ", cf_twitter_key=" + cf_twitter_key
				+ ", cf_twitter_secret=" + cf_twitter_secret + ", cf_kakao_js_apikey=" + cf_kakao_js_apikey
				+ ", cf_1_subj=" + cf_1_subj + ", cf_2_subj=" + cf_2_subj + ", cf_3_subj=" + cf_3_subj + ", cf_4_subj="
				+ cf_4_subj + ", cf_5_subj=" + cf_5_subj + ", cf_6_subj=" + cf_6_subj + ", cf_7_subj=" + cf_7_subj
				+ ", cf_8_subj=" + cf_8_subj + ", cf_9_subj=" + cf_9_subj + ", cf_10_subj=" + cf_10_subj + ", cf_1="
				+ cf_1 + ", cf_2=" + cf_2 + ", cf_3=" + cf_3 + ", cf_4=" + cf_4 + ", cf_5=" + cf_5 + ", cf_6=" + cf_6
				+ ", cf_7=" + cf_7 + ", cf_8=" + cf_8 + ", cf_9=" + cf_9 + ", cf_10=" + cf_10 + "]";
	}
	
	
	
}
