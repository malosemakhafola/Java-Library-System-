/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.library.api;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

public class BorrowAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JSONObject json = new JSONObject();
        json.put("status", "success");
        json.put("message", "Borrow API is working");
        response.setContentType("application/json");
        response.getWriter().print(json.toString());
/*try (FileWriter fw = new FileWriter("borrow_log.txt", true)) {
    fw.write("Book ID: " + bookId + ", User: " + userEmail + ", Date: " + new Date() + "\n");
} catch (IOException e) {
    e.printStackTrace();
}*/
    }
}

