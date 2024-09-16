-- Write your own SQL object definition here, and it'll be included in your package.
CREATE DATABASE TOURFIESTA;

USE TOURFIESTA;

CREATE TABLE UserInfo(
	UserID INT PRIMARY KEY,
    Username VARCHAR(20),
    Password VARCHAR(20),
    Email VARCHAR(20),
    name VARCHAR(20),
    Address VARCHAR(45),
    Phone VARCHAR(10)
);

CREATE TABLE Booking(
	booking_id INT PRIMARY KEY,
    bookingdate DATE,
    total_amount BIGINT,
    status VARCHAR(10),
    booking_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES UserInfo(UserID)
);

CREATE TABLE Accomodation(
	accomodation_id INT PRIMARY KEY,
    name_of_hotel VARCHAR(45),
    Location VARCHAR(50),
    checkInDate DATE,
    checkOutDate DATE,
    pricepernight BIGINT,
    availablerooms INT,
    UserID INT,
    booking_id INT,
    FOREIGN KEY (UserID) REFERENCES UserInfo(UserID),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Destinations(
	Destinationid INT PRIMARY KEY,
    name VARCHAR(20),
    Location VARCHAR(50),
    type TEXT,
    description TEXT,
    popular_attraction VARCHAR(50),
    climate TEXT,
    Average_cost BIGINT,
    rating FLOAT,
    accomodation_id INT,
    activity_id INT,
    booking_id INT,
    FOREIGN KEY (accomodation_id) REFERENCES Accomodation(accomodation_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Activity(
	activity_id INT PRIMARY KEY,
    name_of_hotel VARCHAR(20),
    location TEXT,
    date DATE,
    time TIME,
    price BIGINT,
    capacity_of_num_of_participants INT,
    Destinationid INT,
    FOREIGN KEY (Destinationid) REFERENCES Destinations(Destinationid)
);

CREATE TABLE Admin(
	Admin_id INT PRIMARY KEY,
    name VARCHAR(20),
    Email VARCHAR(20),
    Password VARCHAR(20),
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


CREATE TABLE Flight(
	flight_id INT PRIMARY KEY,
    airline VARCHAR(30),
    Destination_airport VARCHAR(30),
    Departure_airport TIME,
    Departure_Datetime DATETIME,
    Arrival_Datetime DATETIME,
    price BIGINT,
    available_seats INT,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


CREATE TABLE Payment(
	payment_id INT PRIMARY KEY,
    payment_date DATE,
    amount BIGINT,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    UserID INT,
    booking_id INT,
    accomodation_id INT,
    FOREIGN KEY (UserID) REFERENCES UserInfo(UserID),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (accomodation_id) REFERENCES Accomodation(accomodation_id)
);

CREATE TABLE Review(
	review_id INT PRIMARY KEY,
    review_text TEXT,
    rating FLOAT,
    review_date DATE,
	UserID INT,
    Destinationid INT,
    accomodation_id INT,
    activity_id INT,
    FOREIGN KEY (UserID) REFERENCES UserInfo(UserID),
    FOREIGN KEY (Destinationid) REFERENCES Destinations(Destinationid),
    FOREIGN KEY (accomodation_id) REFERENCES Accomodation(accomodation_id),
    FOREIGN KEY (activity_id) REFERENCES Activity(activity_id)
);

