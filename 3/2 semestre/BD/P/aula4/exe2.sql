CREATE TABLE AIRPORT (
    Airport_code VARCHAR(10) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50),
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Airport_code)
);

CREATE TABLE AIRPLANE_TYPE (
    Type_name VARCHAR(50) NOT NULL,
    Company VARCHAR(50) NOT NULL,
    Max_seats INT NOT NULL,
    PRIMARY KEY (Type_name)
);

CREATE TABLE FLIGHT (
    Number VARCHAR(10) NOT NULL,
    Airline VARCHAR(50) NOT NULL,
    Weekdays VARCHAR(50) NOT NULL,
    PRIMARY KEY (Number)
);

CREATE TABLE AIRPLANE (
    Airplane_id INT NOT NULL,
    Total_no_of_seats INT NOT NULL,
    Type_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Airplane_id),
    FOREIGN KEY (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);

CREATE TABLE CAN_LAND (
    Airport_code VARCHAR(10) NOT NULL,
    Type_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Airport_code, Type_name),
    FOREIGN KEY (Airport_code) REFERENCES AIRPORT(Airport_code),
    FOREIGN KEY (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);

CREATE TABLE FARE (
    Flight_Number VARCHAR(10) NOT NULL,
    Code VARCHAR(10) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Restrictions VARCHAR(255),
    PRIMARY KEY (Flight_Number, Code),
    FOREIGN KEY (Flight_Number) REFERENCES FLIGHT(Number)
);

CREATE TABLE FLIGHT_LEG (
    Flight_Number VARCHAR(10) NOT NULL,
    Leg_no INT NOT NULL,
    Scheduled_dep_time TIME NOT NULL,
    Scheduled_arr_time TIME NOT NULL,
    Departure_Airport_code VARCHAR(10) NOT NULL,
    Arrival_Airport_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (Flight_Number, Leg_no),
    FOREIGN KEY (Flight_Number) REFERENCES FLIGHT(Number),
    FOREIGN KEY (Departure_Airport_code) REFERENCES AIRPORT(Airport_code),
    FOREIGN KEY (Arrival_Airport_code) REFERENCES AIRPORT(Airport_code)
);

CREATE TABLE LEG_INSTANCE (
    Flight_Number VARCHAR(10) NOT NULL,
    Leg_no INT NOT NULL,
    Date DATE NOT NULL,
    No_of_avail_seats INT NOT NULL,
    Dep_time TIME,
    Arr_time TIME,
    Airplane_id INT NOT NULL,
    Real_Departure_Airport_code VARCHAR(10) NOT NULL,
    Real_Arrival_Airport_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (Flight_Number, Leg_no, Date),
    FOREIGN KEY (Flight_Number, Leg_no) REFERENCES FLIGHT_LEG(Flight_Number, Leg_no),
    FOREIGN KEY (Airplane_id) REFERENCES AIRPLANE(Airplane_id),
    FOREIGN KEY (Real_Departure_Airport_code) REFERENCES AIRPORT(Airport_code),
    FOREIGN KEY (Real_Arrival_Airport_code) REFERENCES AIRPORT(Airport_code)
);

CREATE TABLE SEAT (
    Flight_Number VARCHAR(10) NOT NULL,
    Leg_no INT NOT NULL,
    Date DATE NOT NULL,
    Seat_no VARCHAR(5) NOT NULL,
    Customer_name VARCHAR(100) NOT NULL,
    Cphone VARCHAR(20),
    PRIMARY KEY (Flight_Number, Leg_no, Date, Seat_no),
    FOREIGN KEY (Flight_Number, Leg_no, Date) REFERENCES LEG_INSTANCE(Flight_Number, Leg_no, Date)
);