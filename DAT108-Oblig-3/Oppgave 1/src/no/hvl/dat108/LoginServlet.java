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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean unauthorizedAccess = request
                .getParameter("unauthorizedAccess") != null;
        boolean invalidPassword = request
                .getParameter("invalidPassword") != null;
        
        
        response.setContentType("text/html; charset=ISO-8859-1");

        request.setAttribute("unauthorizedAccess", unauthorizedAccess);
        request.setAttribute("invalidPassword", invalidPassword);
        request.getRequestDispatcher("login.jsp").forward(request, response);
        
    }
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputPass = request.getParameter("password");	
		String correctPass = getServletContext().getInitParameter("password");
		int timeout = Integer.parseInt(getServletContext().getInitParameter("timeout"));
		
		if(isValidPassword(inputPass, correctPass)) {
			
			logInWithTimeout(request, timeout);
			
			response.sendRedirect(LIST_URL);
			
		} else response.sendRedirect(LOGIN_URL + "?invalidPassword");

	}

}
