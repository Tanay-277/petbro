<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Management Login</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .login-box { margin: 100px auto; width: 300px; padding: 20px; border: 1px solid #ddd; }
        .error { color: red; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Login</h2>
    <form action="login" method="POST">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>

        <button type="submit">Login</button>
    </form>

    <!-- Display error message if login fails -->
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
    %>
    <p class="error">Invalid username or password!</p>

    <% } %>
</div>
</body>
</html>
