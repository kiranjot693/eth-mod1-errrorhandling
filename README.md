# Library Management System with error handling functions

This project is a part of Metacrafters ETH+AVAX course assessment.


This is a simple smart contract for managing a library system on the Ethereum blockchain using Solidity. The contract allows users to add books, borrow books, return books, and check the availability of books.

## Contract Overview

The `LibraryManagementSystem` contract consists of the following main functionalities:
- Adding new books to the library
- Borrowing books from the library
- Returning borrowed books to the library
- Checking the availability of books
- Attempting to borrow a book with error handling

## Prerequisites

- Solidity ^0.8.20
- An Ethereum development environment like Hardhat or Truffle
- 
## Contract Details

### State Variables

- `Book`: A struct representing a book with fields `bookId`, `title`, and `copiesAvailable`.
- `books`: A mapping from book ID to `Book` struct.
- `borrowedBooks`: A nested mapping to track which user has borrowed which book.
- `bookCount`: A counter to keep track of the total number of books.

### Events

- `BookAdded(uint bookId, string title, uint copiesAvailable)`: Emitted when a new book is added.
- `BookBorrowed(address user, uint bookId)`: Emitted when a book is borrowed.
- `BookReturned(address user, uint bookId)`: Emitted when a book is returned.

### Functions

- `addBook(string memory title, uint copiesAvailable)`: Adds a new book to the library.
- `borrowBook(uint bookId)`: Allows a user to borrow a book.
- `returnBook(uint bookId)`: Allows a user to return a borrowed book.
- `checkAvailability(uint bookId) public view returns (string memory title, uint copiesAvailable)`: Checks the availability of a book.
- `attemptBorrowBook(uint bookId)`: Attempts to borrow a book with error handling.
- `internalCheck(uint bookId) internal view`: An internal function to ensure book state consistency.

#author
Kiran jot
