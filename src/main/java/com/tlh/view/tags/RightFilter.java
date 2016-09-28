package com.tlh.view.tags;

import com.tlh.util.ValidateUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class RightFilter implements Tag {
	private String url;
	private PageContext pageContext;

	public int doEndTag() throws JspException {
		return 0;
	}

	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		return ValidateUtil.hasRight(this.url, request) ? 1 : 0;
	}

	public Tag getParent() {
		return null;
	}

	public void release() {
	}

	public void setPageContext(PageContext arg0) {
		this.pageContext = arg0;
	}

	public void setParent(Tag arg0) {
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}