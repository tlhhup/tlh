package com.tlh.entity;

import java.util.Date;

public class Log extends BaseEntity
{
  private static final long serialVersionUID = 1L;
  private String id;
  private String operator;
  private Date operTime;
  private String operName;
  private String operParams;
  private String operResult;
  private String resultMsg;
  private String ip;

  public String getId()
  {
    return this.id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getOperator() {
    return this.operator;
  }

  public void setOperator(String operator) {
    this.operator = operator;
  }

  public Date getOperTime() {
    return this.operTime;
  }

  public void setOperTime(Date operTime) {
    this.operTime = operTime;
  }

  public String getOperName() {
    return this.operName;
  }

  public void setOperName(String operName) {
    this.operName = operName;
  }

  public String getOperParams() {
    return this.operParams;
  }

  public void setOperParams(String operParams) {
    this.operParams = operParams;
  }

  public String getOperResult() {
    return this.operResult;
  }

  public void setOperResult(String operResult) {
    this.operResult = operResult;
  }

  public String getResultMsg() {
    return this.resultMsg;
  }

  public void setResultMsg(String resultMsg) {
    this.resultMsg = resultMsg;
  }

  public String getIp() {
    return this.ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }
}