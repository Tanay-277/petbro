package com.pet.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Appointments")
public class Appointments extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("appointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedDate = request.getParameter("appointment_date");
        String pet = request.getParameter("pet");
        String venue = request.getParameter("venue");

        // Check-Up handling
        String checkUp = request.getParameter("check_up") != null ? request.getParameter("health_checkup") : "No";

        // Grooming handling
        String grooming = request.getParameter("grooming") != null ? request.getParameter("grooming_service") : "No";

        // Training handling
        String training = request.getParameter("training") != null ? request.getParameter("training_service") : "No";

        String reminder = request.getParameter("reminder") != null ? "Yes" : "No";

        if (selectedDate == null || selectedDate.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Date is required.");
            return;
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/pet_management";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO appointments (date, pet, venue, health_checkup, grooming, training, reminder) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            statement = connection.prepareStatement(sql);
            statement.setString(1, selectedDate);
            statement.setString(2, pet);
            statement.setString(3, venue);
            statement.setString(4, checkUp);
            statement.setString(5, grooming);
            statement.setString(6, training);
            statement.setString(7, reminder);

            int rows = statement.executeUpdate();
            if (rows > 0) {
                response.getWriter().println("Appointment booked successfully.");
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database error", e);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ignored) {
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ignored) {
                }
            }
        }
    }
}