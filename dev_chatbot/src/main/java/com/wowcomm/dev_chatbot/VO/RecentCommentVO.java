package com.wowcomm.dev_chatbot.VO;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecentCommentVO {
	private int comment_no;
	private String user_id;
	private String regdate;
	private String mobile;
	private String name;
	private String company_name;
	private String gubun;
}
