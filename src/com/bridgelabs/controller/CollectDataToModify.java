package com.bridgelabs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.bridgelabs.dao.Bankdao;
@WebServlet("/CollectDataToModify")
public class CollectDataToModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out =new PrintWriter(response.getWriter());
		
		int personId =Integer.parseInt(request.getParameter("id"));
		Bankdao bank=new Bankdao();
		 JSONObject RowValue= bank.RowData(personId);
		
			out.println(RowValue.toString());
			out.close();
	}
}
