-- ==============================
-- LIBRARY MANAGEMENT DATABASE
-- ==============================

CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- ------------------------------
-- TABLE: users
-- Stores user login & profile data
-- ------------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL
);USE library_db;
SHOW TABLES;
DESC users;
DESC books;
DESC borrows;


-- ------------------------------
-- TABLE: books
-- Stores all book details
-- ------------------------------
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    description TEXT,
    available BOOLEAN DEFAULT TRUE
);

-- ------------------------------
-- TABLE: borrow
-- Tracks borrowed books
-- ------------------------------
CREATE TABLE borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    borrow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- ------------------------------
-- SAMPLE DATA (Optional)
-- ------------------------------
INSERT INTO books (title, author, description, available) VALUES
('The Alchemist', 'Paulo Coelho', 'A novel about destiny and purpose.', TRUE),
('1984', 'George Orwell', 'Dystopian novel about totalitarian control.', TRUE),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Story of wealth and lost dreams.', TRUE);
USE library_db;
INSERT INTO books (title, author, description, available)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic novel about dreams and wealth', true),
('1984', 'George Orwell', 'Dystopian social science fiction', false),
('To Kill a Mockingbird', 'Harper Lee', 'Novel about racial injustice', true);