package com.pai.spring.message.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.pai.spring.message.model.dao.MessageDao;
import com.pai.spring.message.model.vo.Message;

@Component
@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MessageDao dao;

	@Override
	public int insertMessage(Message msg) {
		return dao.insertMessage(session,msg);
	}

	@Override
	public List<Message> selectRecvMessage(String memberId, int cPage, int numPerpage) {
		return dao.selectRecvMessage(session,memberId, cPage, numPerpage);
	}

	@Override
	public int selectRecvMessageCount(String memberId) {
		return dao.selectRecvMessageCount(session, memberId);
	}

	@Override
	public Map selectRecvMsgDetail(int msgNo) {
		return dao.selectRecvMsgDetail(session, msgNo);
	}

	@Override
	public List<Message> selectSendMsg(String sendId, int cPage, int numPerpage) {
		return dao.selectSendMsg(session, sendId, cPage, numPerpage);
	}

	@Override
	public int selectSendMessageCount(String sendId) {
		return dao.selectSendMessageCount(session, sendId);
	}

	
	
	
	@Override
	public Map selectSendMsgDetail(int msgNo) {
		return dao.selectSendMSgDetail(session, msgNo);
	}

	@Override
	public int deleteRecvMsg(int msgNo) {
		return dao.deleteRecvMsg(session, msgNo);
	}
	
	
	
	
	@Override
	public int saveMsgPut(int msgNo) {
		return dao.saveMsgPut(session, msgNo);
	}

	@Override
	public int deleteSendMsg(int msgNo) {
		return dao.deleteSendMsg(session, msgNo);
	}

	@Override
	public void oldMessageDelete() {
		dao.oldMessageDelete(session);
		
	}
	
	

	@Override
	public void perDelete() {
		dao.perDelete(session);
	}

	@Override
	public int selectUnreadMsg(String memberId) {
		return dao.selectUnreadMsg(session, memberId);
	}

	@Override
	public int sendMessage(Map param) {
		return dao.sendMessage(session, param);
	}

	@Override
	public int recvMsgRead(int msgNo) {
		return dao.recvMsgRead(session, msgNo);
	}

	@Override
	public int cancelSendMsg(int msgNo) {
		return dao.cancelSendMsg(session, msgNo);
	}

	@Override
	public List<Message> selectSaveMessage(String memberId, int cPage, int numPerpage) {
		return dao.selectSaveMessage(session, memberId, cPage, numPerpage);
	}

	@Override
	public int selectSaveMessageCount(String memberId) {
		return dao.selectSaveMessageCount(session, memberId);
	}

	@Override
	public Map selectSaveMsgDetail(int msgNo) {
		return dao.selectSaveMsgDetail(session, msgNo);
	}

	@Override
	public int saveMsgRead(int msgNo) {
		return dao.saveMsgRead(session, msgNo);
	}

	@Override
	public int deleteSaveMsg(int msgNo) {
		return dao.deleteSaveMsg(session, msgNo);
	}

	@Override
	public int saveMsgExport(int msgNo) {
		return dao.saveMsgExport(session, msgNo);
	}

	@Override
	public List<Message> selectRecvMsgSearch(Map param, int cPage, int numPerpage) {
		return dao.selectRecvMsgSearch(session, param, cPage, numPerpage);
	}

	@Override
	public int selectRecvMsgSearchCount(Map param) {
		return dao.selectRecvMsgSearchCount(session, param);
	}

	@Override
	public List<Message> selectSendMsgSearch(Map param, int cPage, int numPerpage) {
		return dao.selectSendMsgSearch(session, param, cPage, numPerpage);
	}

	@Override
	public int selectSendMsgSearchCount(Map param) {
		return dao.selectSendMsgSearchCount(session, param);
	}

	@Override
	public List<Message> selectSaveMsgSearch(Map param, int cPage, int numPerpage) {
		return dao.selectSaveMsgSearch(session, param, cPage, numPerpage);
	}

	@Override
	public int selectSaveMsgSearchCount(Map param) {
		return dao.selectSaveMsgSearchCount(session, param);
	}

	
	
	
	
}
