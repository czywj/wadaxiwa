package com.tarena.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.AccountMapper;
import com.tarena.dao.CostMapper;
import com.tarena.dao.ServiceMapper;
import com.tarena.entity.Account;
import com.tarena.entity.Cost;
import com.tarena.entity.Service;
import com.tarena.entity.page.ServicePage;

@Controller
@RequestMapping("/service")
@SessionAttributes("servicePage")
public class ServiceController extends BaseController{

	@Resource
	private ServiceMapper serMapper;
	
	@Resource
	private AccountMapper accMapper;
	
	@Resource
	private CostMapper costMapper;
	
	@RequestMapping("/findService.do")
	public String find(ServicePage page,Model model){
		List<Map<String,Object>> list = serMapper.findByPage(page);
		model.addAttribute("services",list);
		int rows = serMapper.findRows(page);
		page.setRows(rows);
		model.addAttribute("servicePage",page);
		return "service/service_list";
	}
	
	
	
	@RequestMapping("/toAddService.do")
	public String toAdd(Model model){
		//查询全部的资费，发送至页面
		List<Cost> list = costMapper.findAll();
		model.addAttribute("costs",list);
		return "service/add_service";
	}
	
	@RequestMapping("/searchAccount.do")
	@ResponseBody
	public Account searchAccount(String idcardNo){
		//{"account_id":1011,"login_name":"zs"...}
		return accMapper.findByIdcardNo(idcardNo);
	}
	
	@RequestMapping("/addService.do")
	public String add(Service service){
		service.setStatus("0");
		service.setCreate_date(new Timestamp(System.currentTimeMillis()));
		serMapper.save(service);
		return "redirect:findService.do";
	}
	
	@RequestMapping("/pauseService.do")
	@ResponseBody
	public Map<String,Object> pauseService(@RequestParam("service_id") int id){
		Map<String,Object> info = new HashMap<String, Object>();
		
		Service s = new Service();
		s.setService_id(id);
		s.setStatus("1");
		try{
			serMapper.updateStatus(s);
			info.put("success", true);
			info.put("message", "暂停成功！");
		}catch (Exception e){
			e.printStackTrace();
			info.put("success", false);
			info.put("message", "暂停失败，系统发生异常!");
		}
		return info;
	}
	
	@RequestMapping("/startService.do")
	@ResponseBody
	public Map<String,Object> start(@RequestParam("service_id") int id){
		Map<String,Object> info = new HashMap<String, Object>();
		//判断对应的帐务帐号是否处于开通状态
		Service ser = serMapper.findById(id);
		Account acc = accMapper.findByAccountId(ser.getAccount_id());
		if(!acc.getStatus().equals("0")){
			info.put("success", false);
			info.put("message", "账务账号没有开通，不允许开通当前业务账号!");
			return info;
		}
		Service s = new Service();
		s.setService_id(id);
		s.setStatus("0");
		try{
			serMapper.updateStatus(s);
			info.put("success", true);
			info.put("message", "开通成功！");
		}catch (Exception e){
			e.printStackTrace();
			info.put("success", false);
			info.put("message", "开通失败，系统发生异常!");
		}
		return info;
	}
	
	@RequestMapping("/deleteService.do")
	@ResponseBody
	public Map<String,Object> delete(@RequestParam("service_id") int id){
		Map<String,Object> info = new HashMap<String, Object>();
		
		Service s = new Service();
		s.setService_id(id);
		s.setStatus("2");
		try{
			serMapper.updateStatus(s);
			info.put("success", true);
			info.put("message", "删除成功！");
		}catch (Exception e){
			e.printStackTrace();
			info.put("success", false);
			info.put("message", "删除失败，系统发生异常!");
		}
		return info;
	}
	
	@RequestMapping("/toUpdateService.do")
	public String toUpdate(int id, Model model) {
		Service service = serMapper.findById(id);
		model.addAttribute("service", service);
		List<Cost> list = costMapper.findAll();
		model.addAttribute("costs", list);
		return "service/update_service";
	}
	
	@RequestMapping("/updateService.do")
	public String update(Service service) {
		serMapper.update(service);
		return "redirect:findService.do";
	}
	
	
	
	

	
	
	
	
}
