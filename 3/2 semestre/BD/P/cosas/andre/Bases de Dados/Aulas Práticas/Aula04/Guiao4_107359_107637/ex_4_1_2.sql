CREATE TABLE Airport(
    Airport_Code VARCHAR(64) NOT NULL PRIMARY KEY,
    City VARCHAR(64) NOT NULL,
    [state] VARCHAR(64) NOT NULL,
    [name] VARCHAR(64) NOT NULL,
);

CREATE TABLE Airplane_Type(
    [Type_name] VARCHAR(64) NOT NULL PRIMARY KEY,
    Max_seats INT NOT NULL,
    Company VARCHAR(64) NOT NULL,
);

CREATE TABLE CanLand (
    Airport_Code VARCHAR(64) NOT NULL PRIMARY KEY REFERENCES Airport(Airport_Code),
    Airplane_Type_Type_name VARCHAR(64) NOT NULL REFERENCES Airplane_Type(Type_name),
);

CREATE TABLE Airplane(
    Airplane_ID INT NOT NULL PRIMARY KEY,
    Total_no_of_seats INT NOT NULL,
    Airplane_Type_Type_name VARCHAR(64) NOT NULL REFERENCES Airplane_Type(Type_name),
);

CREATE TABLE Flight(
    [Number] INT NOT NULL PRIMARY KEY,
    Airline VARCHAR(64) NOT NULL,
    Weekdays VARCHAR(64) NOT NULL,
);

CREATE TABLE Fare(
    Code VARCHAR(64) NOT NULL PRIMARY KEY,
    Amount INT NOT NULL,
    Restrictions VARCHAR(1024) NOT NULL,
    Flight_Number INT NOT NULL REFERENCES Flight([Number]),
);

CREATE TABLE Flight_Leg(
    Leg_no INT NOT NULL PRIMARY KEY,
    Departure_airport_Airport_Code VARCHAR(64) NOT NULL REFERENCES Airport(Airport_Code),
    Arrival_airport_Airport_Code VARCHAR(64) NOT NULL REFERENCES Airport(Airport_Code),
    Schedule_dep_time DATETIME NOT NULL,
    Schedule_arr_time DATETIME NOT NULL,
    Flight_Number INT NOT NULL REFERENCES Flight([Number]),
);

CREATE TABLE Leg_Instance(
    [Date] DATE NOT NULL PRIMARY KEY,
    No_of_available_seats INT NOT NULL,
    Departure_time DATETIME NOT NULL,
    Arrival_time DATETIME NOT NULL,
    Airplane_Airplane_ID INT NOT NULL REFERENCES Airplane(Airplane_ID),
    Departure_airport_Airport_Code VARCHAR(64) NOT NULL REFERENCES Airport(Airport_Code),
    Arrival_airport_Airport_Code VARCHAR(64) NOT NULL REFERENCES Airport(Airport_Code),
);

CREATE TABLE Seat(
    Seat_no INT NOT NULL PRIMARY KEY,
    Costumer_name VARCHAR(64) NOT NULL,
    Cphone VARCHAR(64) NOT NULL,
    Leg_Instance_Date DATE NOT NULL REFERENCES Leg_Instance([Date]),
);