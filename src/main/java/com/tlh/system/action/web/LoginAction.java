package com.tlh.system.action.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlh.entity.Menu;
import com.tlh.entity.User;
import com.tlh.system.service.MenuService;
import com.tlh.system.service.UserService;
import com.tlh.view.ParameterObject;

@Controller
@RequestMapping("/web/loginAction")
public class LoginAction {
	
	@Resource
	private UserService userService;
	
	@Resource
	private MenuService menuService;
	
	@RequestMapping("/main")
	public String main(){
		return "layout/main";
	}
	
	@RequestMapping("/home")
	public String home(){
		return "layout/cale";
	}
	
	@RequestMapping("/menu")
	public String menu(@RequestParam(value="id",defaultValue="3")Integer id,HttpServletRequest request) throws Exception{
		Menu menu=new Menu();
		menu.setId(id);
		request.setAttribute("menus", this.menuService.findAllMenus(menu));
		return "layout/menu";
	}
	
	@RequestMapping("login")
	public @ResponseBody ParameterObject login(User user,HttpSession session,String valCode) throws Exception{
		ParameterObject result=new ParameterObject();
		
		// 验证码 
		Object objValCode =session.getAttribute("valCode"); 
		if(objValCode==null||!objValCode.toString().equals(valCode)){
			result.flag(false);
			result.msg("验证码错误！");
			return result;
		}
		
		user = this.userService.getEntity(user);
		if(user!=null){
			//更新登录信息
			this.userService.updateLoginInfo(user);
			int maxRightPos = this.menuService.getMaxRightPos();
			user.setRightSum(new long[maxRightPos+1]);
			//计算权限总和
			user.calculateRightSum();
			session.setAttribute("user", user);
			result.flag(true);
			result.msg("登录成功！");
		}else{
			result.flag(false);
			result.msg("登录失败！");
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	
}
