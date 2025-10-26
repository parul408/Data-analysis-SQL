Create Database CustomerBehavior
use CustomerBehavior;

Create Table Sales(user_id  int , created_date date ,  product_id int);
Insert into Sales(user_id   , created_date  ,  product_id ) VALUES
(1, '2017-04-19', 2),
(3, '2019-12-18', 1),
(2, '2020-07-20', 3),
(1, '2019-10-23', 2),
(1, '2018-03-19', 3),
(3, '2016-12-20', 2),
(1, '2016-11-09', 1),
(1, '2016-05-20', 3),
(2, '2017-09-24', 1),
(1, '2017-03-11', 2),
(1, '2016-03-11', 1),
(3, '2016-11-10', 1),
(3, '2017-12-07', 2),
(3, '2016-12-15', 2),
(2, '2017-11-08', 2),
(2, '2018-09-10', 3),
(4, '2019-05-01', 1),
(5, '2018-11-23', 3),
(6, '2017-06-30', 9),
(7, '2018-08-12', 8),
(8, '2019-03-19', 7),
(9, '2017-12-04', 6),
(10, '2018-09-22', 2),
(4, '2020-08-17', 1),
(5, '2017-05-12', 10),
(6, '2014-01-27', 11),
(7, '2014-04-02', 7),
(8, '2020-12-15', 8),
(9, '2017-09-08', 8);

Create table product (product_id int, product_name varchar(max),price int);
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Dal Makani', 160),
(2, 'Shahi Panner', 170),
(3, 'Butter Chicken', 340),
(4, 'Aloo Gobi', 150),
(5, 'Chole Bhature', 100),
(6, 'Fish Curry', 380),
(7, 'Chicken Tikka', 300),
(8, 'Mutton Biryani', 450),
(9, 'Veg Pulao', 200),
(10, 'Mango Lassi', 80),
(11, 'Gulab Jamun', 100);

Create Table Username (userid int,Names varchar(max));
INSERT INTO Username(userid, Names) VALUES
(1, 'Anshul'),
(2, 'Rohan'),
(3, 'Shreya'),
(4, 'Priya'),
(5, 'Aryan'),
(6, 'Sara'),
(7, 'Sahil'),
(8, 'Tanvi'),
(9, 'Ritika'),
(10, 'Gaurav');

Create Table Users ( Userid int, signup_data date)
Insert into Users ( Userid , signup_data ) values
(1, '2014-09-02'),
(2, '2015-01-15'),
(3, '2014-04-11'),
(4, '2015-11-17'),
(10, '2016-01-02'),
(9, '2016-01-02'),
(7, '2013-04-02'),
(8, '2013-12-15'),
(5, '2015-09-08'),
(6, '2014-07-13');

Create Table Golduser(userid int, signupdata date);
Insert into Golduser( userid, signupdata)values
(1, '2014-09-02'),
(2, '2015-01-15'),
(3, '2014-04-11'),
(4, '2015-11-17'),
(10, '2016-01-02'),
(9, '2016-01-02'),
(7, '2013-04-02'),
(8, '2013-12-15'),
(5, '2015-09-08'),
(6, '2014-07-13');
SELECT p.product_name, SUM(p.price) AS total_revenue
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

	SELECT p.product_name, SUM(p.price) AS total_revenue
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 3;

SELECT COUNT(*) AS gold_users_count
FROM Golduser;

SELECT SUM(p.price) AS gold_users_revenue
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
JOIN Golduser g ON s.user_id = g.userid;

SELECT userid, signupdata AS gold_signup_date
FROM Golduser;

SELECT p.product_name, COUNT(*) AS purchase_count
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
JOIN Golduser g ON s.user_id = g.userid
GROUP BY p.product_name
ORDER BY purchase_count DESC
LIMIT 1;
SELECT YEAR(created_date) AS sale_year, SUM(p.price) AS total_revenue
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY YEAR(created_date)
ORDER BY sale_year;

SELECT YEAR(created_date) AS sale_year, SUM(p.price) AS total_revenue
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY YEAR(created_date)
ORDER BY sale_year;

-- Average signup date for all users
SELECT AVG(DATEDIFF(day, '1900-01-01', signup_data)) AS avg_all_signup_days
FROM Users;

-- Average signup date for gold users
SELECT AVG(DATEDIFF(day, '1900-01-01', signupdata)) AS avg_gold_signup_days
FROM Golduser;

SELECT g.userid, COUNT(s.user_id) AS order_count
FROM Golduser g
LEFT JOIN Sales s ON g.userid = s.user_id
GROUP BY g.userid;

SELECT u.Names, SUM(p.price) AS total_spent
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY u.Names;

SELECT u.Names, COUNT(s.user_id) AS visit_frequency
FROM Username u
LEFT JOIN Sales s ON u.userid = s.user_id
GROUP BY u.Names;

SELECT u.Names, p.product_name, s.created_date
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
WHERE (u.userid, s.created_date) IN (
    SELECT user_id, MIN(created_date)
    FROM Sales
    GROUP BY user_id
)
ORDER BY u.Names;

SELECT p.product_name, COUNT(*) AS purchase_count
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY purchase_count DESC
LIMIT 1;

SELECT u.Names, p.product_name, COUNT(*) AS purchase_count
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY u.Names, p.product_name
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Sales s2
        WHERE s2.user_id = u.userid
        GROUP BY s2.product_id
    ) AS counts
);

SELECT u.Names, p.product_name, s.created_date
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
JOIN Golduser g ON u.userid = g.userid
WHERE s.created_date > g.signupdata
AND (u.userid, s.created_date) IN (
    SELECT s2.user_id, MIN(s2.created_date)
    FROM Sales s2
    JOIN Golduser g2 ON s2.user_id = g2.userid
    WHERE s2.created_date > g2.signupdata
    GROUP BY s2.user_id
);
SELECT u.Names, p.product_name, s.created_date
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
JOIN Golduser g ON u.userid = g.userid
WHERE s.created_date < g.signupdata
AND (u.userid, s.created_date) IN (
    SELECT s2.user_id, MAX(s2.created_date)
    FROM Sales s2
    JOIN Golduser g2 ON s2.user_id = g2.userid
    WHERE s2.created_date < g2.signupdata
    GROUP BY s2.user_id
);
SELECT u.Names, COUNT(s.user_id) AS total_orders, SUM(p.price) AS total_spent
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
JOIN Golduser g ON u.userid = g.userid
WHERE s.created_date < g.signupdata
GROUP BY u.Names;

SELECT
    u.Names,
    s.created_date,
    p.product_name,
    CASE
        WHEN g.userid IS NOT NULL THEN RANK() OVER (PARTITION BY s.user_id ORDER BY s.created_date)
        ELSE 'na'
    END AS transaction_rank
FROM Username u
JOIN Sales s ON u.userid = s.user_id
JOIN Product p ON s.product_id = p.product_id
LEFT JOIN Golduser g ON u.userid = g.userid;

