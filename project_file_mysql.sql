
-- ----------------------------------------
-- DATABASE SETUP
-- ----------------------------------------
DROP DATABASE IF EXISTS bookstore_db;
CREATE DATABASE bookstore_db;
USE bookstore_db;

-- ----------------------------------------
-- TABLE DEFINITIONS
-- ----------------------------------------

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(255),
    country VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    genre VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    book_id INT,
    quantity INT,
    price_each DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    rating INT,
    review TEXT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ----------------------------------------
-- INSERT RECORDS
-- ----------------------------------------

-- Authors (25)
INSERT INTO authors VALUES 
(1, 'J.K. Rowling', 'UK'), (2, 'George R.R. Martin', 'USA'), (3, 'J.R.R. Tolkien', 'UK'),
(4, 'Stephen King', 'USA'), (5, 'Agatha Christie', 'UK'), (6, 'Dan Brown', 'USA'),
(7, 'C.S. Lewis', 'UK'), (8, 'Isaac Asimov', 'Russia'), (9, 'Mark Twain', 'USA'),
(10, 'Jane Austen', 'UK'), (11, 'Ernest Hemingway', 'USA'), (12, 'F. Scott Fitzgerald', 'USA'),
(13, 'Haruki Murakami', 'Japan'), (14, 'Leo Tolstoy', 'Russia'), (15, 'Paulo Coelho', 'Brazil'),
(16, 'Khaled Hosseini', 'Afghanistan'), (17, 'Charles Dickens', 'UK'), (18, 'Suzanne Collins', 'USA'),
(19, 'John Green', 'USA'), (20, 'Neil Gaiman', 'UK'), (21, 'Roald Dahl', 'UK'),
(22, 'Arthur C. Clarke', 'UK'), (23, 'Douglas Adams', 'UK'), (24, 'E. L. James', 'UK'),
(25, 'Nicholas Sparks', 'USA');

-- Books (25)
INSERT INTO books VALUES 
(101, 'Harry Potter 1', 1, 'Fantasy', 399.99, 30, 1997),
(102, 'Game of Thrones', 2, 'Fantasy', 499.99, 25, 1996),
(103, 'The Hobbit', 3, 'Fantasy', 299.99, 40, 1937),
(104, 'The Shining', 4, 'Horror', 199.99, 50, 1977),
(105, 'Murder on the Orient Express', 5, 'Mystery', 299.99, 35, 1934),
(106, 'Da Vinci Code', 6, 'Thriller', 349.99, 42, 2003),
(107, 'Narnia', 7, 'Fantasy', 279.99, 40, 1950),
(108, 'Foundation', 8, 'Sci-Fi', 379.99, 20, 1951),
(109, 'Tom Sawyer', 9, 'Fiction', 189.99, 25, 1876),
(110, 'Pride and Prejudice', 10, 'Romance', 209.99, 22, 1813),
(111, 'Old Man and The Sea', 11, 'Fiction', 199.99, 28, 1952),
(112, 'Great Gatsby', 12, 'Classic', 299.99, 30, 1925),
(113, 'Kafka on the Shore', 13, 'Fiction', 349.99, 33, 2002),
(114, 'War and Peace', 14, 'Classic', 599.99, 15, 1869),
(115, 'The Alchemist', 15, 'Fiction', 229.99, 20, 1988),
(116, 'Kite Runner', 16, 'Drama', 199.99, 27, 2003),
(117, 'Oliver Twist', 17, 'Classic', 249.99, 23, 1839),
(118, 'Mockingjay', 18, 'Fantasy', 349.99, 26, 2010),
(119, 'Fault in Our Stars', 19, 'Romance', 199.99, 22, 2012),
(120, 'American Gods', 20, 'Fantasy', 299.99, 18, 2001),
(121, 'Matilda', 21, 'Children', 199.99, 35, 1988),
(122, '2001: Space Odyssey', 22, 'Sci-Fi', 349.99, 19, 1968),
(123, 'Hitchhiker’s Guide', 23, 'Sci-Fi', 259.99, 20, 1979),
(124, 'Fifty Shades', 24, 'Romance', 199.99, 17, 2011),
(125, 'Notebook', 25, 'Romance', 189.99, 24, 1996);

