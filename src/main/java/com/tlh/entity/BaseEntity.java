package com.tlh.entity;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Date;

public abstract class BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private int from;
	private int page = 1;
	private int rows = 10;

	public int getFrom() {
		this.from = ((this.page - 1) * this.rows);
		return this.from;
	}

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return this.rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String toString() {
		StringBuffer buffer = new StringBuffer();
		String className = getClass().getSimpleName();
		buffer.append(className + "{");
		try {
			Field[] fields = getClass().getDeclaredFields();
			Class<?> ftype = null;
			for (Field f : fields) {
				ftype = f.getType();
				if ((!ftype.isPrimitive()) && (ftype != String.class) && (ftype != Integer.class)
						&& (ftype != Long.class)
						&& ((ftype != Date.class) || (!Modifier.isStatic(ftype.getModifiers()))))
					continue;
				f.setAccessible(true);
				buffer.append(f.getName() + ":" + f.get(this) + ",");
			}

			buffer.deleteCharAt(buffer.toString().lastIndexOf(",")).append("}");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
}