-- Create the database
CREATE DATABASE IF NOT EXISTS pet_management;

-- Switch to the database
USE pet_management;

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
                                     id INT AUTO_INCREMENT PRIMARY KEY,
                                     username VARCHAR(50) NOT NULL,
                                     password VARCHAR(50) NOT NULL
);

-- Insert default users for testing
INSERT INTO users (username, password) VALUES ('admin', 'admin123'), ('user1', 'password1');

-- Modify the appointments table to include new fields for pet name, breed, image, and description
CREATE TABLE IF NOT EXISTS appointments (
                                            id INT AUTO_INCREMENT PRIMARY KEY,
                                            date DATE NOT NULL,
                                            pet VARCHAR(50),
                                            venue VARCHAR(100),
                                            health_checkup VARCHAR(100),
                                            grooming VARCHAR(100),
                                            training VARCHAR(100),
                                            reminder VARCHAR(10)
);

USE pet_management;
-- Create a new table named 'appointments_new' with the required columns
CREATE TABLE IF NOT EXISTS family (
                                                id INT AUTO_INCREMENT PRIMARY KEY,
                                                pet VARCHAR(50),
                                                breed VARCHAR(50),
                                                image LONGBLOB,  -- For storing the image file in binary format
                                                description VARCHAR(255) -- For short description, max 255 characters
);
