<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.pet.pet.CalendarUtil" %>
<%@ page import="com.pet.pet.Event" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetBro - Appointments</title>
    <link href="https://api.fontshare.com/v2/css?f[]=satoshi@1&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'satoshi', sans-serif;
            background: #000;
            color: #eee;
            width: 100%;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem;
            background: #000;
        }

        .border-one {
            border: 0.1px solid #ffffff20;
        }

        .mid {
            border-radius: 32px;
            font-weight: 500;
            background: #ffffff20;
        }

        .mid a {
            color: #fff;
            text-decoration: none;
            padding: 0.8em 1.2em;
            border-radius: 32px;
            width: 7rem;
            text-align: center;
            transition: color 0.3s ease;
        }

        .mid a.active {
            background: #ffffff;
            color: black;
            font-weight: bold;
        }

        .active-day {
            background-color: rgba(0, 255, 136, 0.3);
        }

        .day.active {
            background-color: #00ff88; /* Change this to your desired highlight color */
            color: #000; /* Adjust text color if needed */
            box-shadow: 0 0 10px rgba(0, 255, 136, 0.5); /* Optional: Add a glow effect */
        }

    </style>
</head>
<body>
<header class="sticky top-0 z-50">
    <div class="left">
        <h1 class="text-2xl font-bold">PetBro</h1>
    </div>
    <div class="mid flex gap-4">
        <a href="#">Overview</a>
        <a href="#">Family</a>
        <a href="${pageContext.request.contextPath}/events" class="active">Sessions</a>
        <a href="#">More</a>
    </div>
    <div class="right">
        <img src="images/user.jpeg" alt="Profile" class="rounded-full w-12 border-one">
    </div>
</header>

<main class="p-6">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-3xl my-4 text-center font-bold">All Appointments</h2>
        <button class="bg-green-500 hover:bg-green-400 text-black font-bold py-2 px-4 rounded-lg"
                onclick="location.href='/addAppointment'">Add Appointment
        </button>
    </div>

    <div class="text-center">
        <h3 class="text-xl mb-4">October 2024</h3>
        <div class="grid grid-cols-7 gap-2">
            <%
                String[] daysOfWeek = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
                for (String day : daysOfWeek) {
            %>
            <div class="font-bold text-lg"><%= day %>
            </div>
            <% } %>

            <%
                List<Event> eventsList = (List<Event>) request.getAttribute("eventsList");
                Map<Integer, List<Event>> appointmentMap = new HashMap<>();
                for (Event event : eventsList) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(event.getDate());
                    int day = cal.get(Calendar.DAY_OF_MONTH);
                    appointmentMap.computeIfAbsent(day, k -> new ArrayList<>()).add(event);
                }

                String[][] calendar = CalendarUtil.getCalendar(2024, Calendar.OCTOBER);
                for (int i = 0; i < calendar.length; i++) {
                    for (int j = 0; j < calendar[i].length; j++) {
                        String day = calendar[i][j];
            %>
            <div class="day border border-gray-700 p-2 cursor-pointer transition hover:bg-gray-600"
                 onclick="showAppointments(<%= day.isEmpty() ? -1 : Integer.parseInt(day) %>)">
                <%= day.isEmpty() ? "&nbsp;" : day %>
                <ul class="appointment-list mt-2">
                    <%
                        if (!day.isEmpty()) {
                            int dayNum = Integer.parseInt(day);
                            List<Event> dayAppointments = appointmentMap.get(dayNum);
                            if (dayAppointments != null) {
                                for (Event event : dayAppointments) {
                    %>
                    <li class="text-sm"><%= event.getPet() %> - <%= event.getVenue() %>
                    </li>
                    <%
                                }
                            }
                        }
                    %>
                </ul>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <!-- Appointments Card -->
    <div class="appointment-card bg-gray-800 p-4 rounded-lg shadow-md mt-6" id="appointmentsCard">
        <div class="appointment-title text-xl font-semibold mb-2">Appointments</div>
        <ul class="appointment-list" id="appointmentsList">
            <%
                for (Event event : eventsList) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(event.getDate());
                    int day = cal.get(Calendar.DAY_OF_MONTH);
                    String dateFormatted = day + " October 2024";
            %>
            <li class="appointment text-sm">
                <strong><%= event.getPet() %>
                </strong> - <%= event.getVenue() %> <br>
                <span class="text-gray-400"><%= dateFormatted %></span>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</main>

<script>
    function showAppointments(day) {
        const appointmentsList = document.getElementById('appointmentsList');
        const events = <%= new Gson().toJson(eventsList) %>;

        // Clear previous appointments
        appointmentsList.innerHTML = "";

        const filteredAppointments = events.filter(event => {
            const eventDate = new Date(event.date);
            return eventDate.getDate() === day && eventDate.getMonth() === 9; // October is month 9 (zero-based)
        });

        // Check if there are any appointments for the selected day
        if (filteredAppointments.length > 0) {
            filteredAppointments.forEach(event => {
                const li = document.createElement('li');
                li.className = 'appointment text-sm';
                const petName = event.pet || "Unknown Pet";
                const venue = event.venue || "Unknown Venue";
                li.innerHTML = petName + " - " + venue;
                appointmentsList.appendChild(li);
            });
        } else {
            appointmentsList.innerHTML = '<li class="appointment text-sm">No appointments found for this date.</li>';
        }
    }
</script>
</body>
</html>
