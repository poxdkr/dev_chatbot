package com.wowcomm.dev_chatbot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import com.wowcomm.dev_chatbot.service.LoginIdPwValidator;

	@Configuration
	@EnableWebSecurity
	public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
		
		 @Autowired
		 LoginIdPwValidator loginIdPwValidator;

		
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http
	        .authorizeRequests()
            .antMatchers("/","/failure").permitAll()    // 시작, 로그인 실패 요청 허용
            .antMatchers("/manage").hasAuthority("ROLE_ADMIN") //manage이하로 붙는 요청은 ROLE_ADMIN 필요함.
            .anyRequest().authenticated() //나머지는 모두 인증 필요함
        .and()
            .formLogin() 
            .loginPage("/") //로그인 페이지 지정
            .loginProcessingUrl("/loginProc") //로그인 action 매핑
            .usernameParameter("mb_id") //인자 매핑
            .passwordParameter("mb_password") //인자 매핑 
            .defaultSuccessUrl("/index?mode=dashboard", true) //로그인 성공 매핑
            .failureUrl("/failure") //로그인 실패 매핑
            .permitAll()
        .and()
            .logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //로그아웃 매핑
            .invalidateHttpSession(true); //로그아웃시 세션 날리기
	        
	      //security.httpBasic().disable();		
	        http.cors().and();		
	        http.csrf().disable();
	        
	      //x-frame
	        http.headers()
				.frameOptions().sameOrigin();
	        			
	    }
	    @Override
	    public void configure(WebSecurity web) throws Exception {
	        web.ignoring().antMatchers("/resource/**"); //정적리소스는 모두 접근 허용
	    }

	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(loginIdPwValidator); //인증 시작
	    }
}
