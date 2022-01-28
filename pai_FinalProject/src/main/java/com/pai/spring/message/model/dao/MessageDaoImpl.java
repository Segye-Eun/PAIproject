package com.pai.spring.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pai.spring.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Override
	public int insertMessage(SqlSessionTemplate session, Message msg) {
		return session.insert("message.insertMessage",msg);
	}

	
}
