package com.wowcomm.dev_chatbot.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Keyword_analogy_VO {
	private int seq_num;
	private int fk_seq_num;
	private String analogy;
	private int regdate;
	
	@Override
	public String toString() {
		return "Keyword_analogy_VO [seq_num=" + seq_num + ", fk_seq_num=" + fk_seq_num + ", analogy=" + analogy
				+ ", regdate=" + regdate + "]";
	}
	
	
}
