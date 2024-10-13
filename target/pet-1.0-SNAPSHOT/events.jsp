<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Appointments</title>
    <style>
        body {
            background-color: #000;
            color: white;
            font-family: 'Arial', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .calendar-container {
            background-color: #1c1c1c;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        .appointments {
            margin-top: 20px;
            padding: 15px;
            background-color: #2e2e2e;
            border-radius: 10px;
            width: 300px;
        }

        .appointments .appointment-item {
            background-color: #444;
            padding: 10px;
            margin: 10px 0;
            border-radius: 10px;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="calendar-container">
    <h2>All Appointments</h2>

    <!-- Div to display the list of all appointments -->
    <div id="appointment-list" class="appointments">
        <!-- Fetched appointments will be inserted here -->
    </div>
</div>

<script>
    // Fetch all appointments from the server
    function fetchAppointments() {
        fetch('Events')
            .then(response => response.json())
            .then(data => {
                const appointmentList = document.getElementById('appointment-list');
                appointmentList.innerHTML = ''; // Clear previous data

                if (data.length > 0) {
                    data.forEach(appointment => {
                        appointmentList.innerHTML += `
                            <div class="appointment-item">
                                <p>Pet: ${appointment.pet}</p>
                                <p>Venue: ${appointment.venue}</p>
                                <p>Date: ${appointment.date}</p>
                            </div>
                        `;
                    });
                } else {
                    appointmentList.innerHTML = '<p>No appointments found.</p>';
                }
            })
            .catch(error => console.error('Error fetching appointments:', error));
    }

    // Call the fetch function on page load
    window.onload = fetchAppointments;
</script>

</body>
</html>
