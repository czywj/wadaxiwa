package com.tarena.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.AccountMapper;
import com.tarena.dao.ServiceMapper;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@Controller
@RequestMapping("/account")
@SessionAttributes("accountPage")
public class AccountController extends BaseController{

	@Resource
	private AccountMapper accMapper;
	
	@Resource
	private ServiceMapper serMapper;
	
	@RequestMapping("/findAccount.do")
	public String find(AccountPage page,Model model){
		//查询当前页的帐务帐号
		List<Account> list = accMapper.findByPage(page);
		model.addAttribute("accounts",list);
		//查询总行数，计算总的页数
		int rows = accMapper.findRows(page);
		page.setRows(rows);
		model.addAttribute("accountPage",page);
		return "account/account_list";
	}
	
	@RequestMapping("/pauseAccount.do")
	public String updateToPause(int id){
		//暂停帐务帐号
		accMapper.pause(id);
		//暂停其下属的业务帐号
		serMapper.pauseByAccount(id);
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("/startAccount.do")
	public String toStart(int id){
		accMapper.start(id);
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("/deleteAccount.do")
	public String toDelete(int id){
		accMapper.delete(id);
		//删除其下属的业务帐号
		serMapper.deleteByAccount(id);
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("/toAddAccount.do")
	public String toAdd(){
		return "account/add_account";
	}
	
	@RequestMapping("/addAccount.do")
	public String add(Account account){
		account.setStatus("0");
		account.setCreate_date(new Timestamp(System.currentTimeMillis()));
		accMapper.insert(account);
		return "redirect:findAccount.do";
	}
	
	@RequestMapping("/toUpdateAccount.do")
	public String toUpdate(int id,Model model){
		Account account = accMapper.findByAccountId(id); 
		model.addAttribute("account",account);
		return "account/update_account";
	}
	
	@RequestMapping("/updateAccount.do")
	public String update(Account account){
		accMapper.update(account);
		return "redirect:findAccount.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
