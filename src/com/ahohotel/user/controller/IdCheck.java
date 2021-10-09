package com.ahohotel.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.user.model.dto.AhoUserDTO;
import com.ahohotel.user.model.service.AhoUserService;
import com.google.gson.Gson;

@WebServlet("/idcheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public IdCheck() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("test");
    	
    	String id = request.getParameter("id");
    	
    	AhoUserService idcheck = new AhoUserService();
    	
    	String idresult = idcheck.idCheck(id);
    	
    	String jsonString = new Gson().toJson(idresult);
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	PrintWriter out = response.getWriter();
    	out.print(jsonString);
		out.flush();
		out.close();

	}

}
