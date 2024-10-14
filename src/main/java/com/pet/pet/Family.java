package com.pet.pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Family extends HttpServlet {

    // This method handles GET requests and forwards to the family.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/family.jsp").forward(request, response);
    }

    // This method handles POST requests (form submissions)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the form is a multipart form (for file uploads)
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                List<FileItem> formItems = upload.parseRequest(request);
                String creatorName = null;
                String animalType = null;
                String breed = null;
                String description = null;
                InputStream photoInputStream = null;

                // Iterate over form items
                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        // Extract form fields
                        if ("creator-name".equals(item.getFieldName())) {
                            creatorName = item.getString();
                        } else if ("animal-type".equals(item.getFieldName())) {
                            animalType = item.getString();
                        } else if ("breed".equals(item.getFieldName())) {
                            breed = item.getString();
                        } else if ("description".equals(item.getFieldName())) {
                            description = item.getString();
                        }
                    } else {
                        // Handle the file input (image)
                        if ("photo".equals(item.getFieldName())) {
                            photoInputStream = item.getInputStream();
                        }
                    }
                }

                // Insert data into the database
                if (creatorName != null && animalType != null && breed != null && description != null && photoInputStream != null) {
                    // Database connection details
                    String dbURL = "jdbc:mysql://localhost:3306/pet_management";
                    String dbUser = "root";
                    String dbPassword = "root";

                    try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
                        String sql = "INSERT INTO family (pet, breed, image, description) VALUES (?, ?, ?, ?)";
                        try (PreparedStatement statement = connection.prepareStatement(sql)) {
                            // Set values for each field
                            statement.setString(1, creatorName);
                            statement.setString(2, breed);
                            statement.setBlob(3, photoInputStream); // Set image as Blob
                            statement.setString(4, description);

                            // Execute the insert statement
                            int rowsInserted = statement.executeUpdate();
                            if (rowsInserted > 0) {
                                response.getWriter().println("Family member added successfully!");
                            } else {
                                response.getWriter().println("Error adding family member.");
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        response.getWriter().println("Database error: " + e.getMessage());
                    }
                } else {
                    response.getWriter().println("All fields are required.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error processing the form: " + e.getMessage());
            }
        }
    }
}
