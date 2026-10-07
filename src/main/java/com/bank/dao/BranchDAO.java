package com.bank.dao;

import java.util.List;

import com.bank.dto.Branch;

public interface BranchDAO {
	
	void addBranch(Branch b);
	
	void updateBranch(Branch b);
	
	void deleteBranchById(Integer id);
	
	Branch getBranchById(Integer id);
	
	List<Branch> getAllBranch();

}
