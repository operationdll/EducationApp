package com.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.service.SchoolService;

@Controller
@RequestMapping(value = "/school")
public class SchoolControl {
	@Autowired
	private SchoolService schoolsService;

	@Autowired
	@Qualifier("mailSender")
	private JavaMailSender mailSender;

	public static Logger log = Logger.getLogger(SchoolControl.class);

	@RequestMapping(value = "/getList.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getList(HttpServletRequest req, HttpServletResponse response,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("datas", schoolsService.init());
		response.setContentType("application/json");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(JSON.toJSONString(map));
			out.flush();
			out.close();
		} catch (IOException e) {
			log.error("MyControl-->getList报错:" + e);
		}
	}

	/**
	 * 初始化页面
	 */
	@RequestMapping(value = "/init.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init(HttpServletRequest req, HttpServletResponse response,
			Model model) {
		return "schoolList";
	}

	/**
	 * 导入
	 */
	@RequestMapping(value = "/testImport.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	public void testImport(MultipartHttpServletRequest request,
			HttpServletResponse response, String taskCde) throws Exception {
		PrintWriter out = null;
		try {
			MultipartFile mpf = request.getFile("file");
			System.out.println(mpf.getOriginalFilename());
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print("{'retStr':'导入成功!'");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	/**
	 * 导出
	 */
	@RequestMapping(value = "/exportFile.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	public void exportFile(String url, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		OutputStream os = null;
		try {
			File file = new File(url);
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			byte[] bytes = new byte[1024];
			int len = 0;
			response.reset();
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ file.getName());
			os = response.getOutputStream();
			while ((len = bis.read(bytes)) > 0) {
				os.write(bytes, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != os)
					os.close();
				if (null != bis)
					bis.close();
				if (null != fis)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 发送邮件
	 */
	@SuppressWarnings("unused")
	private void sendMail() {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper;
			helper = new MimeMessageHelper(message, true);
			// 收件人
			helper.setTo("co-duanlanling001@ejintai.com");
			// 抄送人
			helper.setCc("co-liuzhaoqiang001@ejintai.com");
			// 发件人(默认为mail.from)
			helper.setFrom("co-tanzhiyuan001@ejintai.com");
			helper.setText("测试数据!");
			// 添加附件
			FileSystemResource file = new FileSystemResource(new File(
					"D:/a.jpg"));
			helper.addAttachment("c.jpg", file);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public SchoolService getSchoolsService() {
		return schoolsService;
	}

	public void setSchoolsService(SchoolService schoolsService) {
		this.schoolsService = schoolsService;
	}

}
