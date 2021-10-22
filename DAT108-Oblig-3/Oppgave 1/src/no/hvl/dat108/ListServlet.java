package no.hvl.dat108;

import static no.hvl.dat108.UrlMap.*;
import static no.hvl.dat108.Utils.InnloggingUtil.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.text.StringEscapeUtils;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isLoggedIn(request)) {
			response.sendRedirect(LOGIN_URL + "?unauthorizedAccess");
		} else {
			
			HttpSession session = request.getSession(false);

			ShoppingList list = (ShoppingList) session.getAttribute("list");

			response.setContentType("text/html; charset=ISO-8859-1");

			request.setAttribute("list", list);
			request.setAttribute("isListEmpty", list.getItems().size() == 0);
			request.getRequestDispatcher("list.jsp").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isLoggedIn(request)) {
			response.sendRedirect(LOGIN_URL + "?unauthorizedAccess");
		} else {

			HttpSession session = request.getSession(false);

			String addItem = request.getParameter("item");
			String removeItem = request.getParameter("removeItem");

			ShoppingList list = (ShoppingList) session.getAttribute("list");

			if (addItem != null && !addItem.equals(""))
				list.addItem(StringEscapeUtils.escapeHtml4(addItem));
			else if (removeItem != null)
				list.removeItem(removeItem);

			response.sendRedirect(LIST_URL);

		}
	}
}
