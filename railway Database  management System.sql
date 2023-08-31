-- Create the database
CREATE DATABASE IF NOT EXISTS railway_system;

-- Switch to the newly created database
USE railway_system;

-- Create the Stations table
CREATE TABLE IF NOT EXISTS Stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    location VARCHAR(100)
);

-- Create the Trains table
CREATE TABLE IF NOT EXISTS Trains (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100),
    source_station_id INT,
    destination_station_id INT,
    departure_time TIME,
    arrival_time TIME,
    FOREIGN KEY (source_station_id) REFERENCES Stations(station_id),
    FOREIGN KEY (destination_station_id) REFERENCES Stations(station_id)
);

-- Create the Bookings table
CREATE TABLE IF NOT EXISTS Bookings (
    booking_id INT PRIMARY KEY,
    train_id INT,
    passenger_id INT,
    booking_date DATE,
    FOREIGN KEY (train_id) REFERENCES Trains(train_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

-- Create the Passengers table
CREATE TABLE IF NOT EXISTS Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100)
);

-- Insert sample data into Stations table
INSERT INTO Stations (station_id, station_name, location)
VALUES
    (1, 'Pune', 'Pune'),
    (2, 'Mumbai', 'Mumbai');

-- Insert sample data into Trains table
INSERT INTO Trains (train_id, train_name, source_station_id, destination_station_id, departure_time, arrival_time)
VALUES
    (101, 'Deccan Express ', 1, 2, '08:00:00', '12:00:00'),
    (102, 'Pragati Express', 2, 1, '13:00:00', '17:00:00');

-- Insert sample data into Passengers table
INSERT INTO Passengers (passenger_id, first_name, last_name, date_of_birth, email)
VALUES
    (1, 'Atharva', 'Wadekar', '2002-05-15', 'atharva@gmail.com'),
    (2, 'Satish', 'Wadekar', '1971-09-22', 'satish@gmail.com');

-- Insert sample data into Bookings table
INSERT INTO Bookings (booking_id, train_id, passenger_id, booking_date)
VALUES
    (1001, 101, 1, '2023-08-01'),
    (1002, 102, 2, '2023-08-05');
