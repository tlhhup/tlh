package com.tlh.entity;

import java.util.HashSet;
import java.util.Set;

public class JpushInfoEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;
	public static final String ALAIS = "alais";
	public static final String TAGS = "tags";
	public static final String ALL = "all";
	private String message;
	private String type;
	private String alias;
	private Set<String> tags = new HashSet<String>();

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAlias() {
		return this.alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public Set<String> getTags() {
		return this.tags;
	}

	public void setTags(String tags) {
		this.tags.add(tags);
	}
}