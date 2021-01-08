package com.spring.mapper;

import java.util.HashMap;
import java.util.List;


import com.spring.gogidang.qna.QnaVO;

public interface QnaMapper {
	
	public int getListCount(); 
	public List<QnaVO> getQnaList(HashMap<String, Integer> hashmap);
	public int qnaInsert(QnaVO qna);
	public QnaVO getDetail(int qna_num);
	public int qnaModify(QnaVO qna);
	public int qnaDelete(int qna_num);
	public int isBoardWriter(HashMap<String, String> hashmap);
	public int qnaReplyupdate(QnaVO qna);
	public int qnaReply(QnaVO qna);
	
}
