package com.wowcomm.dev_chatbot.VO;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class G5_member_VO {
	private int mb_no;
	private String mb_id;
	private String mb_password;
	private String mb_password2;
	private String mb_name;
	private String mb_nick;
	private Date mb_nick_date;
	private String mb_email;
	private String mb_homepage;
	private int mb_level;
	private char mb_sex;
	private String mb_birth;
	private String mb_tel;
	private String mb_hp;
	private String mb_certify;
	private int mb_adult;
	private String mb_dupinfo;
	private String mb_zip1 ;
	private String mb_zip2;
	private String mb_addr1;
	private String mb_addr2;
	private String mb_addr3;
	private String mb_addr_jibeon;
	private String mb_signature;
	private String mb_recommend;
	private int mb_point;
	private Timestamp mb_today_login;
	private String mb_login_ip;
	private Timestamp mb_datetime;
	private String mb_ip;
	private String mb_leave_date;
	private String mb_intercept_date;
	private Timestamp mb_email_certify;
	private String mb_email_certify2;
	private String mb_memo;
	private String mb_lost_certify;
	private int mb_mailling;
	private int mb_sms;
	private int mb_open;
	private Date mb_open_date;
	private String mb_profile;
	private String mb_memo_call;
	private Date sday;
	private Date eday;
	private String mb_1;
	private String mb_2;
	private String mb_3;
	private String mb_4;
	private String mb_5;
	private String mb_6;
	private String mb_7;
	private String mb_8;
	private String mb_9;
	private String mb_10;
	
	@Override
	public String toString() {
		return "G5_member_VO [mb_id=" + mb_id + ", mb_password=" + mb_password + ", mb_password2=" + mb_password2
				+ ", mb_name=" + mb_name + ", mb_nick=" + mb_nick + ", mb_nick_date=" + mb_nick_date + ", mb_email="
				+ mb_email + ", mb_homepage=" + mb_homepage + ", mb_level=" + mb_level + ", mb_birth=" + mb_birth
				+ ", mb_tel=" + mb_tel + ", mb_hp=" + mb_hp + ", mb_certify=" + mb_certify + ", mb_adult=" + mb_adult
				+ ", mb_dupinfo=" + mb_dupinfo + ", mb_zip1=" + mb_zip1 + ", mb_zip2=" + mb_zip2 + ", mb_addr1="
				+ mb_addr1 + ", mb_addr2=" + mb_addr2 + ", mb_addr3=" + mb_addr3 + ", mb_addr_jibeon=" + mb_addr_jibeon
				+ ", mb_signature=" + mb_signature + ", mb_recommend=" + mb_recommend + ", mb_point=" + mb_point
				+ ", mb_today_login=" + mb_today_login + ", mb_login_ip=" + mb_login_ip + ", mb_datetime=" + mb_datetime
				+ ", mb_ip=" + mb_ip + ", mb_leave_date=" + mb_leave_date + ", mb_intercept_date=" + mb_intercept_date
				+ ", mb_email_certify=" + mb_email_certify + ", mb_email_certify2=" + mb_email_certify2 + ", mb_memo="
				+ mb_memo + ", mb_lost_certify=" + mb_lost_certify + ", mb_mailling=" + mb_mailling + ", mb_sms="
				+ mb_sms + ", mb_open=" + mb_open + ", mb_open_date=" + mb_open_date + ", mb_profile=" + mb_profile
				+ ", mb_memo_call=" + mb_memo_call + ", sday=" + sday + ", eday=" + eday + ", mb_1=" + mb_1 + ", mb_2="
				+ mb_2 + ", mb_3=" + mb_3 + ", mb_4=" + mb_4 + ", mb_5=" + mb_5 + ", mb_6=" + mb_6 + ", mb_7=" + mb_7
				+ ", mb_8=" + mb_8 + ", mb_9=" + mb_9 + ", mb_10=" + mb_10 + "]";
	}
	
	
}
