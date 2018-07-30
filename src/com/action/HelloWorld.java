package com.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.alibaba.fastjson.JSON;
import com.dao.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping(value = "/school")
public class HelloWorld {

	public static Logger log = Logger.getLogger(HelloWorld.class);

	@Autowired
	private BaseMapper baseMapper;

	/**
	 * 登录验证方法
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void login(HttpServletRequest req, HttpServletResponse response,
			Model model, String userName, String password) {
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			String code = "{code:0}";
			if (!"admin".equals(userName)) {
				code = "{code:1}";
			} else if (!"admin123".equals(password)) {
				code = "{code:2}";
			}
			out = response.getWriter();
			out.print(JSON.parse(code));
			out.flush();
			out.close();
		} catch (Exception e) {
			log.error("login报错:" + e);
		}
	}

	/**
	 * 初始化页面
	 */
	@RequestMapping(value = "/init.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init() {
		return "list";
	}

	/**
	 * 获取区域信息
	 * 
	 * @param req
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/getAreaList.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getAreaList(HttpServletRequest req,
			HttpServletResponse response, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("datas", baseMapper.selectAreas());
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(JSON.toJSONString(map));
			out.flush();
			out.close();
		} catch (Exception e) {
			log.error("getAreaList报错:" + e);
		}
	}

	/**
	 * 增加区域信息
	 * 
	 * @param req
	 * @param response
	 * @param name
	 */
	@RequestMapping(value = "/addArea.do", method = { RequestMethod.POST })
	public void addArea(HttpServletRequest req, HttpServletResponse response,
			String name) {
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			int num = baseMapper.insertArea(URLDecoder.decode(name, "UTF-8"));
			out = response.getWriter();
			if (num > 0) {
				out.print(JSON.parse("{code:0}"));
			} else {
				out.print(JSON.parse("{code:1}"));
			}
		} catch (Exception e) {
			log.error("addArea报错:" + e.toString());
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

	public BaseMapper getBaseMapper() {
		return baseMapper;
	}

	public void setBaseMapper(BaseMapper baseMapper) {
		this.baseMapper = baseMapper;
	}
}