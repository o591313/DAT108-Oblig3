package no.hvl.dat108.Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import no.hvl.dat108.ShoppingList;

public class InnloggingUtil {
	
	public static boolean isValidPassword(String password, String correctPassword) {
		return password != null && password.equals(correctPassword);
	}

	public static boolean isLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("list") != null;
	}

	public static void logInWithTimeout(HttpServletRequest request, int timeout) {
		logOut(request);
		HttpSession session = request.getSession(true);
		session.setMaxInactiveInterval(timeout);
		session.setAttribute("list", new ShoppingList());
	}

	public static void logOut(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}
}