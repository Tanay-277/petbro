package com.pet.pet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.file.Paths;

@WebServlet(name = "MainServlet", urlPatterns = {"/main"})
public class Main extends HttpServlet {

    @Override
    public void init() throws ServletException {
        // Get the absolute path of the SQL file and initialize the database
        String sqlFilePath = Paths.get(getServletContext().getRealPath("/WEB-INF/pet_management.sql")).toString();
        SQLExecuter.executeSQLFromFile(sqlFilePath);

        System.out.println("Database setup complete.");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
