package com.tarena.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.CostMapper;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;

@Controller
@RequestMapping("/cost")
//@SessionAttributes注解的作用是将指定的变量作用域声明为session级别
@SessionAttributes("costPage")
public class CostController {

	@Resource
	private CostMapper costMapper;
	
	/**
	 * 分页查询资费
	 * @param page
	 * 用于接受页面传入的分页条件
	 * 
	 * Spring MVC在Controller方法调用前，创建参数对象，是不依赖于容器的，实际上它是通过类反射
	 * 读取的参数类型并创建这个参数对象的。因此无论是否将参数放到容器中，SpringMVC都不会通过容器来
	 * 创建参数对象，因此参数对象中的依赖注入在此处是无效的。
	 * 
	 * 1.默认情况下，page参数是SpringMVC自动new出来的，然后它会从本次请求的request中将参数取出来给
	 * 这个对象赋值。
	 * 2.1如果session中有一个变量，并且该变量名就是参数对象类名（首字母小写），则SpringMVC不会new这个
	 * 参数对象，而是直接从session中将此变量取出，给参数赋值。该行为是@SessionAttributes注解实现的。
	 * 2.2在此之后，SpringMVC会从request中将本次请求包含的新数据赋值给参数对象，但是这个参数对象不是new
	 * 出来的，是从session中取出的。如果本次请求没有新的数据，则不会给参数对象赋值。
	 * @return
	 */
	@RequestMapping("/findCost.do")
	public String find(CostPage page,Model model) {
		//查询当前页的资费
		List<Cost> list = costMapper.findByPage(page);
		//发送至页面
		model.addAttribute("costs", list);
		//查询出总行数，并计算出总页数，发送至页面用于循环输出页码
		//将当前页传至页面，用于勾选当前项:
		//即需要将总页数和当前页传至页面
		int rows = costMapper.findRows();
		//将总行数注入配置对象，再在页面使用totalPage调用其方法时自动计算出总页数
		page.setRows(rows);
		//由于@SessionAttributes注解声明了costPage变量，因此这里Spring MVC会使用session来传递
		//该变量的值,而默认情况下是使用request。
		model.addAttribute("costPage", page);
		//转发到页面
		return "cost/cost_list";
	}
	
	/**
	 * 打开资费新增页面
	 * @return
	 */
	@RequestMapping("/toAddCost.do")
	public String toAdd(){
		//没有任何业务，直接转发到新增页面
		//测试异常
		//Integer.valueOf("abc");
		return "cost/add_cost";
	}
	
	/**
	 * 新增保存
	 * 
	 * 提交表单时，表单中的参数自动的传递到方法的参数中
	 * 这个过程是SpringMVC自动处理的，实际上SpringMVC采用了傻瓜式的处理方式，
	 * 对此进行了处理，它会遍历方法中的每一个参数，然后做如下操作：
	 * 1.如果当前的参数是实体对象，则它会判断文本框的name属性值是否与对象中的属性名一致,若一致则将此文本框的值注入给这个属性；
	 * 2.如果当前的参数是基本类型，则它会判断文本框的name属性值是否与参数名称一致，若一致则将此文本框的值赋值给这个参数。
	 * 
	 * 上述行为是在当前的方法调用之前，由SpringMVC自动执行的
	 * @param cost
	 * @return
	 */
	@RequestMapping("/addCost.do")
	public String add(Cost cost){
		//设置默认值
		cost.setStatus("1");//新增资费默认状态是暂停状态
		//创建时间是默认系统时间
		cost.setCreatime(new Timestamp(System.currentTimeMillis()));
		//保存资费
		costMapper.save(cost);
		//重定向到查询
		return "redirect:findCost.do";
	}
	
	/**
	 * 打开修改页面
	 * @param cost
	 * @return
	 */
	@RequestMapping("/toUpdateCost.do")
	public String toUpdate(int id,Model model){
		//根据id查询出要修改的资费
		Cost cost = costMapper.findById(id);
		//将此要修改的资费发送到修改页面
		model.addAttribute("cost", cost);
		//转发到修改页面
		return"cost/update_cost";
	}
	
	/**
	 * 修改保存资费数据
	 * @param cost
	 * @return
	 */
	@RequestMapping("/updateCost.do")
	public String update(Cost cost){
		//修改保存资费
		costMapper.update(cost);
		//重定向到查询
		return "redirect:findCost.do";
	}
	
	/**
	 * 删除资费数据
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteCost.do")
	public String delete(int id){
		costMapper.delete(id);
		return "redirect:findCost.do";
	}
	
	@RequestMapping("/startCost.do")
	public String start(int id){
		costMapper.start(id);
		return "redirect:findCost.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
