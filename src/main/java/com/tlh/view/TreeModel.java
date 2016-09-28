package com.tlh.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TreeModel {
	private int id;
	private String text;
	private String state = "open";
	private boolean checked;
	private Map<String, Object> attributes = new HashMap<String, Object>();
	private List<TreeModel> children = new ArrayList<TreeModel>();

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return this.checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Map<String, Object> getAttributes() {
		return this.attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public List<TreeModel> getChildren() {
		return this.children;
	}

	public void setChildren(List<TreeModel> children) {
		this.children = children;
	}
}