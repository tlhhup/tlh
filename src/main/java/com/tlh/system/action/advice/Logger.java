package com.tlh.system.action.advice;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tlh.entity.Log;
import com.tlh.entity.User;
import com.tlh.system.service.LogService;

public class Logger {
	private LogService logService;

	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	public Object record(ProceedingJoinPoint point) throws Exception {
		Log log = new Log();
		try {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			if (attr != null) {
				HttpServletRequest request = attr.getRequest();
				if (request != null) {
					User user = (User) request.getSession().getAttribute("user");
					if (user != null)
						log.setOperator(user.getRealName());
					else {
						log.setOperator("");
					}

					log.setIp(request.getRemoteAddr());
				}
			}

			String methodName = point.getSignature().getName();
			log.setOperName(methodName);

			Object[] args = point.getArgs();
			log.setOperParams(StringUtils.arrayToCommaDelimitedString(args));

			Object result = point.proceed();
			log.setOperResult("success");

			if (result != null) {
				log.setResultMsg(result.toString());
			}
			Object localObject2 = result;
			return localObject2;
		} catch (Throwable e) {
			log.setOperResult("failure");
			log.setResultMsg(e.getMessage());
		} finally {
			this.logService.saveEntity(log);
		}
		return null;
	}
}