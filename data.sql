-- ============================================================
-- SIMPLE TFI HEROES DATABASE
-- Experience & Salaries
-- ============================================================

-- Create database
CREATE DATABASE IF NOT EXISTS tfi_heroes;
USE tfi_heroes;

-- ============================================================
-- TABLE 1: HEROES
-- ============================================================
CREATE TABLE heroes (
    hero_id       INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100) NOT NULL,
    debut_year    INT NOT NULL,
    total_films   INT DEFAULT 0
);

-- ============================================================
-- TABLE 2: SALARIES
-- ============================================================
CREATE TABLE salaries (
    salary_id       INT PRIMARY KEY AUTO_INCREMENT,
    hero_id         INT NOT NULL,
    movie_name      VARCHAR(150) NOT NULL,
    release_year    INT NOT NULL,
    salary_crores   DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (hero_id) REFERENCES heroes(hero_id)
);

-- ============================================================
-- INSERT HEROES
-- ============================================================
INSERT INTO heroes (name, debut_year, total_films) VALUES
('Chiranjeevi',      1978, 155),
('Nagarjuna',        1986, 100),
('Pawan Kalyan',     1996,  30),
('Mahesh Babu',      1979,  30),
('Allu Arjun',       2003,  25),
('Jr NTR',           1997,  32),
('Ram Charan',       2007,  18),
('Prabhas',          2002,  28),
('Rana Daggubati',   2010,  25),
('Vijay Deverakonda',2011,  15),
('Nani',             2008,  32);

-- ============================================================
-- INSERT SALARIES
-- ============================================================
INSERT INTO salaries (hero_id, movie_name, release_year, salary_crores) VALUES
(1, 'Sye Raa Narasimha Reddy', 2019, 100.00),
(1, 'Acharya',                 2022,  60.00),
(2, 'Bangarraju',              2022,  25.00),
(3, 'Vakeel Saab',             2021,  40.00),
(3, 'Bheemla Nayak',           2022,  50.00),
(4, 'Sarkaru Vaari Paata',     2022,  75.00),
(4, 'Guntur Kaaram',           2024,  85.00),
(5, 'Pushpa: The Rise',        2021,  60.00),
(5, 'Pushpa 2: The Rule',      2024, 150.00),
(6, 'RRR',                     2022,  75.00),
(6, 'Devara: Part 1',          2024,  80.00),
(7, 'RRR',                     2022,  70.00),
(8, 'Baahubali 2',             2017,  50.00),
(8, 'Salaar',                  2023, 100.00),
(8, 'Kalki 2898 AD',           2024, 120.00),
(9, 'Baahubali 2',             2017,  20.00),
(10, 'Arjun Reddy',            2017,   5.00),
(10, 'Liger',                  2022,  25.00),
(11, 'Jersey',                 2019,  10.00),
(11, 'Dasara',                 2023,  20.00);

-- ============================================================
-- SAMPLE QUERIES
-- ============================================================

-- 1) Show all heroes with experience
SELECT 
    name,
    debut_year,
    (2025 - debut_year) AS experience_years,
    total_films
FROM heroes
ORDER BY experience_years DESC;

-- 2) Show all salaries with hero names
SELECT 
    h.name,
    s.movie_name,
    s.release_year,
    s.salary_crores
FROM salaries s
JOIN heroes h ON s.hero_id = h.hero_id
ORDER BY s.salary_crores DESC;

-- 3) Average salary per hero
SELECT 
    h.name,
    (2025 - h.debut_year) AS experience_years,
    ROUND(AVG(s.salary_crores), 2) AS avg_salary,
    MAX(s.salary_crores) AS highest_salary
FROM heroes h
JOIN salaries s ON h.hero_id = s.hero_id
GROUP BY h.hero_id
ORDER BY highest_salary DESC;

-- 4) Top 5 highest paid movies
SELECT 
    h.name,
    s.movie_name,
    s.salary_crores
FROM salaries s
JOIN heroes h ON s.hero_id = h.hero_id
ORDER BY s.salary_crores DESC
LIMIT 5;

-- 5) Heroes with more than 25 years experience
SELECT 
    name,
    debut_year,
    (2025 - debut_year) AS experience_years
FROM heroes
WHERE (2025 - debut_year) > 25
ORDER BY experience_years DESC;
