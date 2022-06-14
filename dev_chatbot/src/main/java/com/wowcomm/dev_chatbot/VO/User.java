package com.wowcomm.dev_chatbot.VO;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import lombok.Data;

@Entity
@Data
public class User {
	@Id
	@Column(name="user_id")
	private Long id;
	
	private String username;
	private String password;
	private Boolean enabled;

}
