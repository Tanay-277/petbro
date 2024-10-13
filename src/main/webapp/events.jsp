<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pet.pet.Event" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointments</title>
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

        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
            padding: 2rem;
        }

        .card {
            padding: 1.5rem;
            border-radius: 20px;
            background: #ffffff12;
            border: 1px solid #ffffff10;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .card-title {
            font-size: 1.3rem;
            font-weight: bold;
        }

        .card-details {
            font-size: 1rem;
        }
    </style>
</head>
<body>
<header class="sticky top-0 z-50">
    <div class="left">
        <h1 class="text-2xl font-bold">PetBro</h1>
    </div>
    <div class="mid flex gap-4">
        <a href="/pet">Overview</a>
        <a href="#">Family</a>
        <a href="#" class="active">Sessions</a>
        <a href="#">More</a>
    </div>
    <div class="right">
        <img src="images/user.jpeg" alt="Profile" class="rounded-full w-12 border-one">
    </div>
</header>
<h2>All Appointments</h2>

<div class="grid-container">
    <%
        // Retrieve the eventsList from the request
        List<Event> eventsList = (List<Event>) request.getAttribute("eventsList");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (eventsList != null && !eventsList.isEmpty()) {
            for (Event event : eventsList) {
    %>
    <div class="card">
        <div class="card-title"><%= event.getPet() %>
        </div>
        <div class="card-details">Venue: <%= event.getVenue() %>
        </div>
        <div class="card-details">Date: <%= dateFormat.format(event.getDate()) %>
        </div>
        <div class="card-details">Health Checkup: <%= event.getHealthCheckup() %>
        </div>
        <div class="card-details">Grooming: <%= event.getGrooming() %>
        </div>
        <div class="card-details">Training: <%= event.getTraining() %>
        </div>
        <div class="card-details">Reminder: <%= event.getReminder() %>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <div class="card">
        <div class="card-details">No appointments found.</div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
