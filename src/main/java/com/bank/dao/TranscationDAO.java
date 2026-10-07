package com.bank.dao;

import java.util.List;

import com.bank.dto.Transcation;

public interface TranscationDAO {
	
	void addTranscation(Transcation t);
	
	void updateTranscation(Transcation t);
	
	void deleteTranscationById(Integer id);
	
	Transcation getTranscationById(Integer id);
	
	List<Transcation> getAllTranscation();
	
	List<Transcation> getTranscationByAccId(Integer id);

}
