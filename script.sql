CREATE DATABASE airline_company;


CREATE TABLE Crew (
    crew_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE Aircraft (
    aircraft_id SERIAL PRIMARY KEY,
    model VARCHAR(100),
    registration_number VARCHAR(20)
);

CREATE TABLE CrewAircraftExperience (
    crew_id INT REFERENCES Crew(crew_id),
    aircraft_id INT REFERENCES Aircraft(aircraft_id),
    PRIMARY KEY (crew_id, aircraft_id)
);



INSERT INTO Crew (name, date_of_birth) VALUES
    ('Marko Markic', '1990-05-15'),
    ('Ana Anic', '1985-08-20'),
    ('Mate Matic', '1982-03-10'),
    ('Josipa Josipovic', '1988-12-05'),
    ('Karlo Karlic', '1995-07-30');

INSERT INTO Aircraft (model, registration_number) VALUES
    ('Boeing 737', 'ABC123'),
    ('Airbus A319', 'XYZ456'),
    ('Airbus A320', 'DEF789'),
    ('Boeing 757', 'GHI101'),
    ('De Havilland Canada Dash 8', 'JKL202');

INSERT INTO CrewAircraftExperience (crew_id, aircraft_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 3),
    (4, 1),
    (4, 2),
    (4, 3),
    (5, 5);
