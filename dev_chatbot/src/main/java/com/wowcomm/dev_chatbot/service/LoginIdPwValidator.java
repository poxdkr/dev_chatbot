package com.wowcomm.dev_chatbot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.wowcomm.dev_chatbot.VO.G5_member_VO;
import com.wowcomm.dev_chatbot.mapper.G5_member_Mapper;

@Service
public class LoginIdPwValidator implements UserDetailsService {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Autowired
    private G5_member_Mapper mapper;

    @Override
    public UserDetails loadUserByUsername(String mb_id) throws UsernameNotFoundException { //mb_id가 안읽어짐.....
        G5_member_VO user = mapper.check_Member_login(mb_id);
        //System.out.println("insertedId : " + mb_id);
        if (user == null) {
        	throw new UsernameNotFoundException(mb_id);
        }
        
        String pw = user.getMb_password(); //"d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db"
        String roles = user.getMb_profile(); //"USER"
        
        return User.builder()
                .username(mb_id)
                .password(pw)
                .roles(roles)
                .build();
    }
}
