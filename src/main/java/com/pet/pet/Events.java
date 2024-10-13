package com.pet.pet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "Events", urlPatterns = {"/events"})
public class Events extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> eventsList = new ArrayList<>();
        String jdbcURL = "jdbc:mysql://localhost:3306/pet_management?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                 Statement stmt = conn.createStatement()) {

                // Execute SQL query
                ResultSet rs = stmt.executeQuery("SELECT id, pet, venue, date, health_checkup, grooming, training, reminder FROM appointments");

                // Iterate through the result set and add data to the list
                while (rs.next()) {
                    int id = rs.getInt("id");
                    Date sqlDate = rs.getDate("date");
                    String pet = rs.getString("pet");
                    String venue = rs.getString("venue");
                    String healthCheckup = rs.getString("health_checkup");
                    String grooming = rs.getString("grooming");
                    String training = rs.getString("training");
                    String reminder = rs.getString("reminder");

                    eventsList.add(new Event(id, sqlDate, pet, venue, healthCheckup, grooming, training, reminder));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
        }

        // Set the eventsList in the request
        request.setAttribute("eventsList", eventsList);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/events.jsp");
        dispatcher.forward(request, response);
    }

}