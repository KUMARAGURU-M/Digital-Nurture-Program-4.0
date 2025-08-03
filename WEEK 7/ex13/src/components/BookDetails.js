// src/BookDetails.js
import React from 'react';

function BookDetails({ books }) {
  const bookList = (
    <ul>
      {books.map((book) => {
        if (book.price > 0) {
          return (
            <div key={book.id}>
              <h3>{book.bname}</h3>
              <h4>{book.price}</h4>
            </div>
          );
        }
        return null;
      })}
    </ul>
  );

  return (
    <div className="st2">
      <h1>Book Details</h1>
      {bookList}
    </div>
  );
}

export default BookDetails;
