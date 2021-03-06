package com.pai.spring.member.model.service;

import java.util.Map;

import com.pai.spring.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int checkId(String member_id);
	
	int checkNick(String member_nick);
	
	int updateAuthKey(Member m);
	
	int updateAuthStatus(String member_email);
	
	Member findId(Member m);
	
	Member findIdResult(Member m);
	
	Member findPwd(Member m);
	
	int findPwdUpdate(Member m);
	
	int insertMbti(Member m);
	
	int insertNaverAccount(Member loginMember);
	
	int updateNaverAccount(Member m);
	
	int delete(String member_id)throws Exception;
	
	String pwCheck(String member_id)throws Exception;
	
	int pwUpdate(String member_id, String hashedPw)throws Exception;
	
	int updateMember(Member m);
}
