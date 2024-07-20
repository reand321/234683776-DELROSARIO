-- Create a table to store radii and their corresponding areas
CREATE TABLE Circle (
    id INTEGER PRIMARY KEY,
    radius REAL,
    area REAL
);

-- Insert a radius and calculate the area
INSERT INTO Circle (radius, area)
VALUES (5, 3.141592653589793 * 5 * 5);

-- Query to fetch the area of a circle given its radius
SELECT area FROM Circle WHERE radius = 5;
