CREATE DATABASE LibraryManagementSystem

/* Create tables */

CREATE TABLE tbl_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_borrowers (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	name VARCHAR(50),
	address VARCHAR(50),
	phone VARCHAR(20)
);

CREATE TABLE tbl_loans (
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrowers(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);

CREATE TABLE tbl_authors (
	book_id INT NOT NULL CONSTRAINT fk_authors_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);

/* Populate tables */

INSERT INTO tbl_branch
	(branch_name, address)
	VALUES
	('Sharpstown', '2302 NE Madrona Street'),
	('Central', '1200 Pine Ave'),
	('Dullstown', '4988 SW Cedar Drive'),
	('North', '2310 N Hemlock Street')
SELECT * FROM tbl_branch

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Bloomsbury', '1385 Broadway Fifth Floor New York, NY 10018', '212-419-5300'),
	('Doubleday', '1745 Broadway New York, NY 10019', '212-554-6577'),
	('Penguin Random House', '1111 1st Street New York, NY 10017', '212-767-8765'),
	('HarperCollins', '195 Broadway New York, NY 10007', '212-207-7000')
SELECT * FROM tbl_publisher

INSERT INTO tbl_books
	(title, publisher_name)
	VALUES
	('Harry Potter and the Sorcerer''s Stone', 'Bloomsbury'),
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
	('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
	('Harry Potter and the Goblet of Fire', 'Bloomsbury'),
	('Harry Potter and the Order of the Phoenix', 'Bloomsbury'),
	('Harry Potter and the Half-Blood Prince', 'Bloomsbury'),
	('Harry Potter and the Deathly Hallows', 'Bloomsbury'),
	('The Lost Tribe', 'Penguin Random House'),
	('The Shining', 'Doubleday'),
	('Carrie', 'Doubleday'),
	('To Kill a Mockingbird', 'HarperCollins'),
	('Matilda', 'Penguin Random House'),
	('The BFG', 'Penguin Random House'),
	('The Girl on the Train', 'Penguin Random House'),
	('Americanah', 'Penguin Random House'),
	('The Cat in the Hat', 'Penguin Random House'),
	('Green Eggs and Ham', 'Penguin Random House'),
	('Oh the Places You''ll Go', 'Penguin Random House'),
	('Snow Falling on Cedars', 'Penguin Random House'),
	('Becoming', 'Penguin Random House'),
	('I Know Why the Caged Bird Sings', 'Penguin Random House')
SELECT * FROM tbl_books

INSERT INTO tbl_copies
	(book_id, branch_id, number_of_copies)
	VALUES
	(100, 1, 6),
	(101, 1, 4),
	(102, 1, 4),
	(103, 1, 5),
	(104, 1, 4),
	(105, 1, 6),
	(106, 1, 5),
	(107, 1, 2), 
	(108, 1, 2),
	(109, 1, 3), 
	(110, 1, 7),
	(111, 1, 4),
	(112, 1, 6),
	(113, 1, 2),
	(114, 1, 2),
	(115, 1, 6),
	(116, 1, 5),
	(117, 1, 4),
	(118, 1, 2),
	(119, 1, 8),
	(120, 1, 3),
	(100, 2, 10),
	(101, 2, 9),
	(102, 2, 9),
	(103, 2, 8),
	(104, 2, 9),
	(105, 2, 6),
	(106, 2, 8),
	(107, 2, 6),
	(108, 2, 2),
	(109, 2, 4),
	(110, 2, 4),
	(111, 2, 3),
	(112, 2, 5),
	(113, 2, 2),
	(114, 2, 2),
	(115, 2, 8),
	(116, 2, 9),
	(117, 2, 11),
	(118, 2, 6),
	(100, 3, 2),
	(101, 3, 3),
	(102, 3, 5),
	(103, 3, 4),
	(104, 3, 3),
	(105, 3, 8),
	(106, 3, 4),
	(108, 3, 3),
	(109, 3, 2),
	(110, 3, 6),
	(111, 3, 2),
	(112, 3, 7),
	(119, 3, 3),
	(120, 3, 2),
	(107, 4, 3),
	(108, 4, 2),
	(110, 4, 5),
	(111, 4, 3),
	(112, 4, 5),
	(113, 4, 2),
	(114, 4, 4),
	(115, 4, 8),
	(116, 4, 4),
	(117, 4, 3),
	(118, 4, 2),
	(119, 4, 7),
	(120, 4, 3)
SELECT * FROM tbl_copies

INSERT INTO tbl_borrowers
	(name, address, phone)
	VALUES
	('Albert Jones', '234 Sardine Street', '343-535-1155'),
	('Conner Lee', '9008 Salmon Drive', '665-292-1899'),
	('Ramona Matson', '400 Coho Stret', '229-494-2838'),
	('Louisa Ardona', '12 Chinook Ave', '233-545-2352'),
	('Kelly Smith', '5667 Trout Lane', '887-565-4545'),
	('Troy Vaughn', '444 Cod Court', '766-755-4534'),
	('Lola Alvarez', '90 Tilapia Street', '121-343-5555'),
	('Gromit Gruffs', '4088 Tuna Street', '554-494-3939'),
	('Sarah Babson', '134 Halibut Lane', '229-808-4400'),
	('Bobby Willow', '5498 Herring Ave', '244-464-3355')
SELECT * FROM tbl_borrowers

INSERT INTO tbl_loans
	(book_id, branch_id, card_no, date_out, date_due)
	VALUES
	(100, 1, 1009, '3-3-2019', '3-24-2019'),
	(100, 1, 1006, '2-27-2019', '3-20-2019'),
	(101, 1, 1006, '3-1-2019', '3-22-2019'),
	(102, 1, 1005, '2-16-2019', '3-9-2019'),
	(103, 1, 1000, '2-25-2019', '3-18-2019'),
	(104, 1, 1008, '3-6-2019', '3-27-2019'),
	(108, 1, 1005, '2-24-2019', '3-17-2019'),
	(108, 1, 1009, '2-17-2019', '3-10-2019'),
	(110, 1, 1005, '3-1-2019', '3-22-2019'),
	(112, 1, 1009, '2-27-2019', '3-20-2019'),
	(112, 1, 1005, '3-6-2019', '3-27-2019'),
	(113, 1, 1009, '2-21-2019', '3-14-2019'),
	(114, 1, 1006, '3-2-2019', '3-23-2019'),
	(115, 1, 1006, '2-19-2019', '3-12-2019'),
	(117, 1, 1009, '2-17-2019', '3-10-2019'),
	(118, 1, 1009, '2-18-2019', '3-11-2019'),
	(119, 1, 1009, '3-4-2019', '3-25-2019'),
	(119, 1, 1006, '3-2-2019', '3-23-2019'),
	(120, 1, 1005, '2-21-2019', '3-14-2019'),
	(100, 2, 1008, '3-6-2019', '3-27-2019'),
	(103, 2, 1004, '2-26-2019', '3-19-2019'),
	(106, 2, 1004, '3-4-2019', '3-25-2019'),
	(109, 2, 1004, '2-19-2019', '3-12-2019'),
	(110, 2, 1004, '2-17-2019', '3-10-2019'),
	(110, 2, 1008, '2-27-2019', '3-20-2019'),
	(112, 2, 1008, '2-20-2019', '3-13-2019'),
	(112, 2, 1004, '2-16-2019', '3-9-2019'),
	(114, 2, 1004, '3-2-2019', '3-23-2019'),
	(117, 2, 1004, '3-1-2019', '3-22-2019'),
	(117, 2, 1006, '2-23-2019', '3-16-2019'),
	(118, 2, 1004, '3-2-2019', '3-23-2019'),
	(118, 2, 1008, '3-6-2019', '3-27-2019'),
	(100, 3, 1000, '2-25-2019', '3-18-2019'),
	(101, 3, 1002, '3-4-2019', '3-25-2019'),
	(106, 3, 1002, '2-16-2019', '3-9-2019'), 
	(108, 3, 1002, '2-17-2019', '3-10-2019'),
	(110, 3, 1002, '2-28-2019', '3-21-2019'),
	(111, 3, 1002, '3-6-2019', '3-27-2019'),
	(111, 3, 1005, '2-19-2019', '3-12-2019'),
	(120, 3, 1002, '2-16-2019', '3-9-2019'),
	(108, 4, 1000, '2-20-2019', '3-13-2019'),
	(110, 4, 1000, '3-6-2019', '3-27-2019'),
	(111, 4, 1000, '3-4-2019', '3-25-2019'),
	(112, 4, 1000, '3-3-2019', '3-24-2019'),
	(113, 4, 1000, '2-26-2019', '3-19-2019'),
	(113, 4, 1001, '2-17-2019', '3-10-2019'),
	(114, 4, 1000, '2-16-2019', '3-9-2019'),
	(117, 4, 1000, '2-22-2019', '3-15-2019'),
	(118, 4, 1001, '3-4-2019', '3-25-2019'),
	(119, 4, 1000, '3-6-2019', '3-27-2019')
SELECT * FROM tbl_loans

INSERT INTO tbl_authors
	(book_id, author_name)
	VALUES
	(100, 'J.K Rowling'),
	(101, 'J.K Rowling'),
	(102, 'J.K Rowling'),
	(103, 'J.K Rowling'),
	(104, 'J.K Rowling'),
	(105, 'J.K Rowling'),
	(106, 'J.K Rowling'),
	(107, 'Mark Lee'),
	(108, 'Stephen King'),
	(109, 'Stephen King'),
	(110, 'Harper Lee'),
	(111, 'Roald Dahl'),
	(112, 'Roald Dahl'),
	(113, 'Paula Hawkins'),
	(114, 'Chimaamanda Ngozi Adichie'),
	(115, 'Dr. Seuss'),
	(116, 'Dr. Seuss'),
	(117, 'Dr. Seuss'),
	(118, 'David Guterson'),
	(119, 'Michelle Obama'),
	(120, 'Maya Angelou')
SELECT * FROM tbl_authors

/* Procedures */

-- Number of copies of The Lost Tribe at Sharpstown
CREATE PROCEDURE LostTribeSharpstown
AS
BEGIN
	SELECT tbl_books.title AS 'Title', tbl_branch.branch_name AS 'Branch', tbl_copies.number_of_copies AS 'Copies'
		FROM tbl_copies
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
		INNER JOIN tbl_books ON tbl_books.book_id = tbl_copies.book_id
		WHERE title = 'The Lost Tribe' AND branch_name = 'Sharpstown'
	;
END

-- Number of copies of The Lost Tribe at each branch
CREATE PROCEDURE LostTribeCopies
AS
BEGIN
	SELECT tbl_books.title AS 'Title', tbl_branch.branch_name AS 'Branch', tbl_copies.number_of_copies AS 'Copies'
		FROM tbl_copies
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
		INNER JOIN tbl_books ON tbl_books.book_id = tbl_copies.book_id
		WHERE title = 'The Lost Tribe'
	;
END

-- Borrowers who have no books checked out
CREATE PROCEDURE BorrowersNoBooks
AS
BEGIN
	SELECT tbl_borrowers.name AS 'Name', COUNT(tbl_loans.card_no) AS 'Total Books Checked Out'
		FROM tbl_loans
		FULL OUTER JOIN tbl_borrowers ON tbl_borrowers.card_no = tbl_loans.card_no
		GROUP BY tbl_borrowers.name
		HAVING COUNT(tbl_loans.card_no) = 0
	;
END

-- Books due today at Sharpston 
CREATE PROCEDURE BooksDueSharpston @date DATE
AS
BEGIN
	SELECT tbl_books.title AS 'Title', tbl_borrowers.name AS 'Name', tbl_borrowers.address AS 'Address'
		FROM tbl_loans
		INNER JOIN tbl_books ON tbl_books.book_id = tbl_loans.book_id
		INNER JOIN tbl_borrowers ON tbl_borrowers.card_no = tbl_loans.card_no
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_loans.branch_id
		WHERE branch_name = 'Sharpstown' AND date_due = @date
	;
END

-- Total books checked out from each branch
CREATE PROCEDURE TotalBooksOut
AS
BEGIN
	SELECT tbl_branch.branch_name AS 'Branch', COUNT(tbl_loans.branch_id) AS 'Total Books Checked Out'
		FROM tbl_loans
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_loans.branch_id
		GROUP BY tbl_branch.branch_name
	;
END

-- Borrowers with more than 5 books
CREATE PROCEDURE BorrowersBooksOver5
AS
BEGIN
	SELECT tbl_borrowers.name AS 'Name', tbl_borrowers.address AS 'Address', COUNT(tbl_loans.card_no) AS 'Total Books Checked Out'
		FROM tbl_loans
		INNER JOIN tbl_books ON tbl_books.book_id = tbl_loans.book_id
		INNER JOIN tbl_borrowers ON tbl_borrowers.card_no = tbl_loans.card_no
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_loans.branch_id
		GROUP BY tbl_borrowers.name, tbl_borrowers.address
		HAVING COUNT(tbl_loans.card_no) > 5
	;
END

-- Number of copies of books by Stephen King in Central
CREATE PROCEDURE StephenKingCentral
AS
BEGIN
	SELECT tbl_books.title AS 'Title', tbl_copies.number_of_copies AS 'Copies', tbl_branch.branch_name AS 'Branch'
		FROM tbl_copies
		INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
		INNER JOIN tbl_books ON tbl_books.book_id = tbl_copies.book_id
		INNER JOIN tbl_authors ON tbl_authors.book_id = tbl_books.book_id
		WHERE author_name = 'Stephen King' AND branch_name = 'Central'
	;
END

EXEC LostTribeSharpstown
EXEC LostTribeCopies
EXEC BorrowersNoBooks
EXEC BooksDueSharpston @date = '3-9-2019'
EXEC TotalBooksOut
EXEC BorrowersBooksOver5
EXEC StephenKingCentral