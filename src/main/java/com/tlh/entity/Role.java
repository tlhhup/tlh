package com.tlh.entity;

import java.util.List;

public class Role extends BaseEntity
{
  private static final long serialVersionUID = 1L;
  private Integer id;
  private String roleName;
  private String roleDesc;
  private String roleValue;
  private List<Menu> menus;

  public Integer getId()
  {
    return this.id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getRoleName() {
    return this.roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  public String getRoleDesc() {
    return this.roleDesc;
  }

  public void setRoleDesc(String roleDesc) {
    this.roleDesc = roleDesc;
  }

  public String getRoleValue() {
    return this.roleValue;
  }

  public void setRoleValue(String roleValue) {
    this.roleValue = roleValue;
  }

  public List<Menu> getMenus() {
    return this.menus;
  }

  public void setMenus(List<Menu> menus) {
    this.menus = menus;
  }
}