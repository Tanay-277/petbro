<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Appointment Form</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@400;500;600;700&display=swap');

        * {
            outline: none;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Satoshi', sans-serif;
            background: #000;
            color: #eee;
            width: 100%;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 1.5rem;
            background: #000;
        }

        .border-one {
            border: 0.1px solid #ffffff20;
        }

        #appointment-form {
            gap: 2rem;
            width: 100%;
            display: flex;
        }

        .form-container {
            display: flex; /* Changed to flex for side-by-side layout */
            gap: 2rem; /* Gap between the sections */
            padding: 2rem;
        }

        .form-section {
            flex: 1; /* Allow sections to grow and fill space */
            padding: 2rem;
            background: #ffffff05;
            border: 1px solid #ffffff10;
            border-radius: 20px;
        }

        .form-section h2 {
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        option {
            background: #000000 !important;
            color: #fff !important;
        }

        label {
            display: block;
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 0.8rem;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px !important;
            margin-bottom: 1.2rem !important;
            border-radius: 8px;
            border: 0.1px solid #ffffff05 !important;
            background: #ffffff0a;
            color: #fff;
            font-size: 1rem;
        }

        input[type="checkbox"], input[type="radio"] {
            aspect-ratio: 1;
            width: 1rem;
            margin-right: 0.75rem;
            accent-color: #00ff88;
            margin-top: 4px;
        }

        input:disabled, select:disabled, textarea:disabled {
            background: #333;
            color: #777;
            border-color: #555;
            cursor: not-allowed;
        }

        .submit-btn, .cancel-btn {
            padding: 0.8rem 1.6rem;
            border-radius: 32px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
            text-align: center;
        }

        .submit-btn {
            background: #00ff88;
            color: #000;
        }

        .cancel-btn {
            background: crimson;
            color: #000;
        }

        .submit-btn:hover {
            background: #00cc6e;
        }

        .flex-row {
            display: flex;
            align-items: center;
        }

        .flex-col {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .space-y-4 {
            margin-bottom: 1rem;
        }

        .ml-6 {
            margin-left: 1.5rem;
        }
    </style>
    <script>
        function toggleOptions(checkboxId, optionClass) {
            const checkbox = document.getElementById(checkboxId);
            const options = document.querySelectorAll('.' + optionClass);
            options.forEach(option => {
                option.disabled = !checkbox.checked;
            });
        }

        function submitForm() {
            const checkUpValue = document.querySelector('input[name="health_checkup"]:checked');
            const groomingValue = document.querySelector('input[name="grooming_service"]:checked');

            console.log("Check-Up Selected:", checkUpValue ? checkUpValue.value : "None");
            console.log("Grooming Selected:", groomingValue ? groomingValue.value : "None");

            document.getElementById('appointment-form').submit();
        }

        function cancelForm() {
            window.location.href = '/pet/events';
        }
    </script>
</head>
<body>
<header class="border-one flex flex-row items-center justify-between">
    <button class="cancel-btn" onclick="cancelForm()">Cancel</button>
    <h1 class="text-3xl font-bold">Book an Appointment</h1>
    <button type="button" class="submit-btn" onclick="submitForm()">Confirm</button>
</header>
<div class="form-container">
    <form id="appointment-form" action="appointments" method="POST">
        <div class="form-section" data-bs-theme="dark">
            <h2>Appointment Details</h2>

            <label for="appointment_date">Select Date</label>
            <input type="date" id="appointment_date" name="appointment_date" required class="border-one accent-white">

            <label for="pet">Select Pet</label>
            <select id="pet" name="pet" class="border-one">
                <%
                    // Database connection parameters
                    String jdbcURL = "jdbc:mysql://localhost:3306/pet_management";
                    String dbUser = "root";
                    String dbPassword = "root";

                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;

                    try {
                        // Establish the database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        statement = connection.createStatement();

                        // Execute the query to retrieve pet names
                        String sql = "SELECT name FROM pets"; // Adjust the column name as per your table structure
                        resultSet = statement.executeQuery(sql);

                        // Loop through the result set and create option elements
                        while (resultSet.next()) {
                            String petName = resultSet.getString("name");
                %>
                <option value="<%= petName %>"><%= petName %>
                </option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close the resources
                        try {
                            if (resultSet != null) resultSet.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        try {
                            if (statement != null) statement.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        try {
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>

            <label for="venue">Preferred Venue</label>
            <select id="venue" name="venue" class="border-one">
                <option value="Studio-01">Studio-01</option>
                <option value="Studio-02">Studio-02</option>
                <option value="Studio-03">Studio-03</option>
            </select>

            <div class="flex-row items-start">
                <input type="checkbox" id="reminder" name="reminder" value="yes" class="border-one">
                <label for="reminder" class="mb-0 align-start">Send me a reminder 1 hour before the appointment</label>
            </div>

        </div>
        <div class="form-section">
            <h2>Available Services</h2>
            <div class="flex-row">
                <input type="checkbox" id="check_up" name="check_up"
                       onclick="toggleOptions('check_up', 'health-option')"
                       class="border-one">
                <label for="check_up">Health Check-Up</label>
            </div>
            <div class="flex-row gap-6 mt-2">
                <div class="flex-row">
                    <input type="radio" id="basic-checkup" name="health_checkup" value="500" disabled
                           class="health-option border-one w-32">
                    <label for="basic-checkup">Basic - ₹500</label>
                </div>
                <div class="flex-row">
                    <input type="radio" id="advanced-checkup" name="health_checkup" value="1000" disabled
                           class="health-option border-one">
                    <label for="advanced-checkup">Advanced - ₹1000</label>
                </div>
            </div>

            <div class="flex-row mt-4">
                <input type="checkbox" id="grooming" name="grooming"
                       onclick="toggleOptions('grooming', 'grooming-option')"
                       class="border-one">
                <label for="grooming">Grooming</label>
            </div>
            <div class="flex-row gap-6 mt-2">
                <div class="flex-row">
                    <input type="radio" id="basic-grooming" name="grooming_service" value="300" disabled
                           class="grooming-option border-one">
                    <label for="basic-grooming">Basic - ₹300</label>
                </div>
                <div class="flex-row">
                    <input type="radio" id="premium-grooming" name="grooming_service" value="600" disabled
                           class="grooming-option border-one">
                    <label for="premium-grooming">Premium - ₹600</label>
                </div>
            </div>

            <label for="additional_info" class="mt-2">Additional Requests / Instructions</label>
            <textarea id="additional_info" name="additional_info" rows="3" placeholder="Any special requests?"
                      class="border-one"></textarea>
        </div>
    </form>
</div>
</body>
</html>
