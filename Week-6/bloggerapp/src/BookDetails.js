import React from "react";
import BookItem from "./BookItem";

function BookDetails() {

    const books = [
        { id: 1, name: "React Basics", author: "Jordan Walke" },
        { id: 2, name: "Learning JavaScript", author: "Kyle Simpson" },
        { id: 3, name: "Node.js Guide", author: "Ryan Dahl" }
    ];

    return (
        <div>
            <h2>Book Details</h2>

            <ul>
                {
                    books.map(book =>
                        <BookItem
                            key={book.id}
                            book={book}
                        />
                    )
                }
            </ul>
        </div>
    );
}

export default BookDetails;