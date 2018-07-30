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
import com.dto.AreaDto;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping(value = "/myschool")
public class SchoolControl {

	public static Logger log = Logger.getLogger(SchoolControl.class);

	@Autowired
	private BaseMapper baseMapper;

	/**
	 * 初始化页面
	 */
	@RequestMapping(value = "/init.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init() {
		return "school";
	}
	
	/**
	 * 获取学校信息
	 * 
	 * @param req
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/getSchoolList.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getSchoolList(HttpServletRequest req,
			HttpServletResponse response, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("datas", baseMapper.selectSchools());
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

	/**
	 * 删除区域信息
	 * 
	 * @param req
	 * @param response
	 * @param name
	 */
	@RequestMapping(value = "/delArea.do", method = { RequestMethod.POST })
	public void delArea(HttpServletRequest req, HttpServletResponse response,
			int id) {
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			int num = baseMapper.deleteArea(id);
			out = response.getWriter();
			if (num > 0) {
				out.print(JSON.parse("{code:0}"));
			} else {
				out.print(JSON.parse("{code:1}"));
			}
		} catch (Exception e) {
			log.error("delArea报错:" + e.toString());
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

	/**
	 * 修改区域信息
	 * 
	 * @param req
	 * @param response
	 * @param name
	 */
	@RequestMapping(value = "/updArea.do", method = { RequestMethod.POST })
	public void updArea(HttpServletRequest req, HttpServletResponse response,
			int id, String name) {
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			AreaDto areaDto = new AreaDto();
			areaDto.setId(id);
			areaDto.setName(URLDecoder.decode(name, "UTF-8"));
			int num = baseMapper.updateArea(areaDto);
			out = response.getWriter();
			if (num > 0) {
				out.print(JSON.parse("{code:0}"));
			} else {
				out.print(JSON.parse("{code:1}"));
			}
		} catch (Exception e) {
			log.error("updArea报错:" + e.toString());
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
