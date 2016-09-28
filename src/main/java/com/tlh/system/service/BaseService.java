package com.tlh.system.service;

import java.util.List;

import com.tlh.view.QueryResult;

/**
 * 定义service层的接口
 * @author hp
 */
public interface BaseService<T> {

	public boolean saveEntity(T t) throws Exception;

	public boolean deleteEntity(T t) throws Exception;

	public boolean updateEntity(T t) throws Exception;

	public T getEntity(T t) throws Exception;

	public List<T> findEntity(T t) throws Exception;

	/**
	 * easyui数据：分页查询
	 */
	public QueryResult<T> getDataGrid(T t) throws Exception;

}
