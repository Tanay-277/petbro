<%--
  Created by IntelliJ IDEA.
  User: amans
  Date: 14-10-2024
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Family </title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #000; /* Black background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #111; /* Dark gray form container */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
            width: 300px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #f0f0f0; /* Light gray heading */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #ccc; /* Lighter gray text */
        }

        input[type="text"],
        input[type="file"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #444; /* Darker gray border */
            border-radius: 5px;
            background-color: #333; /* Dark input background */
            color: white;
        }

        textarea {
            resize: none;
            height: 60px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50; /* Green button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        /* File input styling */
        input[type="file"] {
            color: #ddd;
        }

        /* Change the placeholder color */
        ::placeholder {
            color: #aaa; /* Light gray placeholder */
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Pet Creator</h2>
    <form action="family" method="POST" enctype="multipart/form-data">
        <!-- Pet Creator's Name -->
        <label for="creator-name">Pet Name:</label>
        <input type="text" id="creator-name" name="creator-name" placeholder="Enter name" required>

        <!-- Animal Type Dropdown -->
        <label for="animal-type">Animal Type:</label>
        <select id="animal-type" name="animal-type" required>
            <option value="" disabled selected>Select an animal</option>
            <option value="dog">Dog</option>
            <option value="cat">Cat</option>
        </select>

        <!-- Breed Text Field -->
        <label for="breed">Breed:</label>
        <input type="text" id="breed" name="breed" placeholder="Enter breed" required>

        <!-- Photo Upload -->
        <label for="photo">Upload Photo:</label>
        <input type="file" id="photo" name="photo" accept="image/*" required>

        <!-- Description Text Area -->
        <label for="description">Brief Description (max 20 words):</label>
        <textarea id="description" name="description" maxlength="120" placeholder="Describe the pet..." ></textarea>

        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
