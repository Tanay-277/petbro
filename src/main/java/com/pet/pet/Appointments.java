package com.pet.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "Appointments", urlPatterns = {"/appointment"})
public class Appointments extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("appointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appointmentDate = request.getParameter("appointment_date");
        String pet = request.getParameter("pet");
        String venue = request.getParameter("venue");
        String reminder = request.getParameter("reminder");
        String healthCheckup = request.getParameter("health_checkup"); // Getting health check-up value
        String groomingService = request.getParameter("grooming_service"); // Getting grooming service value
        String additionalInfo = request.getParameter("additional_info");

        System.out.println(
                "Appointment Date: " + appointmentDate + "\n" +
                        "Pet: " + pet + "\n" +
                        "Venue: " + venue + "\n" +
                        "Reminder: " + reminder + "\n" +
                        "Health Check-up: " + healthCheckup + "\n" +
                        "Grooming Service: " + groomingService + "\n" +
                        "Additional Info: " + additionalInfo
        );

        // Database connection
        String url = "jdbc:mysql://localhost:3306/pet_management";
        String username = "root";
        String password = "root"; // Replace with your actual password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement
            String sql = "INSERT INTO appointments (date, pet, venue, reminder, health_checkup, grooming) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, appointmentDate);
            statement.setString(2, pet);
            statement.setString(3, venue);
            statement.setString(4, reminder != null ? "Yes" : "No");

            // Handle potential number parsing
            int healthCheckupValue = healthCheckup != null ? Integer.parseInt(healthCheckup) : 0; // Default to 0 if not selected
            int groomingServiceValue = groomingService != null ? Integer.parseInt(groomingService) : 0; // Default to 0 if not selected

            statement.setInt(5, healthCheckupValue); // Save as integer
            statement.setInt(6, groomingServiceValue); // Save as integer
            //statement.setString(7, additionalInfo); // Save additional info

            statement.executeUpdate();
            connection.close();

            response.sendRedirect("events");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page in case of failure
        }
    }

}
