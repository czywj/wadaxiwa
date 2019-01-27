package com.tarena.util;

import java.beans.PropertyEditorSupport;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * 自定义的日期类型，可以将表单中的日期字符串转换成java.sql.Date
 * @author tarena
 *
 */
public class DateEditor extends PropertyEditorSupport {
	
	//默认支持的转换的日期格式
	private String pattern = "yyyy-MM-dd";
	
	public DateEditor(){
		
	}

	public DateEditor(String pattern) {
		super();
		this.pattern = pattern;
	}

	/**
	 * 将表单中的字符串转转为对象中的属性
	 * text参数就是表单中的日期字符串，我们需要将其转换成java.sql.Date再回传给Spring
	 */
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(text == null || text.length() == 0){
			//如果参数为空，直接将null传回给Spring
			super.setValue(null);
		}else{
			//如果参数不为空，则将其转换为java.sql.Date再回传Spring
			SimpleDateFormat sf = new SimpleDateFormat(this.pattern);
			String dateStr = sf.format(Date.valueOf(text));
			super.setValue(Date.valueOf(dateStr));
		}
		
		
	}

	


}
