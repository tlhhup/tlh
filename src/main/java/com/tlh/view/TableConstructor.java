package com.tlh.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TableConstructor extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;

	public void setTableName(String tableName) {
		put("tableName", tableName);
	}

	public void setColumns(List<String> columns) {
		put("columns", columns);
	}

	public void setValues(Map<String, Object> values) {
		put("values", values);
	}

	public void setQueryWhere() {
	}
}