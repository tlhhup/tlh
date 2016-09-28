package com.tlh.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tlh.entity.Menu;
import com.tlh.entity.User;

public class ValidateUtil {
	@SuppressWarnings("unchecked")
	public static boolean hasRight(String url, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, Menu> allRights = (Map<String, Menu>) session.getServletContext().getAttribute("all_rights_map");
		Menu right = (Menu) allRights.get(url);

		User user = (User) session.getAttribute("user");
		if (user != null) {
			if (user.isSuperAdmin()) {
				return true;
			}
			if (right == null) {
				return true;
			}

			return user.hasRight(right);
		}

		return false;
	}
}