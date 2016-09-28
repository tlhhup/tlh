package com.tlh.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthCodeUitl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int AUTHCODE_LENGTH = 5;
	public static final int SINGLECODE_WIDTH = 15;
	public static final int SINGLECODE_HEIGHT = 30;
	public static final int SINGLECODE_GAP = 4;
	public static final int IMG_WIDTH = 95;
	public static final int IMG_HEIGHT = 30;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String authCode = getAuthCode();

		request.getSession().setAttribute("valCode", authCode);
		try {
			ImageIO.write(getAuthImg(authCode), "JPEG", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String getAuthCode() {
		String authCode = "";
		for (int i = 0; i < 5; i++) {
			authCode = authCode + new Random().nextInt(10);
		}
		return authCode;
	}

	private BufferedImage getAuthImg(String authCode) {
		BufferedImage img = new BufferedImage(95, 30, 4);

		Graphics g = img.getGraphics();

		g.setColor(Color.WHITE);

		g.fillRect(0, 0, 95, 30);

		g.setColor(Color.BLACK);

		g.setFont(new Font("宋体", 0, 35));

		for (int i = 0; i < authCode.toCharArray().length; i++) {
			char c = authCode.charAt(i);

			g.drawString(c + "", i * 19 + 2, 30);
		}
		Random random = new Random();

		for (int i = 0; i < 20; i++) {
			int x = random.nextInt(95);
			int y = random.nextInt(30);
			int x2 = random.nextInt(95);
			int y2 = random.nextInt(30);
			g.drawLine(x, y, x + x2, y + y2);
		}
		return img;
	}
}