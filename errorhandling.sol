// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LibraryManagementSystem {
    struct Book {
        uint bookId;
        string title;
        uint copiesAvailable;
    }

    mapping(uint => Book) public books;
    mapping(address => mapping(uint => bool)) public borrowedBooks;
    uint public bookCount;

    event BookAdded(uint bookId, string title, uint copiesAvailable);
    event BookBorrowed(address user, uint bookId);
    event BookReturned(address user, uint bookId);

    function addBook(string memory title, uint copiesAvailable) public {
        require(bytes(title).length > 0, "Book title cannot be empty");
        require(copiesAvailable > 0, "Number of copies must be greater than 0");

        bookCount++;
        books[bookCount] = Book(bookCount, title, copiesAvailable);

        emit BookAdded(bookCount, title, copiesAvailable);
    }

    function borrowBook(uint bookId) public {
        Book storage book = books[bookId];

        // Check if the book exists
        require(book.bookId != 0, "Book does not exist");
        
        // Check if copies are available
        require(book.copiesAvailable > 0, "No copies available to borrow");

        // Check if the user has already borrowed this book
        require(!borrowedBooks[msg.sender][bookId], "Book already borrowed");

        // Update book availability and record the borrowed book
        book.copiesAvailable--;
        borrowedBooks[msg.sender][bookId] = true;

        emit BookBorrowed(msg.sender, bookId);
    }

    function returnBook(uint bookId) public {
        Book storage book = books[bookId];

        // Check if the book exists
        require(book.bookId != 0, "Book does not exist");

        // Check if the user has borrowed this book
        require(borrowedBooks[msg.sender][bookId], "Book was not borrowed by you");

        // Update book availability and remove the borrowed record
        book.copiesAvailable++;
        borrowedBooks[msg.sender][bookId] = false;

        emit BookReturned(msg.sender, bookId);
    }

    function checkAvailability(uint bookId) public view returns (string memory title, uint copiesAvailable) {
        Book storage book = books[bookId];

        // Check if the book exists
        require(book.bookId != 0, "Book does not exist");

        // Return the book details
        return (book.title, book.copiesAvailable);
    }

    function attemptBorrowBook(uint bookId) public {
        Book storage book = books[bookId];

        // Check if the book exists
        if (book.bookId == 0) {
            revert("Book does not exist");
        }

        // Check if copies are available
        if (book.copiesAvailable == 0) {
            revert("No copies available to borrow");
        }

        // Check if the user has already borrowed this book
        if (borrowedBooks[msg.sender][bookId]) {
            revert("Book already borrowed");
        }

        // Update book availability and record the borrowed book
        book.copiesAvailable--;
        borrowedBooks[msg.sender][bookId] = true;

        emit BookBorrowed(msg.sender, bookId);
    }

    // Internal function to ensure book state consistency
    function internalCheck(uint bookId) internal view {
        Book storage book = books[bookId];
        assert(book.bookId > 0);  // Assert the book ID should always be positive
        assert(book.copiesAvailable >= 0);  // Assert copies available should not be negative
    }
}
