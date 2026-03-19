/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.library.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/library_db";
    private static final String USER = "root";
    private static final String PASSWORD = "MySQL0123"; // 

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(" Database connection successful");
        } catch (ClassNotFoundException e) {
            System.out.println(" MySQL JDBC Driver not found. Add mysql-connector .jar in project libraries.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println(" Database connection failed. Check your URL, username, or password.");
            e.printStackTrace();
        }
        return conn;
        
    }
}






