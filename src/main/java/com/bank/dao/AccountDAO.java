package com.bank.dao;

import java.util.List;

import com.bank.dto.Account;

public interface AccountDAO {
	
	void addAccount(Account a);
	
	void updateAccount(Account a);
	
	void deleteAccountById(Integer id);
	
	Account getAccountById(Integer id);
	
	List<Account> getAllAccounts();
	
	List<Account> getAccountByType(String type);
	
	List<Account> getAccountByStatus(String status);



}
