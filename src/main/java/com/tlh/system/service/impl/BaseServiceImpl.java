package com.tlh.system.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import com.tlh.system.annotation.Column;
import com.tlh.system.annotation.Id;
import com.tlh.system.annotation.Table;
import com.tlh.system.mapper.BaseMapper;
import com.tlh.system.service.BaseService;
import com.tlh.view.ParameterObject;

public abstract class BaseServiceImpl<T> implements BaseService<T> {
	private Class<T> clazz;

	@Resource
	private BaseMapper baseMapper;

	@SuppressWarnings("unchecked")
	public BaseServiceImpl() {
		ParameterizedType type = (ParameterizedType) getClass().getGenericSuperclass();
		this.clazz = ((Class<T>) type.getActualTypeArguments()[0]);
	}

	public boolean saveEntity(T t) throws Exception {
		ParameterObject po = new ParameterObject();
		po.put("tableName", getTableName());
		Field[] fields = this.clazz.getDeclaredFields();
		List<String> columns = new ArrayList<String>();
		Map<String,Object> values = new HashMap<String,Object>();
		for (Field field : fields) {
			if (field.getModifiers() == 26) {
				continue;
			}
			field.setAccessible(true);
			Id id = (Id) field.getAnnotation(Id.class);
			if (id != null) {
				if (!id.isAotu()) {
					columns.add(getFiledName(field));
					values.put(getFiledName(field), UUID.randomUUID());
				}
			} else {
				columns.add(getFiledName(field));
				values.put(getFiledName(field), field.get(t));
			}
		}
		po.put("columns", columns);
		po.put("values", values);
		return this.baseMapper.saveEntity(po) > 0;
	}

	public boolean deleteEntity(T t) throws Exception {
		ParameterObject po = new ParameterObject();
		po.put("tableName", getTableName());
		Field[] fields = this.clazz.getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			Id id = (Id) field.getAnnotation(Id.class);
			if (id != null) {
				po.put("id", field.get(t));
			}
		}
		if (po.containsKey("id")) {
			return this.baseMapper.deleteEntity(po) > 0;
		}
		throw new RuntimeException(this.clazz.getName() + " must asigned the id field!");
	}

	public boolean updateEntity(T t) throws Exception {
		ParameterObject po = new ParameterObject();
		po.put("tableName", getTableName());
		List<String> columns = new ArrayList<String>();
		Map<String,Object> values = new HashMap<String,Object>();
		Field[] fields = this.clazz.getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			Id id = (Id) field.getAnnotation(Id.class);
			if (id != null) {
				po.put("id", field.get(t));
			} else {
				columns.add(getFiledName(field));
				values.put(getFiledName(field), field.get(t));
			}
		}
		po.put("columns", columns);
		po.put("values", values);
		if (po.containsKey("id")) {
			return this.baseMapper.updateEntity(po) > 0;
		}
		throw new RuntimeException(this.clazz.getName() + " must asigned the id field!");
	}

	public List<T> findEntity(T t) throws Exception {
		ParameterObject po = new ParameterObject();
		po.put("tableName", getTableName());
		List<Map<String, Object>> queryResuts = this.baseMapper.findEntity(po);
		Field[] fields = this.clazz.getDeclaredFields();
		T entity = null;
		List<T> result = null;
		if (queryResuts != null) {
			result = new ArrayList<T>();
			for (Map<String, Object> q : queryResuts) {
				entity = this.clazz.newInstance();

				for (Field field : fields) {
					if (field.getModifiers() == 26) {
						continue;
					}
					field.setAccessible(true);
					field.set(entity, q.get(getFiledName(field)));
				}
				result.add(entity);
				entity = null;
			}
		}
		return result;
	}

	private String getTableName() throws Exception {
		Table table = (Table) this.clazz.getAnnotation(Table.class);
		if (table != null) {
			String tableName = table.tableName();
			if ((tableName != null) && (!tableName.equals(""))) {
				return tableName;
			}
			return this.clazz.getSimpleName();
		}

		throw new RuntimeException(this.clazz.getSimpleName() + " must asigned the Table annotation!");
	}

	private String getFiledName(Field field) {
		Id id = (Id) field.getAnnotation(Id.class);
		if (id != null) {
			if ((id.name() != null) && (!id.name().equals("")))
				return id.name();
		} else {
			Column column = (Column) field.getAnnotation(Column.class);
			if ((column != null) && (column.name() != null) && (!column.name().equals(""))) {
				return column.name();
			}
		}

		return field.getName();
	}
}