-- Customers (25)
INSERT INTO customers VALUES 
(201, 'Alice', 'alice@mail.com', 'New York'),
(202, 'Bob', 'bob@mail.com', 'Los Angeles'),
(203, 'Charlie', 'charlie@mail.com', 'Chicago'),
(204, 'David', 'david@mail.com', 'Houston'),
(205, 'Eva', 'eva@mail.com', 'Phoenix'),
(206, 'Fiona', 'fiona@mail.com', 'San Diego'),
(207, 'George', 'george@mail.com', 'Dallas'),
(208, 'Helen', 'helen@mail.com', 'Austin'),
(209, 'Ian', 'ian@mail.com', 'San Jose'),
(210, 'Julia', 'julia@mail.com', 'San Francisco'),
(211, 'Kevin', 'kevin@mail.com', 'Seattle'),
(212, 'Lily', 'lily@mail.com', 'Denver'),
(213, 'Mike', 'mike@mail.com', 'Boston'),
(214, 'Nina', 'nina@mail.com', 'Atlanta'),
(215, 'Oscar', 'oscar@mail.com', 'Detroit'),
(216, 'Paul', 'paul@mail.com', 'Philadelphia'),
(217, 'Quincy', 'quincy@mail.com', 'Miami'),
(218, 'Rachel', 'rachel@mail.com', 'Orlando'),
(219, 'Steve', 'steve@mail.com', 'Baltimore'),
(220, 'Tina', 'tina@mail.com', 'Las Vegas'),
(221, 'Uma', 'uma@mail.com', 'Cleveland'),
(222, 'Victor', 'victor@mail.com', 'San Antonio'),
(223, 'Wendy', 'wendy@mail.com', 'Portland'),
(224, 'Xander', 'xander@mail.com', 'Indianapolis'),
(225, 'Yara', 'yara@mail.com', 'Tampa');

-- Orders (25)
INSERT INTO orders VALUES 
(301, 201, '2025-01-01', 699.98),
(302, 202, '2025-01-02', 299.99),
(303, 203, '2025-01-03', 189.99),
(304, 204, '2025-01-04', 599.99),
(305, 205, '2025-01-05', 349.99),
(306, 206, '2025-01-06', 279.99),
(307, 207, '2025-01-07', 229.99),
(308, 208, '2025-01-08', 499.99),
(309, 209, '2025-01-09', 199.99),
(310, 210, '2025-01-10', 399.99),
(311, 211, '2025-01-11', 259.99),
(312, 212, '2025-01-12', 279.99),
(313, 213, '2025-01-13', 209.99),
(314, 214, '2025-01-14', 319.99),
(315, 215, '2025-01-15', 179.99),
(316, 216, '2025-01-16', 189.99),
(317, 217, '2025-01-17', 229.99),
(318, 218, '2025-01-18', 249.99),
(319, 219, '2025-01-19', 199.99),
(320, 220, '2025-01-20', 309.99),
(321, 221, '2025-01-21', 399.99),
(322, 222, '2025-01-22', 349.99),
(323, 223, '2025-01-23', 289.99),
(324, 224, '2025-01-24', 179.99),
(325, 225, '2025-01-25', 199.99);

-- Order Items (25)
INSERT INTO order_items VALUES 
(301, 101, 1, 399.99), (301, 102, 1, 299.99),
(302, 103, 1, 299.99), (303, 109, 1, 189.99),
(304, 114, 1, 599.99), (305, 118, 1, 349.99),
(306, 107, 1, 279.99), (307, 115, 1, 229.99),
(308, 102, 1, 499.99), (309, 121, 1, 199.99),
(310, 106, 1, 399.99), (311, 123, 1, 259.99),
(312, 122, 1, 279.99), (313, 110, 1, 209.99),
(314, 119, 1, 319.99), (315, 124, 1, 179.99),
(316, 125, 1, 189.99), (317, 117, 1, 229.99),
(318, 105, 1, 249.99), (319, 108, 1, 199.99),
(320, 104, 1, 309.99), (321, 101, 1, 399.99),
(322, 111, 1, 349.99), (323, 112, 1, 289.99),
(324, 113, 1, 179.99), (325, 116, 1, 199.99);

