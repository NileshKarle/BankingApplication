package com.bridgelabs.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.bridgelabs.model.UserDetails;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class Userdao {

	Connection conn = null;
	PreparedStatement pstmt = null;

	public void CollectUserData(UserDetails obj) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");
			String query = "INSERT INTO user (name,email,password,contact) VALUES (?,?,?,?)";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setString(1, obj.getName());
			pstmt.setString(2, obj.getEmail());
			pstmt.setString(3, obj.getPassword());
			pstmt.setLong(4, obj.getContact());
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

	public String verify(String email, String password) {
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");
			stmt = (Statement) conn.createStatement();
			String query = "SELECT * FROM user";
			ResultSet rs = (ResultSet) stmt.executeQuery(query);
			while (rs.next()) {
				if (rs.getString("email").equals(email) && (rs.getString("password").equals(password))) {
					return (rs.getString("name"));
				}
			}
			return "false";
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();

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
		return "false";
	}
	
	public int id(String userName) {
 
		PreparedStatement pstmt = null;
		int userId=1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Banking", "root",
					"root");
			String query = "SELECT id FROM user WHERE name = ?";
			pstmt = (PreparedStatement) conn.prepareStatement(query);
			pstmt.setString(1, userName);
			ResultSet rs = (ResultSet) pstmt.executeQuery();
			rs.next();
			userId= rs.getInt("id");
			return userId;
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
		return userId;
	}
}
