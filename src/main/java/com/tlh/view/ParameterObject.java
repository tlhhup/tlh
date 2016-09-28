package com.tlh.view;

import java.util.HashMap;

public class ParameterObject extends HashMap<String, Object>
{
  private static final long serialVersionUID = 1L;

  public void flag(Boolean value)
  {
    put("flag", value);
  }

  public void msg(String msg) {
    put("msg", msg);
  }
}