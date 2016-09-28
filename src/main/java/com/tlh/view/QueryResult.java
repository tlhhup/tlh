package com.tlh.view;

import java.util.List;

public class QueryResult<T> {
	private int total;
	private List<T> rows;

	public QueryResult() {
	}

	public QueryResult(int total, List<T> rows) {
		this.total = total;
		this.rows = rows;
	}

	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<T> getRows() {
		return this.rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
}