-- Reviews (25)
INSERT INTO reviews VALUES
(401, 101, 201, 5, 'Fantastic read!', '2025-01-05'),
(402, 102, 202, 4, 'Loved the plot.', '2025-01-06'),
(403, 103, 203, 5, 'Classic!', '2025-01-07'),
(404, 104, 204, 3, 'Scary but slow.', '2025-01-08'),
(405, 105, 205, 5, 'Great mystery!', '2025-01-09'),
(406, 106, 206, 4, 'Exciting!', '2025-01-10'),
(407, 107, 207, 5, 'For all ages.', '2025-01-11'),
(408, 108, 208, 5, 'Sci-fi gem.', '2025-01-12'),
(409, 109, 209, 4, 'Good classic.', '2025-01-13'),
(410, 110, 210, 5, 'Lovely story.', '2025-01-14'),
(411, 111, 211, 4, 'Inspiring.', '2025-01-15'),
(412, 112, 212, 4, 'Timeless.', '2025-01-16'),
(413, 113, 213, 5, 'Mind-bending.', '2025-01-17'),
(414, 114, 214, 3, 'Very long.', '2025-01-18'),
(415, 115, 215, 4, 'Motivational.', '2025-01-19'),
(416, 116, 216, 5, 'Emotional.', '2025-01-20'),
(417, 117, 217, 3, 'Good for school.', '2025-01-21'),
(418, 118, 218, 4, 'Great finale.', '2025-01-22'),
(419, 119, 219, 5, 'Loved it!', '2025-01-23'),
(420, 120, 220, 4, 'Fantasy goodness.', '2025-01-24'),
(421, 121, 221, 5, 'Very fun.', '2025-01-25'),
(422, 122, 222, 5, 'Space classic.', '2025-01-26'),
(423, 123, 223, 4, 'Hilarious.', '2025-01-27'),
(424, 124, 224, 3, 'Not for me.', '2025-01-28'),
(425, 125, 225, 4, 'Heartwarming.', '2025-01-29');


select * from reviews;
-- BookStore_table.sql
-- Displaying BookStore_table.sql.

show tables;

-- SELECT DISTINCT 
--     TABLE_NAME
-- FROM 
--     INFORMATION_SCHEMA.COLUMNS
-- WHERE 
--     IS_NULLABLE = 'YES';

-- join the autg
-- find the top selling by quantity.
select b.title, sum(oi.quantity) as totalQuantity from books as b join order_items as oi where b.book_id = oi.book_id 
group by b.title order by totalQuantity desc limit 1;


-- you need to get customer detals who order the book return by stephen king

select c.customer_id, o.customer_id from customers as c join orders as o where c.customer_id=o.customer_id;
select o.order_id, oi.order_id from orders as o join order_items as oi where  o.order_id=oi.order_id;
select b.book_id, oi.book_id from books as b join order_items as oi where   b.book_id= oi.book_id ;

SELECT DISTINCT c.customer_id,a.name
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN books AS b ON oi.book_id = b.book_id 
join authors AS a ON b.author_id= a.author_id ;

select b.title,avg(r.rating) as avg_rating from books as b  join reviews as r  where  b.book_id=r.book_id group by b.title;
-- corelated sub query
-- select title,(select avg(rating) from reviews as r ) from




-- running total of order per customer

-- get the author with avg(rating) get item the view
-- which author have hight book rating only show particulure information for the user which have minimum 2 review.alter

select c.name,c.customer_id , count(o.order_id) as total_book_order from customers as c join orders as o where c.customer_id=o.customer_id group by c.customer_id order by o.order_id;
SELECT 
    c.name,
    c.customer_id,
    COUNT(o.order_id) AS total_book_order
FROM 
    customers AS c
JOIN 
    orders AS o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.name, c.customer_id
ORDER BY 
    total_book_order DESC;
show tables;


SELECT a.name,b.book_id, avg(r.rating)  from books as b join reviews as r on b.book_id= r.book_id
join authors as a on a.author_id = b.author_id ;

-- which author have hight book rating only show particulure information for the user which have minimum 2 review.alter

SELECT a.name,b.book_id, avg(r.rating) as rating from books as b join reviews as r on b.book_id= r.book_id
join authors as a on a.author_id = b.author_id  where rating>2;



-- day 2 project works

-- to fin

select c.customer_id,c.name,round(avg(total_amount),2) as total_avg ,
rank() over( order by avg(total_amount) desc)
from customers as c
join orders as o where c.customer_id =o.customer_id
group by customer_id;


select * from books;
select * from order_items;

-- you need to find out most selling books in each by joner

select oi.book_id,b.title, b.genre , rank() over( partition by  b.genre order by sum(oi.quantity)) as top_most_book from books as b join order_items as oi where b.book_id = oi.book_id  ;


-- new 

with cte as 
(select b.genre,b.book_id, b.title, sum(o.quantity),
rank() over(partition by b.genre order by sum(o.quantity) desc ) as total_rank
from books as b join order_items as o 
where b.book_id = o.book_id
group by  b.genre,b.book_id)

select * from cte;


-- 1. find those books whihc are  sold together 
-- 2. make the trigger , order count , keep counting , auto matice set the , count who many order_items in data insert give me how many order are placed 
