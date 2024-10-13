package com.pet.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        log("Username: " + username + ", Password: " + password);
    
        // Perform validation or database check (dummy check for this example)
        if ("admin".equals(username) && "password".equals(password)) {
            // Login success - redirect to a dashboard or another page
            response.sendRedirect("dashboard.jsp");
        } else {
            // Login failed - send back to login page with error
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
