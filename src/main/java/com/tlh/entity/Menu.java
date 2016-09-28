package com.tlh.entity;

public class Menu extends BaseEntity
{
  private static final long serialVersionUID = 1L;
  private Integer id;
  private String title;
  private String url;
  private int sort;
  private int serials;
  private String icon;
  private int rightPos;
  private long rightCode;
  private Integer pId;
  private boolean isButton;

  public Integer getId()
  {
    return this.id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getTitle() {
    return this.title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getUrl() {
    return this.url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public int getSort() {
    return this.sort;
  }

  public void setSort(int sort) {
    this.sort = sort;
  }

  public int getSerials() {
    return this.serials;
  }

  public void setSerials(int serials) {
    this.serials = serials;
  }

  public String getIcon() {
    return this.icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }

  public int getRightPos() {
    return this.rightPos;
  }

  public void setRightPos(int rightPos) {
    this.rightPos = rightPos;
  }

  public long getRightCode() {
    return this.rightCode;
  }

  public void setRightCode(long rightCode) {
    this.rightCode = rightCode;
  }

  public Integer getpId() {
    return this.pId;
  }

  public void setpId(Integer pId) {
    this.pId = pId;
  }

  public boolean getIsButton() {
    return this.isButton;
  }

  public void setIsButton(boolean isButton) {
    this.isButton = isButton;
  }
}