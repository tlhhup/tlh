package com.tlh.entity;

import com.tlh.system.annotation.Id;
import com.tlh.system.annotation.Table;

@Table(tableName="sys_department")
public class Department extends BaseEntity
{
  private static final long serialVersionUID = 1L;

  @Id(name="id",isAotu=false)
  private String id;
  private String name;
  private String description;

  public String getId()
  {
    return this.id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return this.description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
}