package com.tlh.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;

public class LoggerUtil {
	private static Logger logger = LoggerFactory.getLogger(LoggerUtil.class);
	private static Marker marker = MarkerFactory.getMarker("com.mpms");

	public static void d(String msg) {
		logger.debug(marker, msg);
	}

	public static void i(String msg) {
		logger.info(marker, msg);
	}

	public static void w(String msg) {
		logger.warn(marker, msg);
	}

	public static void e(String msg) {
		logger.error(marker, msg);
	}
}