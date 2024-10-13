<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pet.pet.Event" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Assuming you have a method to fetch events based on the selected date.
    String selectedDate = request.getParameter("date");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    // Fetch events based on selectedDate from your data source
    List<Event> eventsList = fetchEventsByDate(selectedDate); // Implement this method according to your logic.

    if (eventsList != null && !eventsList.isEmpty()) {
        for (Event event : eventsList) {
            String eventDateStr = dateFormat.format(event.getDate());
%>
<li>
    <h3>Pet: <%= event.getPet() %></h3>
    <p>Date: <%= eventDateStr %></p>
    <p>Venue: <%= event.getVenue() %></p>
</li>
<%
    }
} else {
%>
<li>No appointments found for this date.</li>
<%
    }

    // Mock function to simulate fetching events. Replace with actual database logic.
    List<Event> fetchEventsByDate(String date) {
    List<Event> events = new ArrayList<>();
    // Replace this with actual data retrieval logic based on the date
    return events;
    }
%>
