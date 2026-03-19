/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.library.servlets;

import com.library.util.DBUtil;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.LocalDateTime;

public class BorrowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String email = (String) request.getSession().getAttribute("email");

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement userPs = conn.prepareStatement("SELECT id FROM users WHERE email=?");
            userPs.setString(1, email);
            ResultSet userRs = userPs.executeQuery();

            if (userRs.next()) {
                int userId = userRs.getInt("id");

                PreparedStatement ps = conn.prepareStatement("INSERT INTO borrow(user_id, book_id) VALUES(?,?)");
                ps.setInt(1, userId);
                ps.setInt(2, bookId);
                ps.executeUpdate();

                PreparedStatement updateBook = conn.prepareStatement("UPDATE books SET available=FALSE WHERE id=?");
                updateBook.setInt(1, bookId);
                updateBook.executeUpdate();

                try (FileWriter fw = new FileWriter("C:\\library_log.txt", true)) {
                    fw.write("Book borrowed: " + bookId + ", by " + email + ", on " + LocalDateTime.now() + "\n");
                }

                response.sendRedirect("dashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

