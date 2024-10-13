<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Appointments</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    table, th, td {
      border: 1px solid black;
    }
    th, td {
      padding: 10px;
      text-align: left;
    }
  </style>
</head>
<body>
<h2>All Appointments</h2>

<table>
  <thead>
  <tr>
    <th>Pet</th>
    <th>Venue</th>
    <th>Date</th>
    <th>Health Checkup</th>
    <th>Grooming</th>
    <th>Training</th>
    <th>Reminder</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="event" items="${eventsList}">
    <tr>
      <td>${event.pet}</td>
      <td>${event.venue}</td>
      <td>${event.date}</td>
      <td>${event.healthCheckup}</td>
      <td>${event.grooming}</td>
      <td>${event.training}</td>
      <td>${event.reminder}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
