-- VERY EASY
CREATE TABLE favoriteCars(
	make VARCHAR(255),
	model VARCHAR(255),
	year INT
);

INSERT INTO favoriteCars (make, model, year)
VALUES
("Nissan", "GTR Skyline", 1999),
("Chevrolet", "Camaro", 2023),
("Lamborghini", "Aventador", 2022);


INSERT INTO favoriteCars (make, model, year)
VALUES
("Nissan", "Altima", 2022),
("Toyota", "Carola", 2022);

-- EASY
CREATE TABLE favoriteBooks (
	title VARCHAR(255),
	author VARCHAR(255),
	publish_date INT
);

INSERT INTO favoriteBooks (title, author, publish_date)
VALUES
("To Kill A Mockingbird", "Harper Lee", 1960),
("1984", "George Orwell", 1949),
("The Great Gatsby", "F. Scott Fitzgerald", 1925),
("Pride And Prejudice", "Jane Austen", 1813),
("The Catcher in the Rye", "J.D. Salinger", 1951);

INSERT INTO favoriteBooks (title, author, publish_date)
VALUES
("Moby-Dick", "Herman Melville", 1851),
("Diary Of A Wimpy Kid", "Jeff Kinney", 2010);

DELETE FROM favoriteBooks ORDER BY publish_date ASC LIMIT 1; 

SELECT COUNT(title) AS book_count FROM favoriteBooks

-- MEDIUM
CREATE TABLE favoriteMovies (
	title VARCHAR(255),
	release_date DATE,
	rating DECIMAL(3,1)
);

INSERT INTO favoriteMovies (title, release_date, rating)
VALUES
    ('The Shawshank Redemption', '1994-10-14', 9.3),
    ('The Godfather', '1972-03-24', 9.2),
    ('The Dark Knight', '2008-07-18', 9.0),
    ('Pulp Fiction', '1994-10-14', 8.9),
    ('Fight Club', '1999-10-15', 8.8),
    ('Forrest Gump', '1994-07-06', 8.8),
    ('Inception', '2010-07-16', 8.7),
    ('The Matrix', '1999-03-31', 8.7),
    ('Goodfellas', '1990-09-19', 8.7),
    ('The Lord of the Rings: The Return of the King', '2003-12-17', 8.9);
   
   SELECT * FROM favoriteMovies
   WHERE title LIKE "%s%" 
   ORDER BY release_date ASC
   
   -- HARD
 CREATE TABLE favoriteMoviesV2 LIKE favoriteMovies
 INSERT INTO favoriteMoviesV2 SELECT * FROM favoriteMovies
 
 ALTER TABLE favoriteMoviesV2
 ADD director_first_name VARCHAR(255),
 ADD director_last_name VARCHAR(255);


UPDATE favoriteMoviesV2 
SET director_first_name = "Frank",
director_last_name = "Darabont"
WHERE title = "The Shawshank Redemption"

UPDATE favoriteMoviesV2 
SET director_first_name = "Francis",
director_last_name = "Cappola"
WHERE title = "The Godfather"

UPDATE favoriteMoviesV2 
SET director_first_name = "Christopher",
director_last_name = "Nolan"
WHERE title = "The Dark Knight"

UPDATE favoriteMoviesV2 
SET director_first_name = "Quentin",
director_last_name = "Tarantino"
WHERE title = "Pulp Fiction"

UPDATE favoriteMoviesV2 
SET director_first_name = "David",
director_last_name = "Fincher"
WHERE title = "Fight Club"

UPDATE favoriteMoviesV2 
SET director_first_name = "Robert",
director_last_name = "Zemeckis"
WHERE title = "Forrest Gump"

UPDATE favoriteMoviesV2 
SET director_first_name = "Christopher",
director_last_name = "Nolan"
WHERE title = "Inception"

UPDATE favoriteMoviesV2 
SET director_first_name = "Lily",
director_last_name = "Wachowski"
WHERE title = "The Matrix"

UPDATE favoriteMoviesV2 
SET director_first_name = "Martin",
director_last_name = "Scorsese"
WHERE title = "Goodfellas"

UPDATE favoriteMoviesV2 
SET director_first_name = "Peter",
director_last_name = "Jackson"
WHERE title = "The Lord of the Rings: The Return of the King"

ALTER TABLE favoriteMoviesV2 
ADD COLUMN director_name VARCHAR(255)

UPDATE favoriteMoviesV2 
SET director_name = CONCAT(director_first_name, " ", director_last_name) 

SELECT * FROM favoriteMoviesV2 ORDER BY director_last_name ASC

DELETE FROM favoriteMoviesV2 WHERE director_last_name LIKE "%[r-z]";

SELECT * FROM favoriteMoviesV2 fmv 

SELECT * FROM favoriteMoviesV2 
WHERE rating = 9.3 
OR rating = 9.2 
OR rating = 9;

-- VERY HARD
CREATE TABLE favoriteCarsV2 LIKE favoriteCars
INSERT INTO favoriteCarsV2 SELECT * FROM favoriteCars

INSERT INTO favoriteCarsV2 (make, model, year)
VALUES
("Toyota", "Camry", 2022),
("Honda", "Civic", 2023),
("Ford", "Mustang", 2021);

ALTER TABLE favoriteCarsV2 
ADD COLUMN price DECIMAL(10,2),
ADD COLUMN color VARCHAR(255);

UPDATE favoriteCarsV2
SET price =
CASE
WHEN make = 'Nissan' AND model = 'GTR Skyline' THEN 25000
WHEN make = 'Chevrolet' AND model = 'Camaro' THEN 22000
WHEN make = 'Lamborghini' AND model = 'Aventador' THEN 35000
WHEN make = 'Nissan' AND model = 'Altima' THEN 45000
WHEN make = 'Toyota' AND model = 'Carola' THEN 18000
WHEN make = 'Toyota' AND model = 'Camry' THEN 17000
WHEN make = 'Honda' AND model = 'Civic' THEN 29000
WHEN make = 'Ford' AND model = 'Mustang' THEN 23000
END,
color =
CASE
WHEN make = 'Nissan' AND model = 'GTR Skyline' THEN 'Silver'
WHEN make = 'Chevrolet' AND model = 'Camaro' THEN 'Black'
WHEN make = 'Lamborghini' AND model = 'Aventador' THEN 'Red'
WHEN make = 'Nissan' AND model = 'Altima' THEN 'Blue'
WHEN make = 'Toyota' AND model = 'Carola' THEN 'Yellow'
WHEN make = 'Toyota' AND model = 'Camry' THEN 'Red'
WHEN make = 'Honda' AND model = 'Civic' THEN 'Silver'
WHEN make = 'Ford' AND model = 'Mustang' THEN 'Green'
END;

SELECT CONCAT (make, " ", model) AS make_and_model FROM favoriteCarsV2

SELECT make, COUNT(*) AS make_count FROM favoriteCarsV2 GROUP BY make

SELECT * FROM favoriteCarsV2
