package com.tlh.system.mapper;

import com.tlh.entity.Log;
import java.util.List;

public abstract interface LogMapper
{
  public abstract int saveLogs(Log paramLog)
    throws Exception;

  public abstract List<Log> queryLogs(Log paramLog)
    throws Exception;

  public abstract int queryLogsCounts(Log paramLog)
    throws Exception;
}