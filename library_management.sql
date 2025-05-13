CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Table: Author
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Table: Publisher
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255)
);

-- Table: Category
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Book
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    year_published INT,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Category(category_id),
    CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- Table: Book_Author (Many-to-Many)
CREATE TABLE Book_Author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Table: Member
CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    join_date DATE NOT NULL
);

-- Table: Loan
CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES Member(member_id)
); 