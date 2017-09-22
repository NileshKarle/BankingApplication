package com.bridgelabs.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.bridgelabs.model.BankingDetails;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
public class Bankdao {
	Connection conn = null;
	PreparedStatement pstmt = null;

	public void CollectBankData(BankingDetails obj) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");
			String query = "INSERT INTO bank (name,bankName,accountNumber,city,user_id) VALUES (?,?,?,?,?)";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setString(1, obj.getName());
			pstmt.setString(2, obj.getBankName());
			pstmt.setInt(3, obj.getAccountNumber());
			pstmt.setString(4, obj.getCity());
			pstmt.setInt(5, obj.getUser_id());
			System.out.println("Inserted " + pstmt.executeUpdate());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			else {
				conn = null;
			}

		}
	}
	public JSONArray CollectBankData(String city, String name){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");	
			JSONArray array =new JSONArray();
			String query="SELECT id FROM user WHERE name = ?";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setString(1, name);
			ResultSet rs = (ResultSet) pstmt.executeQuery();
			rs.next();
			int userId= rs.getInt("id");
			query = "SELECT * FROM bank WHERE city = ? and user_id = ?";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setString(1, city);
			pstmt.setInt(2, userId);
			rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				JSONObject object=new JSONObject();
				object.put("id",rs.getString("id"));
				object.put("name",rs.getString("name"));
				object.put("bankName",rs.getString("bankName"));
				object.put("accountNumber",rs.getString("accountNumber"));
				object.put("city",rs.getString("city"));
				array.put(object);
			}
			return array;
		} catch (ClassNotFoundException | SQLException | JSONException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			else {
				conn = null;
			}

		}
		return null;
	} 
	
public void RemoveRow(int id){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");	
			String query="DELETE FROM bank WHERE id = ?";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			else {
				conn = null;
			}

		}
}

public JSONObject RowData(int id){
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
				"root");	
		JSONObject object=new JSONObject();
		String query="SELECT * FROM bank WHERE id = ?";
		pstmt = (PreparedStatement) conn.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs=  (ResultSet) pstmt.executeQuery();
		while (rs.next()) {
		
			object.put("id",rs.getString("id"));
			object.put("name",rs.getString("name"));
			object.put("bankName",rs.getString("bankName"));
			object.put("accountNumber",rs.getString("accountNumber"));
			object.put("city",rs.getString("city"));
		}
		return object;
		
		
	} catch (ClassNotFoundException | SQLException | JSONException e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else {
			conn = null;
		}

	}
	return null;
}

public void editRow(int id,String name,String bankName,int accountNumber,String city){
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
				"root");	
		String query=" UPDATE bank SET name=? , bankName= ?, accountNumber= ?, city=? where id=?";
		pstmt = (PreparedStatement) conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, bankName);
		pstmt.setInt(3, accountNumber);
		pstmt.setString(4, city);
		pstmt.setInt(5, id);
		pstmt.executeUpdate();			
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else {
			conn = null;
		}

	}
}
}
