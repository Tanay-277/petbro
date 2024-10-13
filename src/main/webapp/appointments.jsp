<%--
  Created by IntelliJ IDEA.
  User: amans
  Date: 12-10-2024
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Appointment</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #000; /* Black background */
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .appointment-container {
      background-color: #1c1c1c; /* Darker background for the form */
      border-radius: 20px;
      padding: 20px 40px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
      width: 350px;
    }

    .appointment-container h2 {
      margin-bottom: 20px;
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      font-size: 14px;
      display: block;
      margin-bottom: 5px;
    }

    input[type="date"],
    select,
    .service-box {
      width: 100%;
      padding: 10px;
      border-radius: 10px;
      border: none;
      background-color: #333; /* Dark input background */
      color: white;
    }

    .service-box {
      background-color: #333;
      margin-bottom: 10px;
    }

    .service-info {
      display: flex;
      justify-content: space-between;
    }

    .form-check-inline {
      display: flex;
      align-items: center;
    }

    .form-check-inline input[type="checkbox"] {
      margin-right: 10px;
    }

    button {
      width: 100%;
      padding: 10px;
      border-radius: 10px;
      background-color: #4CAF50; /* Green button */
      color: white;
      font-weight: bold;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<div class="appointment-container">
  <h2>Add Appointment</h2>

  <form action="appointments" method="POST">
    <div class="form-group">
      <label for="select-date">Select Date</label>
      <input type="date" id="select-date" name="appointment_date" required />
    </div>

    <div class="form-group">
      <label for="pet">Pet</label>
      <select id="pet" name="pet">
        <option value="Don">Don</option>
        <option value="Bruno">Bruno</option>
        <option value="Max">Max</option>
      </select>
    </div>

    <div class="form-group">
      <label for="venue">Preferred Venue</label>
      <select id="venue" name="venue">
        <option value="Studio-01">Studio-01</option>
        <option value="Studio-02">Studio-02</option>
        <option value="Studio-03">Studio-03</option>
      </select>
    </div>

    <div class="form-group">
      <label>Available Services</label>

      <!-- Health Checkup options -->
      <div class="form-check-inline">
        <input type="checkbox" id="check_up" name="check_up">
        <label for="check_up">Check-Up</label>
      </div>
      <div class="service-box">
        <div class="service-info">
          <input type="radio" id="basic-checkup" name="health_checkup" value="500" checked>
          <label for="basic-checkup">Health Check-Up (Basic) - ₹500</label>

          <input type="radio" id="advanced-checkup" name="health_checkup" value="1000">
          <label for="advanced-checkup">Health Check-Up (Advanced) - ₹1000</label>
        </div>
      </div>

      <!-- Grooming options -->
      <div class="form-check-inline">
        <input type="checkbox" id="grooming" name="grooming">
        <label for="grooming">Grooming</label>
      </div>
      <div class="service-box">
        <div class="service-info">
          <input type="radio" id="basic-grooming" name="grooming_service" value="300" checked>
          <label for="basic-grooming">Grooming (Basic) - ₹300</label>

          <input type="radio" id="premium-grooming" name="grooming_service" value="600">
          <label for="premium-grooming">Grooming (Premium) - ₹600</label>
        </div>
      </div>

      <!-- Training options -->
      <div class="form-check-inline">
        <input type="checkbox" id="training" name="training">
        <label for="training">Training</label>
      </div>
      <div class="service-box">
        <div class="service-info">
          <input type="radio" id="basic-training" name="training_service" value="450" checked>
          <label for="basic-training">Training (Basic) - ₹450</label>

          <input type="radio" id="advanced-training" name="training_service" value="800">
          <label for="advanced-training">Training (Advanced) - ₹800</label>
        </div>
      </div>
    </div>

    <div class="form-check">
      <input type="checkbox" id="reminder" name="reminder" value="yes">
      <label for="reminder">Send me a reminder 1 hour before the appointment.</label>
    </div>

    <button type="submit">Confirm Booking</button>
  </form>
</div>

</body>
</html>