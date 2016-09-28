package com.tlh.system.listener;

import com.tlh.entity.Menu;
import com.tlh.system.service.MenuService;
import com.tlh.util.LoggerUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

@SuppressWarnings("rawtypes")
@Component
public class InitRightListener implements ApplicationListener, ServletContextAware {
private ServletContext sc;
	
	@Resource
	private MenuService menuService;

	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		if(arg0 instanceof ContextRefreshedEvent){//上下文刷新事件
			try {
				List<Menu> rights=menuService.findAllMenuInfos();
				if(rights!=null){
					Map<String, Menu> map=new HashMap<String, Menu>();
					for(Menu r:rights){
						map.put(r.getUrl(), r);
					}
					if(sc!=null){
						sc.setAttribute("all_rights_map", map);
						LoggerUtil.d("初始化权限！");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		this.sc=arg0;
	}
}