package com.tlh.system.mapper;

import java.util.List;
import java.util.Map;

public abstract interface BaseMapper {
	public abstract int saveEntity(Map<String, Object> paramMap) throws Exception;

	public abstract int deleteEntity(Map<String, Object> paramMap) throws Exception;

	public abstract int updateEntity(Map<String, Object> paramMap) throws Exception;

	public abstract List<Map<String, Object>> findEntity(Map<String, Object> paramMap) throws Exception;

	public abstract int getCount(Map<String, Object> paramMap) throws Exception;
}