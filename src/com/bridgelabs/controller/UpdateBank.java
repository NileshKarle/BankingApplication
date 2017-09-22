package com.bridgelabs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bridgelabs.dao.Bankdao;
import com.bridgelabs.dao.Userdao;
import com.bridgelabs.model.BankingDetails;
@WebServlet("/UpdateBank")
public class UpdateBank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String bankName = request.getParameter("bankName");
		int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		String city = request.getParameter("city");		
		String personId =request.getParameter("id");
		if(personId.equals("0")){
			HttpSession session = request.getSession();
			String userName=(String) session.getAttribute("name");
			Userdao user =new Userdao();
			int user_id=user.id(userName);
		BankingDetails bank = new BankingDetails();
		bank.setName(name);
		bank.setBankName(bankName);
		bank.setAccountNumber(accountNumber);
		bank.setCity(city);
		bank.setUser_id(user_id);
		Bankdao obj = new Bankdao();
		obj.CollectBankData(bank);
		response.sendRedirect("homepage");
		}
		else{
			Bankdao object = new Bankdao();
			int pId=Integer.parseInt(personId); 
			object.editRow(pId, name, bankName,accountNumber,city);
		}
	}

}
