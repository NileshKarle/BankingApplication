package com.bridgelabs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.bridgelabs.dao.Bankdao;
@WebServlet("/CollectDetails")
public class CollectDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String city= request.getParameter("city");
	Bankdao bank=new Bankdao();
	HttpSession session=request.getSession();
	String name= (String) session.getAttribute("name");
	JSONArray bankData = bank.CollectBankData(city,name);
	PrintWriter out =new PrintWriter(response.getWriter());
	out.println(bankData.toString());
	out.close();
	}

}
