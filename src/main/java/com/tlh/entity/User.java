package com.tlh.entity;

import java.util.Date;
import java.util.List;

public class User extends BaseEntity
{
  private static final long serialVersionUID = 1L;
  private Integer id;
  private String userName;
  private String password;
  private Date registTime;
  private Date lastLogin;
  private int loginCount;
  private String realName;
  private long[] rightSum;
  private boolean superAdmin;
  private List<Role> roles;

  public Integer getId()
  {
    return this.id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUserName() {
    return this.userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Date getRegistTime() {
    return this.registTime;
  }

  public void setRegistTime(Date registTime) {
    this.registTime = registTime;
  }

  public Date getLastLogin() {
    return this.lastLogin;
  }

  public void setLastLogin(Date lastLogin) {
    this.lastLogin = lastLogin;
  }

  public int getLoginCount() {
    return this.loginCount;
  }

  public void setLoginCount(int loginCount) {
    this.loginCount = loginCount;
  }

  public String getRealName() {
    return this.realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }

  public List<Role> getRoles() {
    return this.roles;
  }

  public void setRoles(List<Role> roles) {
    this.roles = roles;
  }

  public long[] getRightSum() {
    return this.rightSum;
  }

  public void setRightSum(long[] rightSum) {
    this.rightSum = rightSum;
  }

  public boolean isSuperAdmin() {
    return this.superAdmin;
  }

  public void setSuperAdmin(boolean superAdmin) {
    this.superAdmin = superAdmin;
  }

  public void calculateRightSum()
  {
    int rightPos = 0;
    long rightCode = 0L;
    for (Role role : this.roles) {
      if ("-1".equals(role.getRoleValue())) {
        this.superAdmin = true;
        this.roles = null;
        return;
      }
      for (Menu r : role.getMenus()) {
        rightPos = r.getRightPos();
        rightCode = r.getRightCode();
        this.rightSum[rightPos] |= rightCode;
      }
    }
    this.roles = null;
  }

  public boolean hasRight(Menu right)
  {
    int pos = right.getRightPos();
    long code = right.getRightCode();
    long r = this.rightSum[pos] & code;
    return r != 0L;
  }
}