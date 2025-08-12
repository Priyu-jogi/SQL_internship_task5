# SQL Joins – Library Management System

This document demonstrates different types of SQL joins using the `library_management_system` database.  
The goal is to show clear, beginner-friendly examples that can be explained easily.

## Tables Used
- **Readers** – Stores library reader details.
- **Books** – Stores book details.
- **Issue** – Records which books have been issued to which readers.

---

## 1. INNER JOIN – Readers Who Issued Books
Shows only readers who have actually issued a book.
```sql
SELECT r.first_name, b.title
FROM Readers r
INNER JOIN Issue i ON r.reader_id = i.reader_id
INNER JOIN Books b ON i.isbn = b.isbn;

2. LEFT JOIN – All Readers (Including Those with No Issued Books)
If a reader has not issued any book, the book title will be NULL.

SELECT r.first_name, b.title
FROM Readers r
LEFT JOIN Issue i ON r.reader_id = i.reader_id
LEFT JOIN Books b ON i.isbn = b.isbn;

3. RIGHT JOIN – All Issued Books (Even if Reader Details Are Missing)
Displays all issued book records and their related details.

SELECT r.first_name, b.title
FROM Readers r
RIGHT JOIN Issue i ON r.reader_id = i.reader_id
RIGHT JOIN Books b ON i.isbn = b.isbn;

4. FULL OUTER JOIN – All Readers and Issued Records
MySQL does not directly support FULL OUTER JOIN, so we combine LEFT and RIGHT joins using UNION.

SELECT r.first_name, b.title
FROM Readers r
LEFT JOIN Issue i ON r.reader_id = i.reader_id
LEFT JOIN Books b ON i.isbn = b.isbn
UNION
SELECT r.first_name, b.title
FROM Readers r
RIGHT JOIN Issue i ON r.reader_id = i.reader_id
RIGHT JOIN Books b ON i.isbn = b.isbn;

5. CROSS JOIN – All Possible Reader–Book Combinations
Generates a list of every reader with every book.

SELECT r.first_name, b.title
FROM Readers r
CROSS JOIN Books b;
