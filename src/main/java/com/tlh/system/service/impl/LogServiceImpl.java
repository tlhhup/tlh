package com.tlh.system.service.impl;

import com.tlh.entity.Log;
import com.tlh.system.mapper.LogMapper;
import com.tlh.system.service.LogService;
import com.tlh.view.QueryResult;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Resource
	private LogMapper logMapper;

	public boolean saveEntity(Log t) throws Exception {
		return this.logMapper.saveLogs(t) > 0;
	}

	public boolean deleteEntity(Log id) throws Exception {
		return false;
	}

	public boolean updateEntity(Log t) throws Exception {
		return false;
	}

	public Log getEntity(Log id) throws Exception {
		return null;
	}

	public List<Log> findEntity(Log t) throws Exception {
		return null;
	}

	public QueryResult<Log> getDataGrid(Log t) throws Exception {
		return new QueryResult<Log>(this.logMapper.queryLogsCounts(t), this.logMapper.queryLogs(t));
	}
}