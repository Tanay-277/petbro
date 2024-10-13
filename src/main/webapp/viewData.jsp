<%@ page import="java.sql.Connection, java.sql.ResultSet, java.sql.Statement" %>
<%@ page import="com.pet.pet.Database" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Management Data Viewer</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Pet Management Data Viewer</h1>

  <h2>Users</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Email</th>
      <th>Created At</th>
    </tr>
    </thead>
    <tbody>
    <%
      try (Connection conn = Database.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users;");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("username") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>

  <h2>Pets</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Type</th>
      <th>Age</th>
      <th>Owner ID</th>
      <th>Created At</th>
    </tr>
    </thead>
    <tbody>
    <%
      try (Connection conn = Database.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM pets;");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("type") %></td>
      <td><%= rs.getInt("age") %></td>
      <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>

  <h2>Services</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Price</th>
      <th>Description</th>
      <th>Created At</th>
    </tr>
    </thead>
    <tbody>
    <%
      try (Connection conn = Database.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM services;");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getDouble("price") %></td>
      <td><%= rs.getString("description") %></td>
      <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>

  <h2>Bookings</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>ID</th>
      <th>User ID</th>
      <th>Pet ID</th>
      <th>Service ID</th>
      <th>Booking Date</th>
      <th>Created At</th>
    </tr>
    </thead>
    <tbody>
    <%
      try (Connection conn = Database.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM bookings;");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getInt("user_id") %></td>
      <td><%= rs.getInt("pet_id") %></td>
      <td><%= rs.getInt("service_id") %></td>
      <td><%= rs.getTimestamp("booking_date") %></td>
      <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>

  <h2>Appointments</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>ID</th>
      <th>User ID</th>
      <th>Pet ID</th>
      <th>Service ID</th>
      <th>Appointment Date</th>
      <th>Created At</th>
    </tr>
    </thead>
    <tbody>
    <%
      try (Connection conn = Database.getConnection()) {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM appointments;");
        while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getTimestamp("date") %></td>
      <td><%= rs.getInt("pet") %></td>
      <td><%= rs.getInt("venue") %></td>
      <td><%= rs.getTimestamp("health_checkup") %></td>
      <td><%= rs.getTimestamp("grooming") %></td>
      <td><%= rs.getTimestamp("training") %></td>
      <td><%= rs.getTimestamp("reminder") %></td>
    </tr>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>
  </table>

</div>
</body>
</html>
