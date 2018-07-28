package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.service.AreaService;

@Controller
@RequestMapping(value = "/area")
public class AreaControl {
	@Autowired
	private AreaService areaService;

	public static Logger log = Logger.getLogger(AreaControl.class);

	@RequestMapping(value = "/getAreaList.do", method = { RequestMethod.GET })
	public void getList(HttpServletRequest req, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("datas", areaService.init());
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(JSON.toJSONString(map));
			out.flush();
			out.close();
		} catch (IOException e) {
			log.error("AreaControl-->getList报错:" + e);
		}
	}

	@RequestMapping(value = "/addArea.do", method = { RequestMethod.POST })
	public void addArea(HttpServletRequest req, HttpServletResponse response,
			String name) {
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			areaService.addArea(URLDecoder.decode(name, "UTF-8"));
			out = response.getWriter();
			out.print(JSON.parse("{code:0}"));
		} catch (Exception e) {
			log.error("AreaControl-->addArea报错:" + e.toString());
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

	public AreaService getAreaService() {
		return areaService;
	}

	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

}
