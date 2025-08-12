-- Task : SQL Joins (Inner, Left, Right, Full)
-- Database: library_management_system
use library_management_system ;

-- 1️ INNER JOIN: Readers who issued books
-- Shows only those readers who have actually issued a book
SELECT r.first_name, b.title
FROM Readers r
INNER JOIN Issue i ON r.reader_id = i.reader_id
INNER JOIN Books b ON i.isbn = b.isbn;

-- 2️ LEFT JOIN: All readers (even if they never issued a book)
-- If a reader hasn't issued any book, the title will be NULL
SELECT r.first_name, b.title
FROM Readers r
LEFT JOIN Issue i ON r.reader_id = i.reader_id
LEFT JOIN Books b ON i.isbn = b.isbn;

-- 3️ RIGHT JOIN: All issued books (even if reader info is missing)
-- Shows all issued records and their books
SELECT r.first_name, b.title
FROM Readers r
RIGHT JOIN Issue i ON r.reader_id = i.reader_id
RIGHT JOIN Books b ON i.isbn = b.isbn;

-- 4️ FULL OUTER JOIN: Combine LEFT & RIGHT joins
-- MySQL doesn’t directly support FULL JOIN, so we use UNION
SELECT r.first_name, b.title
FROM Readers r
LEFT JOIN Issue i ON r.reader_id = i.reader_id
LEFT JOIN Books b ON i.isbn = b.isbn
UNION
SELECT r.first_name, b.title
FROM Readers r
RIGHT JOIN Issue i ON r.reader_id = i.reader_id
RIGHT JOIN Books b ON i.isbn = b.isbn;

-- 5️  CROSS JOIN: Every reader with every book
-- Creates a big list of all possible reader-book pairs
SELECT r.first_name, b.title
FROM Readers r
CROSS JOIN Books b;
