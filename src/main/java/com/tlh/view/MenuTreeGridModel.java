package com.tlh.view;

import com.tlh.entity.Menu;
import java.util.ArrayList;
import java.util.List;

public class MenuTreeGridModel extends Menu {
	private static final long serialVersionUID = 1L;
	private String state = "open";
	private List<MenuTreeGridModel> children = new ArrayList<MenuTreeGridModel>();

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<MenuTreeGridModel> getChildren() {
		return this.children;
	}

	public void setChildren(List<MenuTreeGridModel> children) {
		this.children = children;
	}
}