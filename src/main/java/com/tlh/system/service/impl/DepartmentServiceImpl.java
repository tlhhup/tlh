package com.tlh.system.service.impl;

import com.tlh.entity.Department;
import com.tlh.system.service.DepartmentService;
import com.tlh.view.QueryResult;
import org.springframework.stereotype.Service;

@Service("departmentService")
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements DepartmentService {
	public Department getEntity(Department t) throws Exception {
		return null;
	}

	public QueryResult<Department> getDataGrid(Department t) throws Exception {
		return null;
	}
}