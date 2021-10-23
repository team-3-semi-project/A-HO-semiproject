package com.ahohotel.website.termsOfUse;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/termsOfUse")
public class TermsOfUseServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tab = request.getParameter("tab");
//		System.out.println(tab);
		
		if (tab == null) {
			tab = "term1";
		}
		
		String path = "/WEB-INF/view/website/termsOfUse.jsp";
		request.setAttribute("tab", tab);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
