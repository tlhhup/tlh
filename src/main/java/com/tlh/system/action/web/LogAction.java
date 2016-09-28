package com.tlh.system.action.web;

import com.tlh.entity.Log;
import com.tlh.system.service.LogService;
import com.tlh.view.QueryResult;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({ "/web/logAction" })
public class LogAction {

	@Resource
	private LogService logService;

	@RequestMapping({ "/index" })
	public String index() {
		return "admin/log/index";
	}

	@RequestMapping({ "/queryLogInfos" })
	@ResponseBody
	public QueryResult<Log> queryLogInfos(Log log) throws Exception {
		return this.logService.getDataGrid(log);
	}
}